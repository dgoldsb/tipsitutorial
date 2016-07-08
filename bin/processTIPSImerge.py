# -*- coding: utf-8 -*-
#!/usr/bin/python

import pandas as pd
from tkinter import *
import turtle
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
# print('Average length is '+str(np.sum(lengths)/len(lengths))+' frames')
total_length = 0
strings=df.COMP.tolist()
for string in strings:
    total_length = total_length + len(string)/3
print('Average length is '+str(total_length/len(lengths))+' frames')

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
        if target in string:
            if i in taken_origins:
                decorrelated = False
            else:
                taken_origins.append(i)
    if decorrelated:
        no_decor=no_decor+1

print('Number of decorrelated groups of paths is '+str(no_decor))

# Generate a tree, redo this if you want nice EPS/PDF graphics
master = Tk()

# Determine a canvas size
maxes=df.MAX.tolist()
mins=df.MIN.tolist()
# Let's make a run 20px apart, and keep a 20px buffer
pxrun = 20
height_tree = no_runs*pxrun + 2*pxrun
# Let's add the same buffer to the sides, and use one pixel per frames
width_tree = np.max(maxes) - np.min(mins) + 2*pxrun

# Since this starts at (0,0), we need to define where the true 0 lies for the x direction
truezero_x = pxrun - np.min(mins)
current_y = pxrun

linewidth = 2


# Create the canvas
w = Canvas(master, width=width_tree, height=height_tree)
w.pack()

# Draw the first line, of run 1
if df.DIR[0] == 'FW':
    w.create_line(df.MIN[0] + truezero_x, current_y, df.SP[0] + truezero_x, current_y, fill="black", width=linewidth)
    w.create_line(df.SP[0] + truezero_x, current_y, df.MAX[0] + truezero_x, current_y, fill="green", width=linewidth)
else:
    w.create_line(df.MIN[0] + truezero_x, current_y, df.SP[0] + truezero_x, current_y, fill="red", width=linewidth)
    w.create_line(df.SP[0] + truezero_x, current_y, df.MAX[0] + truezero_x, current_y, fill="black", width=linewidth)

# Create the rest in a loop, dash=(4, 4)
for i in range (1, no_runs):
    # Determine where you shot from
    shooting_point = df.SP[i]
    modifier = -20 # not very elegant, but well
    for j in range(1, i+1):
        modifier = modifier + 20
        compare_to = i-j
        if df.DIR[compare_to] == 'FW':
            if shooting_point > df.SP[compare_to] and shooting_point < df.MAX[compare_to]:
                break
        if df.DIR[compare_to] == 'BW':
            if shooting_point > df.MIN[compare_to] and shooting_point < df.SP[compare_to]:
                break

    # Create a line down from the shooting point
    oldcurrent_y = current_y
    current_y = current_y + pxrun

    w.create_line(shooting_point + truezero_x, oldcurrent_y - modifier, shooting_point + truezero_x, current_y + 1, fill="black", width=linewidth, dash=(4,4))


    # Write the line
    if df.DIR[i] == 'FW':
        w.create_line(shooting_point + truezero_x, current_y, df.MAX[i] + truezero_x, current_y, fill="green", width=linewidth)
    else:
        w.create_line(df.MIN[i] + truezero_x, current_y, shooting_point + truezero_x, current_y, fill="red", width=linewidth)

# Save the image
w.update()
w.postscript(file="TIPSI_tree.ps", colormode='color')

# Finish off
mainloop()

#FIRST SINGLE LINE

#LOOP
#DRAW shooting
#DRAW PATH IN COLOR

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
