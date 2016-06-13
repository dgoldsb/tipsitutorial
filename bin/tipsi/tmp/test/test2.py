#!/usr/bin/env python

import gmx
import numpy

x = gmx.open("test.pdb").next()
n = gmx.open("index.ndx")

dna = x[n.dna,:]
ion = x[n.ion,:]

inv = numpy.linalg.inv(x.box())
dna_i = numpy.dot(dna, inv)
ion_i = numpy.dot(ion, inv)

print "ION"
ion_ir = numpy.asarray(ion_i.reshape((-1,3,1)))

print "DNA"
dna_ir = numpy.asarray(dna_i.reshape((-1,3,1)))

print "DIFF"
d  = ion_ir - dna_ir.T

db = numpy.asarray(ion.reshape((-1,3,1))) - numpy.asarra(dna.reshape((-1,3,1)))

