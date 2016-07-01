# -*- coding: utf-8 -*-
#!/usr/bin/python

from Tkinter import *
from turtle import *
import turtle
import csv

# Open the CSV
f = open(sys.argv[1], 'rt')
try:
    reader = csv.reader(f)
    for row in reader:
        print row
finally:
    f.close()

# Find some metrics

# Generate a tree
# https://docs.python.org/3.2/library/turtle.html

forward(100)
ts = turtle.getscreen()

ts.getcanvas().postscript(file="TIPSItree.eps")
