#!/bin/bash -l

# Bash runscript for generating many stochastic trajectories from 0D (single site) DDJC positive-P simulations

# Parameters
OmZ=0.0; # Spin Energy detuning
OmC=0.0; # Boson Energy detuning
g=1.0; # Jaynes-Cummings Interaction
Fp=0.0; # Boson coherent drive amplitude
gamB=1.0; # Boson dissipation
hp=0.0; # Spin drive (transverse magnetic field)
Gamma_ph=0.0; # Spin dephasing
Gamma_d=0.0; # Spin decay
Scal=10.0; # Diffusion gauge (G)
time_run=100; # end time of simulation

for sample in {1..1000} # Loop over 1 to total number of stochastic trajectories
do

        mkdir Re${sample}
        cd Re${sample}

        ../SpinBosonPP_xKern_1site --Scal=${Scal} --h=${hp} --OmC=${OmC} --OmZ=${OmZ} --Fp=${Fp} --g=${g} --gamB=${gamB} --Gamma_ph=${Gamma_ph} --Gamma_d=${Gamma_d} --Ttot=${time_run} --seed1=$RANDOM --seed2=$RANDOM --seed3=$RANDOM

        mv file_output.xsil file_output_1Site_OmC${OmC}_OmZ${OmZ}_g${g}_gamB${gamB}_GamPh${Gamma_ph}_GamD${Gamma_d}_F${Fp}_tf${time_run}_Re${sample}.xsil
        mv file_output.h5 file_output_1Site_OmC${OmC}_OmZ${OmZ}_g${g}_gamB${gamB}_GamPh${Gamma_ph}_GamD${Gamma_d}_F${Fp}_tf${time_run}_Re${sample}.h5

        cd ../

done

