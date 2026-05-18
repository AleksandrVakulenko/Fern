% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git remote
% Returns list of added remote names
%

function Remotes = remote_list(Path, echo)
arguments
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git remote'];
CMD_str = cmd.concat(cd_cmd, git_cmd);
resp = cmd.exec(CMD_str);

Remotes = fgit_tools.parse_list(resp);

end