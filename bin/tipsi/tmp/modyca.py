#!/usr/bin/env python

"""
MOlecular DYnamics CAlculator.

(c)2014 Tsjerk A. Wassenaar
"""

import sys
import sparser    # Simple parser
import calculator # General purpose extensible calculator
import gmx        # Gromacs stuff


options = sparser.Options([
    #   opt          attribute      type  num    default   multi    description
    (  "--help",    "help",         bool,   0,   False,    False,   "Print help and exit"),
    (  "-s",        "ref",          str,    1,    None,    False,   "Reference file (TPR|GRO|PDB|TRR)"),
    (  "-f",        "trj",          str,    1,    None,    False,   "Input trajectory (TRR|GRO|PDB)"),
    (  "-n",        "index",        str,    1,    None,     True,   "Input index file"),        
    (  "-e",        "expression",   str,    1,    None,     True,   "Expression"),
    ])


def main(argv=None):
    options.parse(argv or sys.argv[1:])

    if not options.trj:
        print "No input trajectory file (TRR|PDB|GRO) given."
        return 1

    trj = gmx.open(options.trj)

    if options.ref:
        ref = gmx.open(options.ref)
        if hasattr(ref,"next"):
            ref = ref.next()
    else:
        ref = gmx.open(options.trj).next()


    # Read in or determine the index groups
    # Index groups can be read from file(s)
    # or specified as expression.
    ndx = gmx.Index(*options.index)


    # Initialize the calculator with relevant stuff from the reference.
    calc = calculator.Calculator(
        natoms=ref.x().shape[0],                 # Number of atoms of reference
        ref=ref.x()-ref.x().mean(axis=0),        # Centered reference coordinates
        refg="diag(ref.T %*% ref).sum()/natoms", # Radius of gyration squared
        )

    for frame in trj:
        # Put the centered frame in the calculator
        calc["x"] = frame.x() - frame.x().mean(axis=0)

        print frame.time,
        for e in options.expression:
            print calc(e),
        print
    
        
    return 0


if __name__ == "__main__":
    sys.exit(main())
    
    





