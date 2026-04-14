% Overhead for Matlab postprocessing code

%Input system parameters
omC = 0.0; % Boson energy detuning
omZ = 0.0; % Spin energy detuning
g = 1.0; % Jaynes-Cummings interaction
gamB = 1.0; % Boson dissipation
Gamma_phi = 0.0; % spin dephasing
Gamma_d = 10.0; % spin decay
Fa = 1.0; % boson coherent drive amplitude on A sites
Fb = 1.0; % boson coherent drive amplitude on B sites
h = 25.0; % spin drive (transverse magnetic field)
Sc = 10.0; % Diffusion Gauge G
tf = 100; % Final time
N = 20; % Number of unit cells

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
filenameout = ['analysis_output_SBPP_xKern_' num2str(N) 'chain_LiebFB_g' correctnum2str(g) '_J' correctnum2str(J) '_Fb' correctnum2str(Fb) 'a' correctnum2str(Fa) '_gamB' correctnum2str(gamB) '_OmC' correctnum2str(omC) '_OmZ' correctnum2str(omZ) '_h' correctnum2str(h) '_GamPh' correctnum2str(Gamma_phi) '_GamD' correctnum2str(Gamma_d) '_tf' num2str(tf)  '.mat'];

%Read simulation output files and collect data
[t, z, w, x, alpha, beta, alphb, betb] = SBPPxKernLieb_output_sample(omC, omZ, g, J, gamB, Gamma_phi, Gamma_d, Fb, h, tf, N, nsamples);

%Create output file and store dimensions
save(filenameout, 't');

%List of scripts to process data
SBPPxKernLieb_stAv
SBPPxKernLieb_excT
