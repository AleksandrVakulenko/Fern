% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git pull <Remote_name> <Branch>
% Pulls from <Branch> of <Remote_name>
%

function status = pull(Path, Branch, Remote_name, echo)
arguments
    Path string
    Branch string = "master"
    Remote_name string = "origin"
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git pull ' char(Remote_name) ' ' char(Branch)];

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