% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git status
% Checks if response to git status does not contain text
% "fatal: not a git repository"
%

function status = is_git_repo(Path, echo)
arguments
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = 'git status';

CMD_str = cmd.concat(cd_cmd, git_cmd);

[resp, cmd_status] = cmd.exec(CMD_str, echo);

if cmd_status ~= 0
    if contains(resp, "fatal: not a git repository")
        status = false;
    else
        msg = ['Unknown error on <git status>:' newline ...
            resp];
        error(msg)
    end
else
    if ~contains(resp, "fatal: not a git repository")
        status = true;
    else
        msg = ['Unable to check git repo:' newline ...
            resp];
        error(msg)
    end
end

end





