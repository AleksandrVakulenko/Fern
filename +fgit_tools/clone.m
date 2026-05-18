% git clone function
% for Matlab versions less than R2023b

function status = clone(URL, Path, echo)
arguments
    URL string
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git clone ' char(URL) ' .'];

CMD_str = cmd.concat(cd_cmd, git_cmd);

[cmd_status, resp] = cmd.exec(CMD_str, echo);

if cmd_status ~= 0
    warning('Git clone fails:')
    disp(resp);
    status = false;
else
    status = true;
end

end

