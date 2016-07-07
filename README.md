#Readme

##About
-----
This is a comprehensive tutorial to the TIPSI package (version 0.1). The tutorial contains two examples, one fast to run but not an actual rare event (alanine dipeptide), one an actual rare event (transitions from Watson-Crick to Hoogsteen basepair configurations). In addition, the tutorial contains some documentation on how to use TIPSI. Finally, this project contains a bash script that compiles the paths created by TIPSI, something for which no tool existed yet.

A pdf of the tutorial can be found in the ./docs directory. The bash script is included in the bin directory, along with all Python scripts used in the tutorial.

##Dependencies
------------
It would probably be good to list what version of GROMACS is required (4.5.4), and what version this TIPSI installation is 0.1.

##Important notes
---------
I altered the results directories in the submit files, so that everything is redirected to the output folder. I use AMBER99SB-ILDN and TIP3P water model, a periodic dodecahedron box with 1nm distance between the wall and the protein, and a 100mM NaCl solution.
