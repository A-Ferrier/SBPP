function [t, z, w, x, alpha, beta] = SBPPxKern_output_sample(omC, omZ, g, gamB, Gamma_phi, Gamma_d, F, h, tf, nsamples)

% Function for collecting all output data of many realisations of
% SpinBosonPP_xKern_1site with parameters F, h, omC, omZ, g, gamB, Gamma_phi, Gamma_d,
% with nsamples realisations at time tf.

%Loop over realisations to read
for nsample = 1:nsamples

    %Read data from h5 file
    name_File=['file_output_1Site_OmC' correctnum2str(omC) '_OmZ' correctnum2str(omZ) '_g' correctnum2str(g) '_gamB' correctnum2str(gamB) '_GamPh' correctnum2str(Gamma_phi) '_GamD' correctnum2str(Gamma_d) '_F' correctnum2str(F) '_h' correctnum2str(h) '_tf' num2str(tf) '_Re' num2str(nsample) '.h5'];
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

    %On first run of loop allocate memory
    if nsample == 1
        alpha = zeros(nsamples, length(t));
        beta = zeros(nsamples, length(t));
        z = zeros(nsamples, length(t));
        w = zeros(nsamples, length(t));
        x = zeros(nsamples, length(t));
    end

    %Recombine real/imaginary parts of output into complex output
    alphaC = alphaR + 1i*alphaI;
    betaC = betaR + 1i*betaI;
    zC = zR + 1i*zI;
    wC = wR + 1i*wI;
    xC = xR + 1i*xI;

    alpha(nsample,:) = alphaC;
    beta(nsample,:) = betaC;
    z(nsample,:) = zC;
    w(nsample,:) = wC;
    x(nsample,:) = xC;

end
end
