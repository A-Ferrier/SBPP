function [t, z, w, x, alpha, beta, alphb, betb] = SBPPxKernLieb_output_sample(omC, omZ, g, J, kappa, Gamma_phi, Gamma_d, F, h, tf, N, nsamples)

% Function for collecting all output data of many realisations of
% SpinBosonPP_xKern_JCHLieb with parameters F, h, omC, omZ, g, J, gamB, Gamma_phi, Gamma_d,
% with nsamples realisations at time tf.

%Loop over realisations to read
for nsample = 1:nsamples

    %Read data from h5 file
    name_File=['file_output_' num2str(N) 'chainL_OmC' correctnum2str(omC) '_OmZ' correctnum2str(omZ) '_g' correctnum2str(g) '_J' correctnum2str(J) '_gamB' correctnum2str(gamB) '_GamPh' correctnum2str(Gamma_phi) '_GamD' correctnum2str(Gamma_d) '_F' correctnum2str(F) '_h' correctnum2str(h) '_tf' num2str(tf) '_Re' num2str(nsample) '.h5'];
    t = h5read(name_File, '/1/t');
    zR = h5read(name_File, '/1/zR');
    zR = permute(zR, ndims(zR):-1:1);
    zI = h5read(name_File, '/1/zI');
    zI = permute(zI, ndims(zI):-1:1);
    wR = h5read(name_File, '/1/wR');
    wR = permute(wR, ndims(wR):-1:1);
    wI = h5read(name_File, '/1/wI');
    wI = permute(wI, ndims(wI):-1:1);
    xR = h5read(name_File, '/1/xR');
    xR = permute(xR, ndims(xR):-1:1);
    xI = h5read(name_File, '/1/xI');
    xI = permute(xI, ndims(xI):-1:1);
    alphaR = h5read(name_File, '/1/alphaR');
    alphaR = permute(alphaR, ndims(alphaR):-1:1);
    alphaI = h5read(name_File, '/1/alphaI');
    alphaI = permute(alphaI, ndims(alphaI):-1:1);
    betaR = h5read(name_File, '/1/betaR');
    betaR = permute(betaR, ndims(betaR):-1:1);
    betaI = h5read(name_File, '/1/betaI');
    betaI = permute(betaI, ndims(betaI):-1:1);
    alphbR = h5read(name_File, '/1/alphbR');
    alphbR = permute(alphbR, ndims(alphbR):-1:1);
    alphbI = h5read(name_File, '/1/alphbI');
    alphbI = permute(alphbI, ndims(alphbI):-1:1);
    betbR = h5read(name_File, '/1/betbR');
    betbR = permute(betbR, ndims(betbR):-1:1);
    betbI = h5read(name_File, '/1/betbI');
    betbI = permute(betbI, ndims(betbI):-1:1);

    %On first run of loop allocate memory
    if nsample == 1
        alpha = zeros(nsamples, length(t), N);
        beta = zeros(nsamples, length(t), N);
        alphb = zeros(nsamples, length(t), N);
        betb = zeros(nsamples, length(t), N);
        z = zeros(nsamples, length(t), N);
        w = zeros(nsamples, length(t), N);
        x = zeros(nsamples, length(t), N);
    end

    %Recombine real/imaginary parts of output into complex output
    alphaC = alphaR + 1i*alphaI;
    betaC = betaR + 1i*betaI;
    alphbC = alphbR + 1i*alphbI;
    betbC = betbR + 1i*betbI;
    zC = zR + 1i*zI;
    wC = wR + 1i*wI;
    xC = xR + 1i*xI;

    alpha(nsample,:,:) = alphaC;
    beta(nsample,:,:) = betaC;
    alphb(nsample,:,:) = alphbC;
    betb(nsample,:,:) = betbC;
    z(nsample,:,:) = zC;
    w(nsample,:,:) = wC;
    x(nsample,:,:) = xC;

end
end
