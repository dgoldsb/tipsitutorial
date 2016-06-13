#!/usr/bin/env python

"""
Command line editor for Gromacs' TPR files.
"""

__author__ = "Tsjerk A. Wassenaar"
__year__   = 2015


import sys

import gmx
import sparser


options = sparser.Options([
    #   opt          attribute        type  num     default   multi    description
    (  "--help",    "help",           bool,   0,     False,    False,   "Print help and exit"),
    (  "-tpr",      "tpr",            str,    1,      None,    False,   "Run input file (TPR)"),
    (  "-o",        "out",            str,    1,      None,    False,   "Output run input file (TPR)"),
    (  "-p",        "par",            str,    1,      None,    True,    "Parameters: par=val"),
    (  "-r",        "read",           str,    1,      None,    True,    "Read parameter"),
    ])


def main(argv=None):
    if argv == None:
        argv = sys.argv

    options.parse(argv[1:])

    tpr = gmx.tpr.TPR(options.tpr)

    for par in options.read:
        print "{:>20} = {}".format(par, tpr.get(par))

    if options.par:
        if not options.out:
            options.out = options.tpr[:options.tpr.rfind(".")]+"-out.tpr"

        for par in options.par:
            eqs = par.find("=")
            p, v = par[:eqs], par[eqs+1:].split(",")
            if len(v) == 1:
                v = v[0]
            tpr.set(p,v)

        open(options.out,"w").write(str(tpr))


if __name__ == "__main__":
    sys.exit(main())
