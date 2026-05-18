% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git checkout <Branch>
% Performs checkout to <Branch>
%

function checkout(Path, Branch, echo)
arguments
    Path string
    Branch string
    echo logical = false
end

[~, Branches, Active_branch] = fgit_tools.branch(Path);

if ~any(string(Branches) == Branch)
    msg = ['Where is no branch "' char(Branch) '":' newline];
    for i = 1:numel(Branches)
        msg = [msg ' - ' char(Branches(i)) newline];
    end
    error(msg)
end

if string(Active_branch) ~= string(Branch)
    cd_cmd = cmd.cd(Path);
    git_cmd = ['git checkout ' char(Branch)];
    CMD_str = cmd.concat(cd_cmd, git_cmd);

    cmd.exec(CMD_str, echo);
end

end
