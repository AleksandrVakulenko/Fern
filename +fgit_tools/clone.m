% git clone function
% for Matlab versions less than R2023b
% uses windows cmd.exe

function status = clone(URL, Path, echo)
arguments
    URL string
    Path string
    echo logical = false
end

cd_cmd = ['cd /d "' char(Path) '"'];
git_cmd = ['git clone ' char(URL) ' .'];
CMD_str = ['(' cd_cmd ') && (' git_cmd ')'];

if echo
    disp(['CMD: ' newline char(CMD_str) newline])
    [cmd_status, resp] = system(CMD_str, "-echo");
else
    [cmd_status, resp] = system(CMD_str);
end

if cmd_status ~= 0
    warning('Git clone fails:')
    disp(resp);
    status = false;
else
    status = true;
end


end

