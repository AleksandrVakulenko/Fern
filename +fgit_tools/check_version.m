% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git --version
% Reterns version of currenly installed git
%


function version = check_version(options)
arguments
    options.nothrow logical = false
end

CMD_str = 'git --version';

[status, resp] = system(CMD_str);

if status ~= 0
    if options.nothrow
        version = '';
    else
        error('clould not find git')
    end
else
    resp(resp==newline) = '';
    version = resp;
end

end




