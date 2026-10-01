% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git remote set-url remote_name url
% Set URL of remote
%

function remote_set_url(Path, URL, Remote_name, echo)
arguments
    Path string
    URL string
    Remote_name string = "origin"
    echo logical = false
end

cd_cmd = cmd.cd(Path);
git_cmd = ['git remote set-url ' char(Remote_name) ' ' char(URL)];
CMD_str = cmd.concat(cd_cmd, git_cmd);

cmd.exec(CMD_str, echo);

end