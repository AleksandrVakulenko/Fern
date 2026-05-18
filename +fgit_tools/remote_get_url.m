% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git config --get remote.<Remote_name>.url
% Returns URL of remote
%

function Remote_url = remote_get_url(Path, Remote_name, echo)
arguments
    Path string
    Remote_name string = "origin"
    echo logical = false
end

cd_cmd = cmd.cd(Path);
git_cmd = ['git config --get remote.' char(Remote_name) '.url'];
CMD_str = cmd.concat(cd_cmd, git_cmd);

resp = cmd.exec(CMD_str, echo);

Remote_url = strtrim(resp);

end





