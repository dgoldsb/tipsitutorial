# -*- coding: utf-8 -*-
#!/usr/bin/python

import pandas as pd
# from Tkinter import *
#from turtle import *
#import turtle
import csv
import sys
import numpy as np

# Goals: 
# Tree
# Average path length
# Ratio forward/backward
# Number of decorrelated paths

# Open the CSV
df = pd.read_csv(sys.argv[1], sep=',', header=0)
print(df.columns.values)

# Average path
df.Length = df.MAX - df.MIN
lengths = df.Length.tolist()
print('Average length is '+str(np.sum(lengths)/len(lengths))+' frames')

# Count FW over length
FWs = df.DIR.tolist()
counter = 0
for direction in FWs:
    if direction=='FW':
        counter=counter+1
print('FW/BW ratio is '+str(counter/len(FWs)))

# Number of decorrelated paths
no_runs=len(lengths)
strings=df.COMP.tolist()
no_decor=0
taken_origins=[]
for string in strings:
    decorrelated = True
    for i in range(1, no_runs+1):
        target='-'+str(i)+'-'
        if target is a substring in
    if decorrelated:
        no_decor=no_decor+1
    
print('Number of decorrelated paths is '+str(no_decor))

# Generate a tree

# DRAW A SINGLE LINE FIRST TO BOTH PNG AND EPS AND CHECK ZE OUTPUT

# Start atshooting point,
# go to min or max of original, go to the shooting point, go down, 
# go to min or max
# go back to shooting point



#df[df['c']>.5][['b','e']]

# Find some metrics

# Generate a tree
# https://docs.python.org/3.2/library/turtle.html

#forward(100)
#ts = turtle.getscreen()

#ts.getcanvas().postscript(file="TIPSItree.eps")
