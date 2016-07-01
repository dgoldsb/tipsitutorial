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
df.Length = df.MAX - df.MIN
print(df.Length)
lengths = np.average(df['Length'])
print('Average length is '+lengths)
print(df.Run)

#df[df['c']>.5][['b','e']]

# Find some metrics

# Generate a tree
# https://docs.python.org/3.2/library/turtle.html

#forward(100)
#ts = turtle.getscreen()

#ts.getcanvas().postscript(file="TIPSItree.eps")
