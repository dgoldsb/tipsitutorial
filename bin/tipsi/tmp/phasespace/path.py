#!/usr/bin/env python


import collections
import random


class Phase(collections.MutableMapping):
    _meta = ["file","offset","time","state","stop"]

    def __init__(self, *args, **kwargs):
        self.file     = None
        self.offset   = None
        self.time     = None
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
        return "%s %d %f %s"%(self.file, int(self.offset), float(self.time), str(self.store))


class Path(collections.Sequence):
    def __init__(self, *paths):
        if len(paths) == 1 and type(paths[0]) == str:
            self.from_file(paths[0])
        else:
            # Stitch paths together; remove double phases
            self.data = [paths[0][0]]
            for traj in paths:
                for phase in traj:
                    if phase != self.data[-1]:
                        self.data.append(phase)

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
    
    def find(self,item):
        if type(item) == int:
            return item
        for num,phase in enumerate(self.data):
            if phase.offset == item.offset and phase.file == item.file:
                return num

    def from_file(self,filename):
        with open(filename) as f:
            header = f.readline().split()
            self.data = [Phase(zip(header,line.split()[1:])) for line in f]

    def to_file(self,filename):
        with open(filename,"w") as f:
            header = self.data[0]._meta + self.data[0].keys()
            for i in header:
                f.write("\t{}".format(i))
            f.write("\n")
            for num,phase in enumerate(self):
                f.write("{:5d}".format(num))
                for key in header:
                    f.write("\t{}".format(phase[key]))
                f.write("\n")
                
    def segments(self,*var):
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
        


def main(argv=None):
    if argv == None:
        argv = sys.argv
    
    if len(argv) > 1:
        f = Path(argv[1])

    transpath = []
    for segment in f.segments("state"):
        if segment[1]["state"] == "I" and segment[0]["state"] != segment[2]["state"]:
            transpath.append(f[segment[0]:segment[2]])
            break

    f[segment[0]:segment[2]].to_file("testtrans.log")

    n = random.choice(transpath[0])
    p = Path(f[0:n],f[n:])
    p.to_file("testpath.log")
    print n
    for i in p:
        print i
    
    
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(main())
