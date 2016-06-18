#Readme

##About
-----
I will get to this later, but this is meant to be a comprehensive tutorial to the TIPSI package (v0.1). The goal is to make a comprehensive tutorial for TIPSI aimed at users of GROMACS, who are familiar with MD simulations. The goal is to include a polanaline peptide, as well as my resulting analysis of the used MD run (as reference, in case theirs does not work). PLUMED is not used.

##Dependencies
------------
It would probably be good to list what version of GROMACS is required (4.5.4), and what version this TIPSI installation is (0.1 if nothing changes)

##Todo list
---------
* MDtraj in python script
* There is no repository, so make sure my final product is nice enough to pull
* Tell which thermostat has to be used and why (stochastic element, other method proved unstable)
* Use bio and parallel queues in multiples of 8
* Run the entire tutorial on my own PC to check
* Document all my own tools in the readme

##Important notes
---------
I altered the results directories in the submit files, so that everything is redirected to the output folder. I use AMBER99SB-ILDN and TIP3P water model. Periodic dodecahedron box with 1nm distance between the wall and the peptide. Uses 100mM NaCl solution. We do an em run, add salt, do an em again, then a posre run. 50000/0.002 steps of dt 0.002.

Order parameters are:
* glycosidic angle: 483, 484, 486, 499
* bp (waterstofbrug die altijd gevormd wordt bij baseparing): 275, 492
* wc (waterstofbrug die gevormd wordt bij WC paring): 276, 495
* hg (waterstofbrug die gevormd wordt bij Hoogsteen paring): 276, 489

To set up OPS and the piggybacker:
    * https://github.com/openpathsampling/openpathsampling/blob/master/devtools/conda-recipe/meta.yaml
    * http://openpathsampling.org/latest/getting_started.html
    * http://mdtraj.org/1.7.2/installation.html
    * install mmtools
    * nosetest in git
    * pip install -e .
    * set up ssh github and bitbucket

##Cheatsheet
---------
**For the distance ```.xvg```:**
```
g_dist -f 000003.trr -s ../dnabr-input/md.tpr -n ../dnabr-input/index.ndx -o dist_wc.xvg
```
**To add a forcefield:**
```
export GMXLIB=./top
```
**For the ```.gro``` file:**
```
trjconv -f posre.gro -s posre.tpr -pbc mol -center -ur compact -o show_posre.gro
```
**For the ```.xtc``` file:**
```
trjconv -f md.xtc -s md.tpr -pbc mol -center -ur compact -o show_md.xtc
```
**For the RMSD ```.xvg```:**
```
g_rms -f md.xtc -s md.tpr -o rms_md.xvg
1 and 1
```
**For the free energy ```.xvg```:**
```
g_energy -f md.edr -o mdpote.xvg
```
**For the hydrogen bonds:**
```
g_hbond -f highT.xtc -s highT.tpr -hx hbhelix.xvg
```
```
cat hbhelix.xvg | grep -v "^\#"| grep -v "^\@" | awk '{print $1"  "$6}' > highThhb.xvg
```
**For the dihedral ```.xvg```:**
```
mk_angndx -s highT.tpr -n angle.ndx -type dihedral
g_angle -f highT.xtc -od angles.ndx -n dihed_highT.xvg -type dihedral
Select group of choice! 5-7-9-15 group 8

g_angle -f 000003.trr -n ../dnabr-input/index.ndx -ov dihed.xvg -type dihedral
```
**For the gyration ```.xvg```:**
```
g_gyrate -f lowT.xtc -s lowT.tpr -o gyr_lowT.xvg
```
**For the surface plot:**
```
python ../../bin/generate2Dbins.py dist_hg.xvg 1 dist_wc.xvg 1 0.2 0.8 0.2 0.8 100 100 Hoogsteen Watson-Crick HGWC

python ../bin/generate2Dbins.py dihed1.xvg 1 dihed2.xvg 1 0 2 0 2 100 100 A B C


python ../bin/generate2Dbins.py dist_bp.xvg 1 dihed.xvg 1 0.2 0.8 -180 180 100 100 Basepair Dihedral BPDH
```

Resources
=========
---------
* [Free Energy Surface](http://www.drugdesign.gr/uploads/7/6/0/2/7602318/lecture_mdanalysis.pdf)
