% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git status 
% Returns list of new, renamed, deleted, modified files
%

function modified_files = status(Path, echo)
arguments
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git ls-files --others --modified --exclude-standard'];

CMD_str = cmd.concat(cd_cmd, git_cmd);

resp = cmd.exec(CMD_str);

modified_files = fgit_tools.parse_list(resp);

end