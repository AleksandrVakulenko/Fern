% git pull function
% for Matlab versions less than R2023b
% uses windows cmd.exe

function version = check_version()

CMD_str = 'git --version';

[status, resp] = system(CMD_str);

if status ~= 0
    error('clould not find git')
else
    resp(resp==newline) = '';
    version = resp;
end

end




