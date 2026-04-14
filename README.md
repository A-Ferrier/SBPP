# SBPP
Positive-P simulations for driven dissipative Jaynes-Cummings-Hubbard models, using new 3 variable kernel approach for spins, written for [xmds2](http://www.xmds.org/), with optional Matlab post-processing library.

## Using the code for simulations 
Once you have xmds2 installed, make a copy of the template directory for the geometry you wish to simulate, e.g. SpinBosonPP_xKern_1site_template for 0D Jaynes-Cummings.  Use the command 
``` bash
xmds2 SpinBosonPP_xKern_1site.xmds
```
to compile the xmds script and generate an executable.  The executable generates a single trajectory when run; the template directory also contains a bash script (SpinBosonPP_xKern_1site_runscript.sh) to loop running for the desired numbers of stochastic trajectories and rename the output files appropriately.  Edit this runscript to set the system parameters and number of trajectories as desired, and then use 
``` bash
./SpinBosonPP_xKern_1site_runscript.sh
```
 to have the simulations run to generate positive-P trajectories.  

## Matlab tools for calculating observables
The directory matlab_tools contains a library of Matlab scripts for loading the output data into Matlab and calculating observables from the corresponding averages.  To use, make a copy of the matlab_tools directory; then, in the simulation directory, edit the file analysis.m so that the parameters match those used for the simulation, and that the string toolspath points to the correct location for your matlab_tools directory.  Add the names of any of the scripts from matlab_tools you wish to include in the analysis to the list at the bottom of analysis.m.  Running analysis.m in Matlab from within the simulation directory will then calculate the observables and save the results to the output file whose name is defined in analysis.m.  To run the analysis on a system with Matlab installed without opening a Matlab window you can use the command
``` bash
matlab -nosplash -nodesktop -nodisplay < analysis.m
```
from inside the simulation directory.  

## Available geometries

SpinBosonPP_xKern_1site_template: Single site (0D) driven dissipative Jaynes-Cummings model.

SpinBosonPP_xKern_JCHLieb_template: Special setup of 1D driven dissipative Jaynes-Cummings-Hubbard model with quasi-Lieb lattice structure.  Only odd (A) sites are coupled to a spin while even (B) sites are just a linear bosonic mode.  Unit cell consisting of A site, B site, and spin.
