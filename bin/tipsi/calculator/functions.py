
## ------------------------------##
## MATH FUNCTIONS FOR CALCULATOR ##
## ------------------------------##

#
# The functions which are defined here are 
# automatically registered in the calculator.
# Functions and objects beginning with '_'
# are ignored. 
#

import numpy, math

# General - These need to be bound to the module
len   = len
max   = max
min   = min
list  = list
tuple = tuple
int   = int
float = float
bool  = bool

# Basic math
exp   = numpy.exp
log   = numpy.log
sqrt  = numpy.sqrt
floor = numpy.floor
ceil  = numpy.ceil
round = numpy.round
abs   = numpy.abs
sign  = numpy.sign
sum   = numpy.sum

# Trigonometry, powered by numpy
sin   = numpy.sin
cos   = numpy.cos
tan   = numpy.tan
asin  = numpy.arcsin
acos  = numpy.arccos
atan  = numpy.arctan
atan2 = numpy.arctan2

# Linear algebra
diag  = numpy.diag
dot   = numpy.dot
inv   = numpy.linalg.inv
eig   = numpy.linalg.eig
svd   = numpy.linalg.svd
cross = numpy.cross


def pcom(coord,box,weights=None):
    """
        Calculate periodic center of mass.
    """
    if len(coord.shape) == 1:
        coord = coord.reshape((1,-1))
    inv = 2*numpy.pi*numpy.linalg.inv(box.T)
    phs = numpy.dot(coord,inv)
    cs  = numpy.average(numpy.cos(phs),axis=0,weights=weights) 
    sn  = numpy.average(numpy.sin(phs),axis=0,weights=weights)
    return numpy.dot(numpy.arctan2(sn,cs),box.T)/(2*numpy.pi)


def com(coord, box=None, weights=None):
    """
        Calculate center of mass
    """
    if box is None:
        return numpy.average(coord,axis=0,weights=weights)
    else:
        return pcom(coord, box, weights)


def dist_euclidean(x,y=None):
    """Generate a 'coordinate' of the solution at a time"""
    if y == None:
        y = x
    d = numpy.zeros((x.shape[0],y.shape[0]),dtype="float64")
    for i in xrange(x.shape[1]):
        diff2 = x[:,i,None] - y[:,i]
        diff2 **= 2
        d += diff2
    numpy.sqrt(d,d)
    return d


def dist_manhattan(x,y=None):
    """Generate a 'coordinate' of the solution at a time"""
    if y == None:
        y = x
    d = numpy.zeros((x.shape[0],y.shape[0]),dtype="float64")
    for i in xrange(x.shape[1]):
        diff2 = x[:,i,None] - y[:,i]
        numpy.absolute(diff2, diff2)
        d += diff2
    return d


def pdist(a,b=None,box=None,what=None):
    """
    Calculate distances for two vectors/arrays in a periodic system.
    """

    # This routine was checked against GROMACS' mindist.
    print(box)
    # Convert Cartesian coordinates to box coordinates
    inv = numpy.linalg.inv(box)
    a   = numpy.dot(a, inv)

    if b == None:
        b = a
    else:
        b = numpy.dot(b, inv)

    # Determine difference vectors in box coordinates
    # a(i,j), b(k,j) -> d(i,j,k)
    d  = (numpy.asarray(a.reshape((-1,3,1))) - numpy.asarray(b.reshape((-1,3,1))).T)

    # Truncate difference vectors to approximate shortest periodic distance
    d -= numpy.floor(d+0.5)

    # Multiply difference vectors with box:
    # d(i,j,k), box.T(l,j) -> sum over j -> tmp(i,k,l)
    # Square, sum over l, take sqrt and return resulting matrix 
    return numpy.sqrt((numpy.einsum("ijk,lj",d,box.T)**2).sum(axis=2))
    

def cdist(a,b=None,what="euclidean"):    
    """
    Calculate distance for two numbers/vectors/arrays or thus coerceable objects.
    """
    if b == None:
        b = a
    if len(a.shape) == 1:
        if len(b.shape) == 1:
            return numpy.sqrt(numpy.sum((a-b)**2))
        else:
            a = a.reshape((1,-1))
    if len(b.shape) == 1:
        b = b.reshape((1,-1))
    return dist_euclidean(a,b)


def dist(a,b=None,box=None,what="euclidean"):
    """
    dist(a,b=None,box=None,what="euclidean") -> [[distance(a[0,:],b[0,:], ...], ...]

    Calculate distance matrix for arrays a and b.

    If box is given, periodic distances will be calculated.

    Default distance metric is euclidean. Alternatives are ...
    """

    if box is None:
        return cdist(a,b,what)
    else:
        return pdist(a,b,box,what)


def distance(a,b):    
    """
    Calculate squared norm (Euclidean distance/Frobenius norm)
    for two numbers/arrays or thus coerceable objects.
    """
    return numpy.sqrt(numpy.sum((a-b)**2))


def normalize(a):
    return a/numpy.sqrt((a**2).sum())


def angle(a,b,c=None):
    if not c is None:
        a,b = a-b, c-b
    ip = numpy.dot(normalize(a).T, normalize(b))
    if ip >= 1:
        phi =  math.pi
    elif ip <= -1:
        phi = -math.pi
    else:
        phi =  math.acos(ip)
    return math.copysign(phi, ip)


def cosangles(a,b,c=None,pairwise=False):
    if not c is None:
        a,b = a-b, c-b
    a   = a.T/numpy.sqrt(numpy.sum(a**2,axis=1))
    b   = b.T/numpy.sqrt(numpy.sum(b**2,axis=1))
    ips = numpy.sum(a*b,axis=0)
    return numpy.arccos(ips)


def crossp(a,b):
    return a[1]*b[2]-a[2]*b[1], a[2]*b[0]-a[0]*b[2], a[0]*b[1]-a[1]*b[0]


def dihedral(a,b,c,d):
    e = c-b
    return angle(numpy.cross(a-b,e),numpy.cross(c-d,-e))


def dihrad(a,b,c,d):
    e = c-b
    return angle(numpy.cross(a-b,e),numpy.cross(c-d,-e))


def dihdeg(a,b=None,c=None,d=None):
    if b == None:
        # Then a must be a set of four coordinates
        a,b,c,d = a
    rab, rcb, rcd = a-b, c-b, c-d
    m, n = numpy.cross(rab, rcb), numpy.cross(rcb, rcd)
    phi  = angle(m,n)
    return 180*math.copysign( angle(m,n), (rab*n).sum() )/math.pi


def rgyration2(x):
    """Radius of gyration squared"""
    return ((x-x.mean(axis=0))**2).sum()/x.shape[0]


def rgyration(x):
    """Radius of gyration"""
    return numpy.sqrt(rgyration2(x))


def msd(x,y,gx=None,gy=None):  
    """Mean square deviation"""
    xc = x - x.mean(axis=0)
    yc = y - y.mean(axis=0)
    s = 0
    if gx == None:
        s += numpy.sum(xc**2)/xc.shape[0]
    else:
        s += gx 
    if gy == None:
        s += numpy.sum(yc**2)/yc.shape[0]
    else:
        s += gy
    s -= 2*numpy.sum(numpy.linalg.svd(numpy.dot(xc.T,yc),compute_uv=False))/xc.shape[0]
    return max(0,s)
    

def rmsd(x,y,gx=None,gy=None):
    """Root mean square deviation"""
    return numpy.sqrt(msd(x,y,gx,gy))


def mmult(a,b):   
    la, lb = len(a.shape), len(b.shape)
    if la == 1 and lb == 1:
        a = a.reshape((a.size,1))
    if lb == 1:
        b = b.reshape((1,b.size))
    return numpy.dot(a,b)


def transpose(a):
    if len(a.shape) == 1:
        return a.reshape((a.size,1))
    return a.T


def hbond_triplets(D,H,A,box=None,distance=0.35,angle=30,dadist=True):
    d2  = distance**2
    ang = angle*math.pi/180
    if dadist:
        # Select donor/acceptor pairs that are within range
        select = numpy.sum((D-A)**2,axis=1) <= d2
    else:
        # Select hydrogen/acceptor pairs that are within range
        select = numpy.sum((H-A)**2,axis=1) <= d2

        
    # Is there no function to get the matching numbers?
    # We need ids to be able to return them...
    ids    = numpy.arange(len(select)).compress(select)
    # 
    dd     = D[ids,:]
    hh     = H[ids,:]
    aa     = A[ids,:]
    # Check angles
    select = cosangles(hh,dd,aa) <= ang
    ids    = ids.compress(select)

    return ids


def hbonds(D,H,A,mode=None,box=None):
    """
    hbonds(D,H,A,mode=None,box=None) -> [[di,hj,ak],...]

    Determine list of hydrogen bonds for 
    (D)onors, (H)ydrogens, and (A)cceptors

    If mode is given and equal to "dha" check triplets
    in order given. Otherwise check all possible combinations.

    If box is given, use periodic distances.
    """
    if mode == "dha":
        return hbond_triplets(D,H,A,box)
    else:
        return hbond_all(D,H,A,box)


def NC(*args):
    return sum([bool(i) for i in args])
