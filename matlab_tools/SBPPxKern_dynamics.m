% Code to check time evolution of n, g2 and Sz from SpinBosonPP_xKern_1site

% Size and number of bins for error bar calculating process
S_bin = ceil(nsamples/5);
nbins = floor(nsamples/S_bin);

% Initialise storage for bin means
means_n = zeros(nbins, length(t));
means_g2 = zeros(nbins, length(t));
means_Sz = zeros(nbins, length(t));

% Loop over bins
for nb = 1:nbins

    % Observables calculated for each bin...
    n_bin = mean(real(alpha((S_bin*(nb-1)+1):S_bin*nb,:).*beta((S_bin*(nb-1)+1):S_bin*nb,:)), 1);
    g2_bin = mean(real(alpha((S_bin*(nb-1)+1):S_bin*nb,:).^2.*beta((S_bin*(nb-1)+1):S_bin*nb,:).^2), 1)./n_bin.^2;
    Sz_bin = mean(real(x((S_bin*(nb-1)+1):S_bin*nb,:)), 1)-0.5;

    % ...and assigned to means vectors
    means_n(nb,:) = n_bin;
    means_g2(nb,:) = g2_bin;
    means_Sz(nb,:) = Sz_bin;

end

% Calculate mean and error bar of bin means
n_ = mean(means_n, 1);
g2 = mean(means_g2, 1);
Sz = mean(means_Sz, 1);

err_n = std(means_n);
err_g2 = std(means_g2);
err_Sz = std(means_Sz);

% Save Output to File
save(filenameout, 'n_', 'err_n', 'g2', 'err_g2', 'Sz', 'err_Sz', '-append');
