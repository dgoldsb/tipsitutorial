
import tokenize
import io
import operator
import numpy
import math
import functions
import collections


_unaryOperators = {
    # Operator  Level Order   Function
    
    '+':      (  1,   'l',  operator.pos      ), # 
    '-':      (  1,   'l',  operator.neg      ), # 
    '!':      (  1,   'l',  operator.not_     ),
}

_binaryOperators = { 
    # Operator  Level Order   Function

    '**':     (  2,   'r',  operator.pow      ), # 
    
    '*':      (  3,   'l',  operator.mul      ), # 
    '%*%':    (  3,   'l',  functions.mmult   ), # 
    '/':      (  3,   'l',  operator.truediv  ), # 
    '//':     (  3,   'l',  operator.floordiv ), # 
    '%':      (  3,   'l',  operator.mod      ), # 
    
    '+':      (  4,   'l',  operator.add      ), # 
    '-':      (  4,   'l',  operator.sub      ), # 
    
    '<<':     (  5,   'l',  operator.lshift   ), # 
    '>>':     (  5,   'l',  operator.rshift   ), # 
    
    '>=':     (  6,   'l',  operator.ge       ), # 
    '>':      (  6,   'l',  operator.gt       ), # 
    '<=':     (  6,   'l',  operator.le       ), # 
    '<':      (  6,   'l',  operator.lt       ), # 
    
    '==':     (  7,   'l',  operator.eq       ), # 
    '!=':     (  7,   'l',  operator.ne       ), # 
    
    '&':      (  8,   'l',  operator.and_     ), # 
    
    '^':      (  9,   'l',  operator.xor      ), # 
    
    '|':      ( 10,   'l',  operator.or_      ), # 
    
    '||':     ( 11,   'l',  operator.or_      ), # 
}


_keywords = {
    
}

_space = {
    "numpy": numpy,
    "math":  math,
    "True":  True,
    "False": False
}


class CalculatorBaseError(Exception):
    def __init__(self, msg):
        self.msg = msg
    def __str__(self):
        return self.msg

class SelectionError(Exception):
    """Named selection (array$group) not found"""

class CalculatorParseError(Exception):
    """Error parsing expression string"""


class Calculator(dict):

    def __init__(self,*args,**kwargs):

        self.verbose  = kwargs.get("verbose")
        self._log     = []
        self._logfile = kwargs.get("log")
        self.maxlevel = max([i[0] for i in _binaryOperators.values()])

        # This dict is used to collect the named expressions
        # It can be cleared so that the most recent expression
        # results can be extracted.        
        self.result = {}
        self.order  = []

        # Set to True if 'assignments' should not be stored
        # like when building a function argument list
        self.silent = False

        # Registering modules
        self.log("# Registering modules:")
        for nam,mod in _space.items():
            self.log(nam)        
            self[nam] = mod

        # Register functions
        self.functions = dict()
        self.log("# Registering functions from module functions:")
        for f in dir(functions):
            g = getattr(functions,f)
            if callable(g) and f[0] != "_":
                self.log("# %s"%f)
                self.functions[f] = g

        self.log("# Initialization")
        for v,e in kwargs.items():
            if callable(e):
                # Register function
                self.log("Function %s"%v)
                self.functions[v] = e
            elif type(e) == str:
                # Register result from expression
                for i in e.split(';'):
                    result = self.do(i)
                self.log("Variable %s = %s"%(v,str(result)))                    
                self[v] = result
            else:
                # Register variable
                self.log("Variable %s = %s"%(v,str(e)))
                self[v] = e

        self.ndx = kwargs.get("ndx")

        self(*args)


    def __call__(self,*args,**kwargs):
        v = None
        for i in args:
            if i:
                for j in i.split(";"):
                    try:
                        v = self.do(j)
                    except TypeError:
                        raise CalculatorParseError("TypeError: "+j)
                    except ValueError:
                        raise CalculatorParseError("ValueError: "+j)
        return v


    def __setitem__(self,key,val):
        self.result[key] = val
        dict.__setitem__(self,key,val)


    def log(self,msg):
        if self.verbose:
            print msg
        self._log.append(msg)
        if self._logfile:
            self._logfile.write(msg+"\n")


    def logfile(self, filename, mode="w"):
        if not mode in ("w","a"):
            raise ValueError("Mode string must be 'w' or 'a'")
        self._logfile = open(filename,mode)


    def clear(self):
        self.result.clear()


    def reset(self):
        self._log = []
        self.clear()
        dict.clear(self)


    def eval_term(self,tokenlist):
        """Evaluate the first token in the list and act accordingly"""

        # 1. Values
        if (type(tokenlist[0]) in (float,int,complex,tuple)
            or isinstance(tokenlist[0], numpy.ndarray)):
            return tokenlist.pop(0)

        if tokenlist[0] == '$':
            tokenlist.pop(0)
            group = tokenlist.pop(0).lower()
            try:
                return self.ndx[group]
            except KeyError:
                raise SelectionError("Index group not found: %s (%s)"%(group,str(self.ndx)))

        # 2. Unary operators
        #    Evaluate the next term and return the result processed.
        if tokenlist[0] in _unaryOperators.keys():
            lv, gr, op = _unaryOperators[tokenlist.pop(0)]
            # Negate following value
            return op(self.eval_term(tokenlist))

        # 3. Functions
        #    Build an argument list, apply the function and return the return value
        if callable(tokenlist[0]) or tokenlist[0] in self.functions:
            f = tokenlist.pop(0)
            if tokenlist[0] != '(':            
                raise CalculatorParseError("Expected '(' following function %s"%f)
            self.silent = True
            tokenlist.pop(0)
            if tokenlist[0] == ')':
                tokenlist.pop(0)
                self.silent = False
                return f() if callable(f) else self.functions[f]()
            args   = []
            kwargs = {}
            while tokenlist:
                #args.append(self.eval_expression(tokenlist))
                if tokenlist[0] == '(':
                    args.append(self.eval_expression(tokenlist))
                else:
                    item = self.eval_expression(tokenlist)
                    if type(item) == tuple:
                        kwargs[item[0]] = item[1]
                    else:
                        args.append(item)
                if tokenlist[0] == ')':
                    tokenlist.pop(0)
                    break
                if tokenlist[0] != ',':
                    print tokenlist
                    raise CalculatorParseError("Expected ')' or ',' in building argument list of %s"%f)
                tokenlist.pop(0)
            self.silent = False
            return f(*args,**kwargs) if callable(f) else self.functions[f](*args,**kwargs)

        # 4. Grouped expressions or collections
        #    Evaluate grouped expression and return result
        #    or build collection and return as value.
        if tokenlist[0] == '(':
            d,v = tokenlist.pop(0), self.eval_expression(tokenlist)

            if tokenlist[0] == ',':
                # Oh, building a collection...
                coll = [v]
                tokenlist.pop(0)

                while tokenlist:
                    coll.append(self.eval_expression(tokenlist))
                    if tokenlist[0] == ')':
                        tokenlist.pop(0)
                        break
                    if tokenlist[0] != ',':
                        raise CalculatorParseError("Expected ')' or ',' in building argument list of %s"%f)
                    tokenlist.pop(0)
                return numpy.array(coll)            

            if tokenlist[0] != ')':
                raise CalculatorParseError("')' expected")

            tokenlist.pop(0)
            return v

        # 5. Extraction
        if tokenlist[0] == '[':
            d,v = tokenlist.pop(0), self.eval_expression(tokenlist)
    
            if tokenlist[0] == ',':
                coll = [v]
                tokenlist.pop(0)
                while tokenlist:
                    coll.append(self.eval_expression(tokenlist))
                    if tokenlist[0] == ']':
                        tokenlist.pop(0)
                        break
                    if tokenlist[0] != ',':
                        raise CalculatorParseError("Expected ']' or ',' in building index list of %s"%f)
                    tokenlist.pop(0)
                return coll            

            if tokenlist[0] != ']':
                raise CalculatorParseError("']' expected")

            tokenlist.pop(0)
            return v    
    
        # 6. Assignment
        #    Add result to self-space and return value assigned
        if len(tokenlist) > 2 and tokenlist[1] == '=':
            v,d = tokenlist.pop(0), tokenlist.pop(0)            
            val = self.eval_expression(tokenlist)
            if not self.silent:
                self[v] = val
                self.log("Variable %s = %s"%(v,self[v]))
                return val
            else:
                return v,val
    
        # 7. Substitute variable for value
        if tokenlist[0] in self:        
            return self[tokenlist.pop(0)]

        # 8. Strings. For retrieving attributes (see eval_expression).
        if tokenlist[0][0].isalpha() or tokenlist[0][0] == "_":
            return tokenlist.pop(0)

        # 9. Slicing. See below for complete handling. Just have to
        #    make sure to return None of we encounter a ':' first.
        if tokenlist[0] == ':':
            return None

        # If we have not returned by now, something is wrong.
        raise CalculatorParseError("Syntax error: %s" % repr(tokenlist[0]))


    def eval_expression(self,tokenlist,level=None):
        """Process an expression"""
    
        if level == None:
            level = self.maxlevel

        if level == 0:
            return self.eval_term(tokenlist)
    
        a = self.eval_expression(tokenlist,level-1)            
        while tokenlist:
            
            # Get property
            if tokenlist[0] == ".":
                tokenlist.pop(0)
                tokenlist[0] = getattr(a,tokenlist[0])
                a = self.eval_expression(tokenlist)                
            

            # Index group extractor
            elif tokenlist[0] == '$':
                tokenlist.pop(0)
                group = tokenlist[0].lower()
                try:
                    group = self.ndx[group]
                except KeyError:
                    raise SelectionError("Index group not found: %s (%s)"%(group,str(self.ndx)))
                if not isinstance(a, numpy.ndarray):
                    a = numpy.array(a)
                dim = a.shape
                if len(dim) == 1:
                    tokenlist[0] = a[group]
                elif len(dim) == 2:
                    tokenlist[0] = a[group,:]                    
                a = self.eval_expression(tokenlist)


            # Slicing
            elif tokenlist[0] == ":":
                # :[b[:[c]]]
                tokenlist.pop(0)
                # [b[:[c]]]
                b = None
                c = None
                # Only ':', ',', ']', ')' or expression possible after ':'
                if tokenlist[0] == ":":
                    # :[c]
                    tokenlist.pop()
                    # [c]
                elif tokenlist[0] not in (']',',',')'):
                    # b[:[c]]
                    b = self.eval_term(tokenlist)
                if tokenlist[0] == ":":
                    tokenlist.pop(0)
                    if tokenlist[0] not in (']',',',')'):
                        c = self.eval_term(tokenlist)
                a = slice(a,b,c)

            # List extraction
            elif tokenlist[0] == "[":
                e = self.eval_term(tokenlist)
                if type(e) == int or type(e) == slice:
                    a = a[e]
                else:
                    a = a[tuple(e)]
            
            # Binary operations
            elif tokenlist[0] in _binaryOperators:
                (lv, gr, op) = _binaryOperators[tokenlist[0]]
                if level != lv:
                    break
                tokenlist.pop(0)
                b = self.eval_expression(tokenlist,level-(gr != 'r'))
                a = op(a,b)

            # Break on all other cases
            else:
                break

        return a


    def do(self,expr):
        """Parse tokens, setting up expression, checking and combining terms"""

        # Ignore comments
        expr = expr.strip()
        if expr[0] in "#":
            self.log(expr)
            return

        T = [i[:2] for i in tokenize.generate_tokens(io.BytesIO(expr.encode('utf-8')).readline)]
        t = []
        while T:          
            typ, st = T.pop(0)

            # Encoding or space (skip)
            if typ == 56 or typ == 0 or not st.strip(): 
                continue

            # Number
            elif typ == 2: 
                if 'j' in st or 'J' in st:
                    t.append(complex(st))
                elif '.' in st or 'e' in st or 'E' in st:
                    t.append(float(st))
                else:
                    t.append(int(st))

            # Operator
            elif typ == 51: 
                if len(T)>2 and T[0][0] == 51 and T[1][0] == 51:
                    b = st+T[0][1]+T[1][1]
                    if b in _binaryOperators or b in _unaryOperators:
                        t.append(b)
                        T.pop(0)
                        T.pop(0)
                        continue
                if len(T)>1 and T[0][0] == 51:
                    b = st+T[0][1]
                    if b in _binaryOperators or b in _unaryOperators:
                        t.append(b)
                        T.pop(0)
                        continue
                t.append(st)
            
            # Name (function/variable/constant)
            else:
                t.append(st)
        
        expression = "".join(str(i) for i in t)
        #print " ".join(str(i) for i in t)
        result = self.eval_expression(t)
        self.log("%s := %s"%(expression,result))

        return result

    
    
                    
