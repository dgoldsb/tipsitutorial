

class Entry:
    def __init__(self,line,labels=[]):
        stuff = line.split()

        self.id     = int(stuff[0])
        self.trr    = stuff[1]
        self.time   = float(stuff[2])
        self.offset = int(stuff[3])
        self.state  = stuff[-2]
        
        for lbl,val in zip(labels[3:],stuff[4:-2]):
            setattr(self,lbl,float(val))


class Path(list):
    def __init__(self,states,recross=None):
        """Extract path(s) from state vector"""

        path = [states[0]]
        for s in states:
            if path[-1] != s:
                path.append(s)
        list.__init__(self,path)
        self.states = states
        self._essential = path
        self.essential(recross)

    def __add__(self,other):
        """Join two paths"""
        return Path(self.states+other.states)

    def __iadd__(self,other):
        """Append a path. Copies original, similar like str.__iadd__"""
        return Path(self.states+other.states)

    def __str__(self):
        return " ".join(self)

    def __repr__(self):
        return "< Path object: " + "->".join(self) + " >"

    def essential(self,recross=None):
        """Determine/return essential path by applying recrossing rules"""
        if recross:
            path = ""
            ess  = "-".join(self)
            while path != ess:
                path = ess                
                for rule in recross:
                    ess = ess.replace(rule[0],rule[1])
            self._essential = ess.split("-")
        return self._essential


def main(argv=None):
    if argv == None:
        argv = sys.argv

    # Read data
    lambd  = open(argv[1])
    labels = lambd.readline().split()
    data   = [ Entry(i,labels) for i in lambd if i.strip() ]
    lambd.close()

    path = Path([ i.state for i in data ],recross=[("A-0-A","A"),("B-0-B","B")])
    print "\n", "->".join(path), "\n"
    print "->".join(path.essential()), "\n"
    print "".join(i.state for i in data), "\n"

    # Classification of path according to state defenitions
    states  = [ i.state  for i in data ]

    # If the system is not in a state, the state is '0'
    between = [ i == "0" for i in states ]
    
    # Breaks mark point before change of state
    breaks = [ (k,states[k:k+2]) for k,(i,j) in enumerate(zip(between,between[1:])) if i!=j ]
    
    # If we are in a state and go to another state, the path is marked 
    # If we end up in the same state, the path is ignored.
    paths = [ (i[0],j[0]+1,i[1][0],j[1][1]) for i,j in zip(breaks,breaks[1:]) if i[1][1] == '0' and i[1][0] != j[1][1] ] 
    
    print breaks, "\n"

    print paths, "\n"


if __name__ == "__main__":
    sys.exit(main())
