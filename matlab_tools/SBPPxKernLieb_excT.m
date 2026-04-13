
% Code to check average excitation numbers and fluctuations from SpinBosonPP_xKern_JCHLieb
% with time averaging over steady state

% Size and number of bins for error bar calculating process
S_bin = ceil(nsamples/5);
nbins = floor(nsamples/S_bin);

% Set initial time sample index for steady state averaging
ini = ciel(length(t)/2);

% Initialise storage for bin means
means_nu = zeros(nbins, 1);
means_K = zeros(nbins, 1);
means_Kn = zeros(nbins, 1);

% Loop over bins
for nb = 1:nbins

    % Observables calculated for each bin...
    nx_bin = real(mean(mean(mean(alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:) +alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:) +x((S_bin*(nb-1)+1):S_bin*nb,ini:end,:), 3), 1), 2));
    K_bin = real(mean(mean(mean((alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:) +alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:)).^2 +x((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*(1+2*(alpha((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*beta((S_bin*(nb-1)+1):S_bin*nb,ini:end,:) +alphb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:).*betb((S_bin*(nb-1)+1):S_bin*nb,ini:end,:))), 3), 1), 2))./nx_bin -nx_bin;

    % ...and assigned to means vectors
    means_nu(nb) = nx_bin/3;
    means_K(nb) = K_bin;

end

% Calculate mean and error bar of bin means
nu = mean(means_nu, 1);
err_nu = std(means_nu);
K = mean(means_K, 1);
err_K = std(means_K);

% Save Output to File
save(filenameout, 'nu', 'err_nu', 'K', 'err_K', '-append');
