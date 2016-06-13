#!/usr/bin/env python2.7

import sys, sparser


options = sparser.Options([
    #   opt          attribute      type  num    default         multi    description
    (  "--help",    "help",         bool,   0,   False,          False,   "Print help and exit"),
    (  "-s",        "tpr",          str,    1,    None,          False,   "Run input file (TPR)"),
    (  "-f",        "trr",          str,    1,    None,          False,   "Input trajectory (TRR|GRO|PDB)"),
    (  "-n",        "index",        str,    1,    None,          False,   "Input index file"),        
    (  "-e",        "expression",   str,    1,    None,           True,   "Expression"),
    (  "-o",        "output",       str,    1,    None,          False,   "Output file (stdout if not given)"),
    (  "-offset",   "offset",       int,    1,       0,          False,   "File offset for reading trajectory"),
    ])


def main(argv=None):
    options.parse(argv or sys.argv[1:])

    return 0
   

if __name__ == "__main__":
    sys.exit(main())
