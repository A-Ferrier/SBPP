function str = correctnum2str(num)

% Alternative num2str with specific formatting

    if(mod(num, 1) == 0)
        
        str = num2str(num, '%.1f');
        
    else
        for p = 10:-1:1
            if abs(num) < 10^(-p)
                q = 0;
                for m = 1:10
                    if mod(num, 10^-(p+q)) ~= 0
                        q = q + 1;
                    end
                end
                str = num2str(num, ['%.' num2str(p+q) 'f']);
                break
            else
                str = num2str(num);
            end
        end
    end

end
