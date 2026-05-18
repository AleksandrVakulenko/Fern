% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git remote
% Returns list of added remote names
%

function [status, Remotes] = remote_list(Path, echo)
arguments
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git remote'];
CMD_str = cmd.concat(cd_cmd, git_cmd);
[cmd_status, resp] = cmd.exec(CMD_str);

if cmd_status ~= 0
    warning('Git clone fails:')
    disp(resp);
    status = false;
    Remotes = '';
else
    status = true;
    Remotes = fgit_tools.parse_list(resp);
end

end