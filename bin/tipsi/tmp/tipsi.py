#!/usr/bin/env python

"""
Transition Interface/Path Sampling Identifier

(c)2014 Tsjerk A. Wassenaar, PhD
University of Amsterdam
"""

# In a way, this is just a molecular calculator...
# If there are no states defined, behave as such.
#
# if states/interfaces:
#     --> TPS/TIS
# else:
#     --> calculator

# TODO:
#
# If ->0-> is not in essential_path
# then raise an error:
#   - either the state definitions are wrong or
#   - the sampling resolution is too low
#
# If there are multiple transitions (or just whatever):
# there is only ONE transition in the initial path
# but the initial trajectory may have multiple transitions,
# and the first transition is selected randomly.
# Or one can use it for multiple runs.
#

# Python modules
import sys
import os
import time
import random
import collections

# Tipsi modules
import calculator
import gmx
import sparser


options = sparser.Options([
    #   opt          attribute        type  num     default   multi    description
    (  "--help",    "help",           bool,   0,     False,    False,   "Print help and exit"),
    (  "-tpr",      "tpr",            str,    1,      None,    False,   "Run input file (TPR)"),
    (  "-trr",      "trajectory",     str,    1,      None,    False,   "Input trajectory (TRR)"),
    (  "-parent",   "parent",         str,    1,      None,    False,   "Parent trajectory (TRR)"),
    (  "-lmb",      "lmb",            str,    1,      None,    False,   "Input lambda file (DAT)"),
    (  "-par",      "parfile",        str,    1,      None,    False,   "Input TPS parameter file"),
    (  "-ndx",      "index",          str,    1,      None,     True,   "Input index file"),        
    (  "-out",      "out",            str,    1, "lambda.dat", False,   "Lambda output file"),
    (  "-pi",       "pathinfiles",     str,    1,     None,     True,   "Path input file(s)"),
    (  "-po",       "pathoutfile",    str,    1,      None,    False,   "Path output file"),
    (  "-log",      "log",            str,    1,  "tipsi.log", False,   "Output file"),
    (  "-fw",       "forward",        str,    1,      None,    False,   "Forward shooting point"),
    (  "-bw",       "backward",       str,    1,      None,    False,   "Backward shooting point"),

    "Monitoring options:",
    (  "-offset",   "offset",         int,    1,         0,    False,   "Trajectory file offset"),
    (  "-pid",      "pid",            int,    1,      None,    False,   "PID to monitor"),
    (  "-sleep",    "interval",     float,    1,       600,    False,   "Interval between checks for active processes"),

    "Molecular/mathematical expressions evaluated in context of reference and frame:",
    (  "-init",     "init",           str,    1,      None,     True,   "Expressions evaluated before loading trajectory: -I const=expression"),
    (  "-E",        "expressions",    str,    1,      None,     True,   "Expressions not saved to output file: -E tmp=expression"),
    (  "-P",        "parameters",     str,    1,      None,     True,   "Parameter expressions: -P param=expression"),
    (  "-S",        "states",         str,    1,      None,     True,   "State expressions: -S state=expression"),
    (  "-I",        "interfaces",     str,    1,      None,     True,   "Interface expressions: -I iface=expression"),
    (  "-B",        "bias",           str,    1,      None,     True,   "Shooting point selection bias expressions: -B expression"),
    (  "-Q",        "stop",           str,    1,      None,    False,   "Stop condition: -Q expression"),
    (  "-O",        "print",          str,    1,      None,     True,   "Print to terminal: -P expression"),
    (  "-W",        "write",          str,    2,      None,     True,   "Write to file: -W file expression"),

    "Path options",
    (  "-R",        "recrossing",     str,    1,      None,     True,   "Recrossing rules: -R A-I-A=A"),
    (  "-2way",     "twowayprob",     str,    1,       "0",    False,   "Probability of two-way shooting"),
    (  "-rand",     "randomize",      str,    1,       "0",    False,   "Velocity randomization"),
    (  "-minlen",   "minpathlength",  int,    1,        10,    False,   "Minimum path length"),

    "Further TPS/MD control:",
    (  "-maxf",     "maxframes",      int,    1,        -1,    False,   "Maximum number of frames per run"),
    (  "-mdp",      "mdparam",        str,    1,      None,     True,   "MD parameters: -mdp par=val"),
    ])


class Phase(collections.MutableMapping):
    _meta = ["state", "time", "stop", "file","offset"]

    def __init__(self, *args, **kwargs):
        for i in self._meta:
            setattr(self, i, None)
        self.store    = dict()
        self.update(dict(*args,**kwargs))

    def __setitem__(self,key,value):
        if key in self._meta:
            setattr(self,key,value)
        else:
            self.store[key] = value

    def __getitem__(self,key):
        if key in self._meta:
            return getattr(self,key)
        else:
            return self.store[key]

    def __iter__(self):
        return iter(self.store)

    def __len__(self):
        return len(self.store)

    def __delitem__(self,key):
        del self.store[key]

    def __str__(self):
        return "%s %s %f %s %d %s"%(self.state, str(self.stop), float(self.time), self.file, int(self.offset), str(self.store))

    def tostr(self,dfmt):
        return dfmt.format(file=self.file, time=self.time, state=self.state, offset=self.offset, stop=self.stop, **self.store)


class Path(collections.Sequence):
    def __init__(self, *paths):
        self._log    = None
        self._header = None
        if paths:
            paths = list(paths)
            if type(paths[0]) == str:
                self.from_file(paths.pop(0))
            else:
                self.data = [paths[0][0]]
            # Stitch paths together; remove double phases
            for traj in paths:
                if type(traj) == str:
                    traj = Path(traj)
                for phase in traj:
                    if phase != self.data[-1]:
                        self.data.append(phase)
        else:
            self.data = []

    def __len__(self):
        return len(self.data)

    def __getitem__(self,item):
        if type(item) == int:
            return self.data[item]
        elif type(item) == slice:
            start = self.find(item.start) if item.start != None else 0
            stop  = self.find(item.stop)  if item.stop  != None else len(self)-1  
            step  = item.step
            if step == None and stop < start:
                step = -1
                stop = stop-1 # Inclusive
            else:
                stop = stop+1 # Inclusive
            return Path(self.data[start:stop:step])

    def log(self,filename=None):
        """Set or disable logging of entries"""
        if filename:
            self._log = open(filename,"w")
        else:
            if self._log:
                self._log.close()
            self._log = None

    def append(self,item):
        """Add an item to the list, and write an entry in the log if logging"""
        self.data.append(item)
        if self._log:
            if not self._header:
                self._header  = self.data[-1]._meta + self.data[-1].keys()
                self._headstr = "\t".join("{"+i+"}" for i in self._header) 
                for i in header:
                    self._log.write("\t{}".format(i))
            self._log.write("\n")
            self._log.write("{:5d}".format(len(self)))
            self._log.write(self.data[-1].tostr(self._headstr))
            self._log.flush()

    def extend(self,items):
        """Add items to the list, and write the entries in the log if logging"""
        n = len(self)
        self.data.extend(Path(items))
        if self._log:
            if not self._header:
                self._header = self.data[n]._meta + self.data[n].keys()
                self._headstr = "\t".join("{"+i+"}" for i in self._header) 
                for i in self._header:
                    self._log.write("\t{}".format(i))
                self._log.write("\n")
            for i in range(n,len(self)):
                self._log.write(self.data[i].tostr(self._headstr))
                self._log.write("\n")
            self._log.flush()

    def find(self,item):
        """Find the index of an entry"""
        if type(item) == int:
            return item
        for num,phase in enumerate(self.data):
            if phase.offset == item.offset and phase.file == item.file:
                return num

    def from_file(self,filename):
        """Read a path from file"""
        with open(filename) as f:
            header = f.readline().split()
            self.data = [Phase(zip(header,line.split())) for line in f]

    def to_file(self,filename):
        """Write a path to file"""
        with open(filename,"w") as f:
            header = self.data[0]._meta + self.data[0].keys()
            for i in header:
                f.write("\t{}".format(i))
            f.write("\n")
            for phase in self:
                for key in header:
                    f.write("\t{}".format(phase[key]))
                f.write("\n")
                
    def segments(self,*var):
        """
        Determine segments in the path.
        A segment is defined as a path through a single state, 
        flanked by the last, respectively first phase in a
        another state: x-y-...-y-z
        """
        a = [self.data[0][v] for v in var]
        for j in range(1,len(self)):
            b = [ self.data[j][v] for v in var ]
            if b != a:
                i = j-1
                break
        for k in range(j,len(self)):
            c = [ self.data[k][v] for v in var ]
            if c != b:
                yield self.data[i],self.data[j],self.data[k]
                b,i,j = c,j,k

    def random(self,margin=0.1,bias=None):
        """
        Select a random phase-point from a path with 
        a given excluded margin from both sides.
        """
        n = len(self)
        if -1 <= margin < 1:
            margin = int(margin*n)
        return self.data[ random.randint(margin,n-margin-1) ]
        

def float_or_int(x):
    y = float(x)
    if -1 < y < 1:
        return y
    else:
        return int(x)


def inttime(x):
    """Time in seconds from integer, float or string"""
    if type(x) in (int,float) or (type(x) == str and x.isdigit()):
        return int(x)
    else:
        tm = [int(i) for i in maxwaittime.split(":")]
        tt = tm.pop() 
        if tm:
            tt += 60*tm.pop()
        if tm:
            tt += 3600*tm.pop()
        if tm:
            tt += 86400*tm.pop()
        return tt


class TPSError(Exception):
    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return self.msg


class TPS:
    __tags = (
        "init",         
        "expressions",  
        "parameters",   
        "print",
        "write",
        "states",       
        "interfaces",   
        "bias",
        "recrossing",
    )
    __par = (
        ("maxframes",              int,    0), # Maximum number of frames per simulation
        ("twoway",               float,    0), # Two-way shooting probability
        ("oneway",               float,    0), # One-way shooting probability
        ("randomize",            float,    0), # Velocity randomization. 0: none, 2: complete
        ("minpathlength",          int,   10), # Minimum length to accept path
        ("margin",        float_or_int,  0.1), # Margin of path to exclude from shooting point selection
        ("weightedpaths",          str,   ""), # Weighting of paths for shooting point selection
        ("maxwaittime",           time,    0), # Maximum time to wait for startup
        ("framesperstep",          int,   10), # Number of frames between monitoring cycles
    )

    def __init__(self, **kwargs):
        options = kwargs.get("options")

        # Lists of expressions. Processed in the order given.
        for tag in self.__tags:
            setattr( self, tag, [] )

        # If a parameter file was given on the command line
        # that is processed first. Additional parameters
        # overrule or add to the parameters from the file. 
        parfile = getattr(options,"parfile",kwargs.get("parfile"))
        if parfile:
            self.from_file(parfile)

        s = kwargs.get("stop", getattr(options, "stop", None))
        if s:
            self.stop = s
        
        # Lists of expressions. Processed in the order given.
        for tag in self.__tags:
            getattr(self,tag).extend(getattr(options,tag,[]))
            getattr(self,tag).extend(kwargs.get(tag,[]))

        for par, expr, default in self.__par:
            if kwargs.get(par) is not None:
                setattr(self, par, expr(kwargs.get(par)))
            elif not hasattr(self, par):
                setattr(self, par, default)

        # Recrossing rules:
        self.recrossing = [ i.split("=") for i in self.recrossing ]
        self.recrossing = [ (i.strip(),j.strip()) for i,j in self.recrossing ]


    def from_file(self,filename):
        with open(filename) as par:
            stuff = [ line.strip() for line in par ]

        # Remove comments and blank lines
        stuff = [ line for line in stuff if line and not line[0] in ";#" ]
        for line in stuff:
            eqs  = line.find(" ")
            tag  = line[:eqs].strip().lower()
            line = line[eqs:].strip()

            if "stop".startswith(tag):
                self.stop = line
            else:
                for t in self.__tags:
                    if t.startswith(tag):
                        getattr(self,t).append(line)
                for par, expr, default in self.__par:
                    if par.startswith(tag):
                        setattr(self,par,expr(line[line.startswith('='):].strip()))

        # Prepare files for writing
        writestuff = [ i.split() for i in self.write ]
        self.write = []
        for i in writestuff:
            f = open(i[0],"w")
            f.write("_".join(i[1:]))
            f.write("\n")
            self.write.append((f, " ".join(i[1:])))


    def __str__(self):
        """"""
        out = []
        for t in self.tags:
            for e in getattr(self,t):
                out.append("%s %s"%(t,e))
        for p in self.par:
            for v in getattr(self,p):
                out.append("%s %s"%(p,v))


def checkPid(pid):
    """Check if the program with given pid is still active"""
    try:
        os.kill(pid,0)
        return True
    except OSError:
        return False


class _Path(list):
    def __init__(self,states,recross=None):
        """Extract path(s) from state vector"""

        start = State("|", state=states[0])
        path  = [start]
        for s in states:
            if path[-1] != s:
                path.append(s)
        path.append(State("|", state=states[-1]))
        list.__init__(self,path)
        self.states = states
        self._essential = path
        self.essential(recross)

    def __add__(self,other):
        """Join two paths"""
        return _Path(self.states+other.states)

    def __iadd__(self,other):
        """Append a path. Copies original, similar like str.__iadd__"""
        return _Path(self.states+other.states)

    def __str__(self):
        return " ".join(self)

    def __repr__(self):
        return "< _Path object: " + "->".join(self) + " >"

    def essential(self,recross=None):
        """Determine/return essential path by applying recrossing rules"""
        # To keep track of files, times and positions, we use State objects
        # rather than normal strings.
        # Because a State is a string with metadata, we cannot use
        # str.replace to apply recrossing rules. 
        if recross:
            rc = [ (i.split("-"),j.split("-")) for i,j in recross ]
            self._essential = list(self)
            changed = True
            while changed:
                changed = False
                # We go through the path backwards, such that the indices
                # in the range always stay correct. 
                for i in range(len(self._essential),0,-1):
                    for rule in rc:
                        r = slice(i,i+len(rule[0]))
                        if self._essential[r] == rule[0]:
                            # Copy the state metadata to the new state(s)
                            new = [ State(j,state=self._essential[i]) for j in rule[1] ]
                            self._essential[r] = new
                            changed = True
                    if changed:
                        break
        return self._essential


def write_tpr(tpr, filename, **kwargs):
    """Write a tpr file with new parameters as given in kwargs"""
    if type(tpr) == str:
        tpr = gmx.open(tpr)
    
    for par, val in kwargs.items():
        if par == "maxframes":
            tpr.set("nsteps", val*tpr.get("nstxout"))
        else:
            tpr.set(par,val)

    with open(filename,"w") as out:
        out.write(str(tpr))
    

def processFrame(frame, calc, par):
    """Run one frame through calculator"""

    # Register frame in calculator
    calc["F"]     = frame
    calc["frame"] = frame.x()
    calc["box"]   = frame.box()

    # Evaluate general/parameters/state/interface expressions
    #   - Expressions are used to perform auxiliary calculations and are not written
    #   - Parameters  are descriptive variables and are written to the output
    #   - States      are used to classify a configuration and the relevant state(s) are written
    #   - Interfaces  are used to classify a configuration and the relevant interfaces are written
    state  = ""
    phase  = Phase([("time",frame.time),("offset",frame.offset)])

    for expressionSet in ["expressions", "parameters", "states", "interfaces"]:
        calc.clear()
        result = calc(*getattr(par,expressionSet))

        # Registering
        if expressionSet == "parameters":
            phase.update(calc.result.items())
        elif expressionSet == "states":
            state = "".join(i for i,j in calc.result.items() if j)            
            phase["state"] = state
        elif expressionSet == "interfaces":
            state += "".join(i for i,j in calc.result.items() if j)
            phase["state"] = phase.get("state","") + "".join(i for i,j in calc.result.items() if j)

    # Printing
    for p in getattr(par,"print"):
        do_print = calc.get(p)
        if do_print is not None:
            print "p =",do_print

    # Writing to file
    for f,w in getattr(par,"write"):
        do_write = calc.get(w)
        if do_write is not None:
            f.write("%10.5f "%frame.time)
            f.write(str(do_write))
            f.write("\n")

    stop = calc(par.stop)
    phase["stop"] = stop

    return phase


def process_trajectory(trj, offset, calc, par, pid=None,quiet=True):
    """Classify frames in a trajectory"""
    position = offset
    trr      = gmx.open(trj,offset=offset)
    pidAlive = pid and checkPid(pid)
    if pid and not pidAlive:
        print "No active process associated with PID (anymore)", pid
        print "Only processing trajectory (now)"
    i = 0
    nframes = len(trr)
    path = Path()
    if nframes:
        print "Processing {} frames".format(len(trr))
        for frame in trr:
            i += 1
            position = trr.pos
            phase    = processFrame(frame, calc, par)            
            phase["file"] = trj
            path.append(phase)
            if phase["stop"] and pid and pidAlive:
                print "Stop condition met. Killing job with PID", pid
                os.kill(pid,15)
                pidAlive = False
            if not quiet:
                print "\r----- {:5.2f}%".format(100*(position-offset)/(trr.size-offset)),
        if not quiet:
            print
    trr.stream.close()

    return path, position


def do_trajectory(trj, options, par, offset=None):
    """Score a trajectory according to the options"""

    options.tpr   = gmx.open(options.tpr)
    options.index = gmx.Index(*options.index)

    if options.pathinfiles:
        path = Path(options.pathinfiles[0])
    else:
        path = Path()

    path.log(options.out)

    if offset == None:
        position = options.offset 
    else:
        position = 0

    # Start and initialize the calculator
    calc = calculator.Calculator(ref=options.tpr.x,ndx=options.index)
    calc(*par.init)

    # Give some time to start up
    processIsActive = True
    startuptime = time.time()
    while not (os.path.exists(trj) and os.stat(trj).st_size):
        if par.maxwaittime and (time.time() - startuptime > par.maxwaittime):
            raise TPSError("No trajectory file generated within maximum wait time")
        time.sleep(options.interval)

    # Monitor
    while processIsActive:
        tpath, position = process_trajectory(trj, position, calc, par, options.pid)
        path.extend(tpath)
        nframes = len(tpath)
        # Update interval to get approximately N frames
        if par.framesperstep and False:
            options.interval *= ( (par.framesperstep/nframes) if nframes else 2 )
        processIsActive = options.pid and checkPid(options.pid)
        if processIsActive:
            # Wait a specified time
            time.sleep(options.interval)

    return path


def find_transitions(path, options, par):
    """Determine transitions in path"""
    transitions = []
    parstates   = set([ i.split('=')[0].strip() for i in par.states ])
    interfaces  = set([ i.split('=')[0].strip() for i in par.interfaces ])

    for segment in path.segments("state"):
        if (segment[1]["state"] in interfaces and
            segment[0]["state"] != segment[2]["state"]):
            transitions.append(path[segment[0]:segment[2]])

    return transitions


def write_transitions(path, options, par):
    """Determine transitions in path and write these to file"""

    transitions = find_transitions(path, options, par)

    if not transitions:
        return None

    pathfile = options.pathoutfile
    if pathfile:
        if not "%" in pathfile:
            dot = pathfile.rfind(".")
            pathfile = pathfile[:dot]+".%d"+pathfile[dot:]
        for num,trans in enumerate(transitions):
            trans.to_file(pathfile%num)

    return transitions


def select_transition( transitions, par ):
    """Select path to randomly with bias defined in par"""
    if par.weightedpaths == "length":
        select = [i for p in transitions for i in len(p)*[p]]
    elif par.weightedpaths.startswith("max"):
        lengths = [ len(p) for p in transitions ]
        maxlen  = max(lengths)
        select  = [p for p,i in zip(transitions, lengths) if i==maxlen]
    elif par.weightedpaths == "bias":
        select  = [[i for p in transitions for i in p]]
    else:
        select = transitions
    return random.choice(select)


class ShootingPoint:
    def __init__( self, tpr, path, margin, bias ):

        self.path   = path

        # New shooting point TPR forward and/or backward    
        self.shoot = path.random(margin=margin,bias=bias)        
        
        self.time   = self.shoot.time
        self.file   = self.shoot.file
        self.offset = self.shoot.offset
        self.str    = str(self.shoot)

        trj         = gmx.open(self.shoot.file,offset=int(self.shoot.offset))
        frame       = trj.next()
        self.x      = frame.x()
        self.v      = frame.v()
        self.box    = frame.box()

        self.tpr    = gmx.open(options.tpr)
        self.dt     = self.tpr.get('dt')

        # Check the integrator in the TPR file. Preferrably, runs should use the 
        # velocity Verlet algorithm (md-vv), to have the velocities at whole time steps.
        # The default is the Leap-Frog algorithm (md), which stores velocities at 
        # half time steps. In this case, the velocities at whole time step can be 
        # estimated by averaging over t +/- dt/2. 
        # The enum index of the default (leap-frog) integrator is 0.

        if not self.tpr.get('integrator'):
            self.v = (self.v + trj.next().v())/2

        trj.close()

    def __str__(self):
        return self.str

    def write_tpr( self, filename, direction=1, **kwargs ):
        write_tpr(self.tpr, filename,  tinit=self.time, x=self.x, v=self.v, box=self.box, dt=direction*abs(self.dt), **kwargs)

    def write_path( self, filename, direction=None ):
        if not direction:
            slc = 0
        elif direction.startswith("b"):
            slc = slice(self.path[-1],self.path.index(self.shoot)-1,-1)
        else:
            slc = slice(None,self.path.index(self.shoot)-1,1)
        self.path[slc].to_file(filename)


def main(argv=None):

    if argv == None:
        argv = sys.argv[1:]

    mode = None
    if argv and not argv[0].startswith("-"):
        mode = argv.pop(0)

    options.parse(argv)

    if options.help:
        print __doc__
        print options
        return 0

    # Parse TPS parameters (cmdline and/or file)
    par = TPS(options=options) 


    # Read in all lambda files. These correspond to a tree.
    # 
    #          start                    shoot                  end
    # INIT:      <------------------------+--------------------->
    #                                     |
    # RUN1F:                              |-----+---------->
    #                                           |
    # RUN2B:                  <-----------------|

    print "Running %s in %s mode" % (__file__,mode.upper())

    if mode == "check":
        trans     = find_transitions(Path(*options.pathinfiles))
        exit_code = 0 if trans is not [] else 1

    if mode == "score" or mode == "monitor":
        path      = do_trajectory(options.trajectory, options, par)
        trans     = write_transitions(path, options, par)
        exit_code = 0 if trans is not None else 1

    if mode == "shoot":
        # New shooting point TPR forward and/or backward    
        transitions = find_transitions( Path(*options.pathinfiles), options, par )
        shoot       = ShootingPoint( options.tpr, select_transition( transitions, par ), par.margin, par.bias )

        print "SHOOTING POINT:", shoot

        if random.random() < par.twoway:
            # Two-way shooting. There is no parent branch, only a parent point.
            msg = "Writing FORWARD and BACKWARD shooting points from frame t={} at position {} from file {}."
            print msg.format(shoot.time, shoot.offset, shoot.file)
            shoot.write_tpr( options.forward, maxframes=par.maxframes )
            shoot.write_tpr( options.backward, direction=-1, maxframes=par.maxframes )
            shoot.write_path( options.pathoutfile )
        elif random.random() < 0.5:
            # One-way, forward shooting. The parent branch is whatever up to the shooting point
            msg = "Writing FORWARD shooting point from frame t={} at position {} from file {}."
            print msg.format(shoot.time, shoot.offset, shoot.file)
            shoot.write_tpr( options.forward, maxframes=par.maxframes )
            shoot.write_path( options.pathoutfile, "forward" )
        else:
            msg = "Writing BACKWARD shooting point from frame t={} at position {} from file {}."
            print msg.format(shoot.time, shoot.offset, shoot.file)
            shoot.write_tpr( options.backward, direction=-1, maxframes=par.maxframes )
            shoot.write_path( options.pathoutfile, "backward" )
        
        exit_code = 0

    return exit_code


if __name__ == "__main__":
    sys.exit(main())
