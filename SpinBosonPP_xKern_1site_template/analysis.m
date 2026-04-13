% Overhead for Matlab postprocessing code

%Input system parameters
omC = 0.0; % Boson energy detuning
omZ = 0.0; % Spin energy detuning
g = 1.0; % Jaynes-Cummings interaction
gamB = 1.0; % Boson dissipation
Gamma_phi = 0.0; % spin dephasing
Gamma_d = 0.0; % spin decay
F = 0.0; % boson coherent drive amplitude
h = 0.0; % spin drive (transverse magnetic field)
Sc = 1.0; % Diffusion Gauge G
tf = 100; % Final time

%Input number of realisations
nsamples = 1000;

%Add all relevant directories to path
toolspath = '../matlab_tools'; % Set to matlab_tools directory location
addpath(toolspath)
addpath('./')
for ns = 1:nsamples
    addpath(['./Re' num2str(ns)])
end

%Generate Output filename with system parameters
filenameout = ['analysis_output_SBPP_xKern_1Site_Sc' correctnum2str(Sc) '_g' correctnum2str(g) '_F' correctnum2str(F) '_gamB' correctnum2str(gamB) '_OmC' correctnum2str(omC) '_OmZ' correctnum2str(omZ) '_h' correctnum2str(h) '_GamPh' correctnum2str(Gamma_phi) '_GamD' correctnum2str(Gamma_d) '_tf' num2str(tf)  '.mat'];

%Read simulation output files and collect data
[t, z, w, x, alpha, beta] = SBPPxKern_output_sample(omC, omZ, g, gamB, Gamma_phi, Gamma_d, F, h, tf, nsamples);

%Create output file and store dimensions
save(filenameout, 't');

%List of scripts to process data
SBPPxKern_dynamics
SBPPxKern_densitymatrix
