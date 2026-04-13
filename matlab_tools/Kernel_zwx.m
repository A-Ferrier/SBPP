function LamS = Kernel_zwx(z, w, x)

% Function for calculating trajectory-wise spin kernel operator for SpinBosonPP_xKern_1site trajectories

% Allocate memory for output array
LamS = zeros([2, 2, size(z)]);

% Loop over dimensions
for n_index = 1:size(z, 1)
    for t_index = 1:size(z, 2)

         LamS(1,1,n_index,t_index) = x(n_index,t_index);
         LamS(1,2,n_index,t_index) = z(n_index,t_index);
         LamS(2,1,n_index,t_index) = w(n_index,t_index);
         LamS(2,2,n_index,t_index) = 1-x(n_index,t_index);

    end
end

end
