#!/bin/bash -l

# Bash runscript for generating many stochastic trajectories from DDJCH quasi-Lieb lattice positive-P simulations

# Parameters
OmZ=0.0; # Spin Energy detuning
OmC=0.0; # Boson Energy detuning
g=1.0; # Jaynes-Cummings Interaction
Fa=1.0; # Boson coherent drive amplitude on A sites
Fp=1.0; # Boson coherent drive amplitude on B sites
gamB=1.0; # Boson dissipation
h=0.0; # Spin drive (transverse magnetic field)
Gamma_ph=0.0; # Spin dephasing
Gamma_d=10.0; # Spin decay
Scal=10.0; # Diffusion gauge (G)
time_run=100; # end time of simulation
N = 20; # Number of unit cells

for s in {1..1000} # Loop over 1 to total number of stochastic trajectories
do

        mkdir Re${s}
        cd Re${s}

        ../SpinBosonPP_xKern_NchainL --N=${N} --Scal=${Scal} --h=${h} --OmC=${OmC} --OmZ=${OmZ} --J=${J} --Fp=${Fp} --Fa=${Fa} --g=${g} --gamB=${gamB} --Gamma_ph=${Gamma_phi} --Gamma_d=${Gamma_d} --Ttot=${time_run} --seed1=$RANDOM --seed2=$RANDOM --seed3=$RANDOM --seed4=$RANDOM --seed5=$RANDOM --seed6=$RANDOM

        mv file_output.xsil file_output_${N}chainL_OmC${OmC}_OmZ${OmZ}_g${g}_J${J}_gamB${gamB}_GamPh${Gamma_phi}_GamD${Gamma_d}_F${Fp}_h${h}_tf${time_run}_Re${s}.xsil
        mv file_output.h5 file_output_${N}chainL_OmC${OmC}_OmZ${OmZ}_g${g}_J${J}_gamB${gamB}_GamPh${Gamma_phi}_GamD${Gamma_d}_F${Fp}_h${h}_tf${time_run}_Re${s}.h5

        cd ../

done
