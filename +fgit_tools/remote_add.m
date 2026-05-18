% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git remote add <Remote_name> <URL>
% Adds remote to local repo
%

% FIXME: need test

function remote_add(URL, Path, Remote_name, echo)
arguments
    URL string
    Path string
    Remote_name string = "origin"
    echo logical = false
end

cd_cmd = cmd.cd(Path);
git_cmd = ['git remote add ' char(Remote_name) ' ' char(URL)];
CMD_str = cmd.concat(cd_cmd, git_cmd);

cmd.exec(CMD_str, echo);

end







