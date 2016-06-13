#!/usr/bin/env python2.7

"""
Test for option handling 

(c)2014 Tsjerk A. Wassenaar, PhD
"""

import sys
import sparser

options = sparser.Options([
    #   opt          attribute        type  num    default   multi    description
    (  "--help",    "help",           bool,   0,   False,    False,   "Print help and exit"),
    (  "-tpr",      "tpr",            str,    1,    None,    False,   "Run input file (TPR)"),
    (  "-trr",      "trj",            str,    1,    None,    False,   "Input trajectory (TRR)"),
    (  "-f",        "parfile",        str,    1,    None,    False,   "Input TPS parameter file"),
    (  "-n",        "index",          str,    1,    None,     True,   "Input index file"),        
    (  "-o",        "out",            str,    1,    None,    False,   "Output file"),
    (  "-fw",       "forward",        str,    1,    None,    False,   "Forward shooting point"),
    (  "-bw",       "backward",       str,    1,    None,    False,   "Backward shooting point"),
    (  "-log",      "log",            str,    1,    None,    False,   "Log file"),
    "Monitoring options:",
    (  "-offset",   "offset",         int,    1,       0,    False,   "Trajectory file offset"),
    (  "-pid",      "pid",            int,    1,    None,    False,   "PID to monitor"),
    "Molecular/mathematical expressions evaluated in context of reference and frame:",
    (  "-init",     "init",           str,    1,    None,     True,   "Expressions evaluated before loading trajectory"),
    (  "-E",        "expressions",    str,    1,    None,     True,   "Expressions not saved to output file"),
    (  "-P",        "parameters",     str,    1,    None,     True,   "Parameter expressions"),
    (  "-S",        "states",         str,    1,    None,     True,   "State expressions"),
    (  "-I",        "interfaces",     str,    1,    None,     True,   "Interface expressions"),
    (  "-B",        "bias",           str,    1,    None,     True,   "Shooting point selection bias expressions"),
    (  "-stop",     "stop",           str,    1,    None,    False,   "Stop conditions (expression)"),
    (  "-2way",     "twowayprob",     str,    1,     "0",    False,   "Probability of two-way shooting"),
    (  "-rand",     "randomize",      str,    1,     "0",    False,   "Velocity randomization"),
    "Further TPS control:",
    (  "-maxf",     "maxframes",      int,    1,      -1,    False,   "Maximum number of frames per run"),
    ])



def main(argv=None):

    print "Parsing options..."
    options.parse(argv or sys.argv[1:])
    for opt in options.options:
        print opt
    

if __name__ == "__main__":
    sys.exit(main())

