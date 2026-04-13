
% Code to check spin density matrix from SpinBosonPP_xKern_1site

% Size and number of bins for error bar calculating process
S_bin = ceil(nsamples/5);
nbins = floor(nsamples/S_bin);

% Initialise storage for bin means
means_rhoS = zeros(nbins, 2, 2, length(t));

% Loop over bins
for nb = 1:nbins

    % Density matrix calculated for each bin...
    rhoS_bin = permute(mean(Kernel_zwx(z((S_bin*(nb-1)+1):S_bin*nb,:), w((S_bin*(nb-1)+1):S_bin*nb,:), x((S_bin*(nb-1)+1):S_bin*nb,:)), 3), [3 1 2 4]);

    % ...and assigned to means vectors
    means_rhoS(nb,:,:,:) = rhoS_bin;

end

% Calculate mean and error bar of bin means
rhoS = permute(mean(means_rhoS, 1), [2 3 4 1]);
err_rhoS = permute(std(means_rhoS), [2 3 4 1]);

% Save Output to File
save(filenameout, 'rhoS', 'err_rhoS', '-append');
