% git pull function
% for Matlab versions less than R2023b

function status = pull(Path, Branch, Remote, echo)
arguments
    Path string
    Branch string = "master"
    Remote string = "origin"
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git pull ' char(Remote) ' ' char(Branch)];

CMD_str = cmd.concat(cd_cmd, git_cmd);

[cmd_status, resp] = cmd.exec(CMD_str, echo);

if cmd_status ~= 0
    warning('Git pull fails:')
    disp(resp);
    status = false;
else
    status = true;
end

end