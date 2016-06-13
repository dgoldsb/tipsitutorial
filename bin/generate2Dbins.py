# -*- coding: utf-8 -*-
#!/usr/bin/python

import sys
import re
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import os

os.getcwd()
matplotlib.rcParams.update({'font.size': 20})
matplotlib.rcParams.update({'figure.autolayout': True})

try:
    infilename1 = sys.argv[1]; row1 = int(sys.argv[2])
    infilename2 = sys.argv[3]; row2 = int(sys.argv[4])
    _minv1 = sys.argv[5]; _maxv1 = sys.argv[6]
    _minv2 = sys.argv[7]; _maxv2 = sys.argv[8]
    _i1 = sys.argv[9]; _i2 = sys.argv[10]
    xlab = sys.argv[11]; ylab = sys.argv[12]
    outfilename = sys.argv[13]
except:
    print("Usage:",sys.argv[0], "infile1 row1 infile2 row2 minv1 maxv1 minv2 maxv2 devisions1 devisions2 xlab ylab"); sys.exit(1)

##### Variable Initializations ##########
i1 = int(_i1)
i2 = int(_i2)
minv1 = float(_minv1)
maxv1 = float(_maxv1)
minv2 = float(_minv2)
maxv2 = float(_maxv2)

##### Read The Variables In ##########

import re
regex1 = re.compile('@.*')
regex2 = re.compile('#.*')

data1 = []
inp = open (infilename1,"r")
#read line into array
cont = True
for line in inp.readlines():
    cont = True
    for i in line.split():
        if re.match(regex1, i):
            cont = False
        if re.match(regex2, i):
            cont = False
    if cont:
        # add a new sublist
        data1.append([])
        # loop over the elemets, split by whitespace
        for i in line.split():
            # convert to integer and append to the last
            # element of the list
            data1[-1].append(float(i))
var1 = np.asarray(zip(*data1))
print(var1.shape)
var1 = var1[row1,:]

data2 = []
inp = open (infilename2,"r")
#read line into array
cont = True
for line in inp.readlines():
    cont = True
    for i in line.split():
        if re.match(regex1, i):
            cont = False
        if re.match(regex2, i):
            cont = False
    if cont:
        # add a new sublist
        data2.append([])
        # loop over the elemets, split by whitespace
        for i in line.split():
            # convert to integer and append to the last
            # element of the list
            data2[-1].append(float(i))
var2 = np.asarray(zip(*data2))
var2 = var2[row2,:]

"""
DEPRECATED

For own use, edit the regular expressions to fit your data
Hint: regexr is amazing to test

ifile1 = open(infilename1,'r')     # open file for reading
ifile2 = open(infilename2,'r')     # open file for reading

REGEX1= re.compile(r'\d+\s+(\d+)')
REGEX2= re.compile(r'\s*\d+.\d+\s*(\d+.\d+)\s*')

var1 = []
var2 = []

print("Keep in mind, expected format is 'timestep value' each row")
print("Change this by editing the regular expressions :)")

for line in ifile1:
    m = REGEX1.match(line)
    if m:
        group1 = m.group(1)
        if group1:
            var1.append(group1)

for line in ifile2:
    m = REGEX2.match(line)
    if m:
        group1 = m.group(1)
        if group1:
            var2.append(group1)
"""

##### 1D Plotting ##########

p1 = plt.plot(var1)
plt.xlabel('Timesteps')
plt.ylabel(xlab)
plt.savefig(outfilename+'_'+xlab+'.pdf')
plt.show()

p2 = plt.plot(var2)
plt.plot(var2)
plt.xlabel('Timesteps')
plt.ylabel(ylab)
plt.savefig(outfilename+'_'+ylab+'.pdf')
plt.show()

##### 2D Plotting ##########

bins = np.zeros((i1,i2))
dv1 = (maxv1 - minv1) / i1
dv2 = (maxv2 - minv2) / i2

for i in range(0, len(var1)):
    if (i%5000 ==0):
        print('Bins at iteration '+str(i)+' out of '+str(len(var1)))
    xval = float(var1[i])
    yval = float(var2[i])
    for j in range(0, i1):
        for k in range(0, i2):
            if (xval >= (minv1 + j * dv1)) and (yval >= (minv2 + k * dv2)) and (xval < (minv1 + (j+1) * dv1)) and (yval < (minv2 + (k+1) * dv2)):
                bins[j, k] += 1

# Loop is over, we can plot the bins
p3 = plt.imshow(bins, interpolation = "none", extent = [minv2, maxv2, maxv1, minv1], aspect = 'auto')
plt.colorbar()
plt.xlabel(ylab)
plt.ylabel(xlab)
plt.savefig(outfilename+'_2D.pdf')
plt.show()
