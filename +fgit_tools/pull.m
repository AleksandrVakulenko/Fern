% git pull function
% for Matlab versions less than R2023b
% uses windows cmd.exe

function status = pull(Path, Branch, Remote)
arguments
Path string
Branch string = "master"
Remote string = "origin"
end

cd_cmd = ['cd /d "' char(Path) '"'];
git_cmd = ['git pull ' char(Remote) ' ' char(Branch)];
CMD_str = ['(' cd_cmd ') && (' git_cmd ')'];

% [status, ~] = system(CMD_str, "-echo");
[cmd_status, resp] = system(CMD_str);

if cmd_status ~= 0
    warning('Git pull fails:')
    disp(resp);
    status = false;
else
    status = true;
end

end