
% Code to check observables from SpinBosonPP_xKern_JCHLieb
% with spatial averaging to take advantage of translational invariance
% and time averaging over steady state

% Size and number of bins for error bar calculating process
S_bin = ceil(nsamples/5);
nbins = floor(nsamples/S_bin);

% Set initial time sample index for steady state averaging
ini = ciel(length(t)/2);

% Initialise storage for bin means
means_nA = zeros(nbins, 1);
means_g2A = zeros(nbins, 1);
means_nB = zeros(nbins, 1);
means_g2B = zeros(nbins, 1);
means_g2AB = zeros(nbins, 1);
means_Sz = zeros(nbins, 1);
means_Sx = zeros(nbins, 1);
means_Sy = zeros(nbins, 1);
means_CAz = zeros(nbins, 1);
means_CAx = zeros(nbins, 1);
means_CAy = zeros(nbins, 1);
means_CBz = zeros(nbins, 1);
means_CBx = zeros(nbins, 1);
means_CBy = zeros(nbins, 1);

% Loop over bins
for nb = 1:nbins

    % Observables calculated for each bin...
    nA_bin = mean(mean(mean(real(alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)), 1), 3), 2);
    g2A_bin = mean(mean(mean(real(alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).^2.*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).^2), 1), 3), 2)./nA_bin.^2;
    g2A_bin(find(~nA_bin)) = 1; % Enforce limit g2 = 1 as n -> 0
    nB_bin = mean(mean(mean(real(alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)), 1), 3), 2);
    g2B_bin = mean(mean(mean(real(alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).^2.*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).^2), 1), 3), 2)./nB_bin.^2;
    g2B_bin(find(~nB_bin)) = 1; % Enforce limit g2 = 1 as n -> 0
    g2AB_bin = mean(mean(mean(real(alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)), 1), 3), 2)./(nA_bin.*nB_bin);
    g2AB_bin(find(~(nA_bin.*nB_bin))) = 1; % Enforce limit g2 = 1 as n -> 0
    Sz_bin = mean(mean(mean(real(x((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)-0.5), 1), 3), 2);
    Sx_bin = mean(mean(mean(0.5*real(w((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)+z((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)), 1), 3), 2);
    Sy_bin = mean(mean(mean(0.5*imag(w((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)-z((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)), 1), 3), 2);
    CAz_bin = mean(mean(mean(real(alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*(x((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)-0.5)), 1), 3), 2)./(nA_bin.*Sz_bin);
    CAz_bin(find(~(nA_bin.*Sz_bin))) = 1; % Enforce limit of correlation = 1 as it becomes 0/0 form
    CBz_bin = mean(mean(mean(real(alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*(x((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)-0.5)), 1), 3), 2)./(nB_bin.*Sz_bin);
    CBz_bin(find(~(nB_bin.*Sz_bin))) = 1; % Enforce limit of correlation = 1 as it becomes 0/0 form
    CAx_bin = mean(mean(mean(0.5*real(alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*(w((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)+z((S_bin*(nb-1)+1):S_bin*nb,ini:end,:))), 1), 3), 2)./(nA_bin.*Sx_bin);
    CAx_bin(find(~(nA_bin.*Sx_bin))) = 1; % Enforce limit of correlation = 1 as it becomes 0/0 form
    CBx_bin = mean(mean(mean(0.5*real(alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*(w((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)+z((S_bin*(nb-1)+1):S_bin*nb,ini:end,:))), 1), 3), 2)./(nB_bin.*Sx_bin);
    CBx_bin(find(~(nB_bin.*Sx_bin))) = 1; % Enforce limit of correlation = 1 as it becomes 0/0 form
    CAy_bin = mean(mean(mean(0.5*imag(alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*(w((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)-z((S_bin*(nb-1)+1):S_bin*nb,ini:end,:))), 1), 3), 2)./(nA_bin.*Sy_bin);
    CAy_bin(find(~(nA_bin.*Sy_bin))) = 1; % Enforce limit of correlation = 1 as it becomes 0/0 form
    CBy_bin = mean(mean(mean(0.5*imag(alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*(w((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)-z((S_bin*(nb-1)+1):S_bin*nb,ini:end,:))), 1), 3), 2)./(nB_bin.*Sy_bin);
    CBy_bin(find(~(nB_bin.*Sy_bin))) = 1; % Enforce limit of correlation = 1 as it becomes 0/0 form

    % ...and assigned to means vectors
    means_nA(nb) = nA_bin;
    means_g2A(nb) = g2A_bin;
    means_nB(nb) = nB_bin;
    means_g2B(nb) = g2B_bin;
    means_g2AB(nb) = g2AB_bin;
    means_Sz(nb) = Sz_bin;
    means_Sx(nb) = Sx_bin;
    means_Sy(nb) = Sy_bin;
    means_CAz(nb) = CAz_bin;
    means_CAx(nb) = CAx_bin;
    means_CAy(nb) = CAy_bin;
    means_CBz(nb) = CBz_bin;
    means_CBx(nb) = CBx_bin;
    means_CBy(nb) = CBy_bin;

end

% Calculate mean and error bar of bin means
nA_ = mean(means_nA, 1);
g2A = mean(means_g2A, 1);
nB_ = mean(means_nB, 1);
g2B = mean(means_g2B, 1);
g2AB = mean(means_g2AB, 1);
Sz = mean(means_Sz, 1);
Sx = mean(means_Sx, 1);
Sy = mean(means_Sy, 1);
CAz = mean(means_CAz, 1);
CAx = mean(means_CAx, 1);
CAy = mean(means_CAy, 1);
CBz = mean(means_CBz, 1);
CBx = mean(means_CBx, 1);
CBy = mean(means_CBy, 1);

err_nA = std(means_nA);
err_g2A = std(means_g2A);
err_nB = std(means_nB);
err_g2B = std(means_g2B);
err_g2AB = std(means_g2B);
err_Sz = std(means_Sz);
err_Sx = std(means_Sx);
err_Sy = std(means_Sy);
err_CAz = std(means_CAz);
err_CAx = std(means_CAx);
err_CAy = std(means_CAy);
err_CBz = std(means_CBz);
err_CBx = std(means_CBx);
err_CBy = std(means_CBy);


% Save Output to File
save(filenameout, 'nA_', 'err_nA', 'g2A', 'err_g2A', 'nB_', 'err_nB', 'g2B', 'err_g2B', 'g2AB', 'err_g2AB', 'Sz', 'err_Sz', 'Sx', 'err_Sx', 'Sy', 'err_Sy', 'CAz', 'err_CAz', 'CAx', 'err_CAx', 'CAy', 'err_CAy', 'CBz', 'err_CBz', 'CBx', 'err_CBx', 'CBy', 'err_CBy', '-append');

