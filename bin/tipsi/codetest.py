#!/usr/bin/env python2.7

"""
Test with building a callable code object.
"""

code = """
def x(foo,bar=None):
    print 10*foo, bar
"""

compiled = compile(code, '', 'exec')
exec(compiled)

x("bla")
x(10,11)


