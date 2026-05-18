% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git clone <URL> .
% Creates local repo and clones remote repo from <URL> to Path
%

function clone(URL, Path, echo)
arguments
    URL string
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git clone ' char(URL) ' .'];

CMD_str = cmd.concat(cd_cmd, git_cmd);

cmd.exec(CMD_str, echo);


end

