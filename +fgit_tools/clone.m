% git clone function
% for Matlab versions less than R2023b
% uses windows cmd.exe

function status = clone(URL, Path, echo)
arguments
    URL string
    Path string
    echo logical = false
end

if isunix
    cd_cmd = ['cd "' char(Path) '"'];
else
    cd_cmd = ['cd /d "' char(Path) '"'];
end
git_cmd = ['git clone ' char(URL) ' .'];

if isunix
    CMD_str = [cd_cmd ' && ' git_cmd];
else
    CMD_str = ['(' cd_cmd ') && (' git_cmd ')'];
end

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

