% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git branch
% Reterns list of branches and name of active branch
%

function [Branches, Current_branch] = branch_list(Path, echo)
arguments
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git branch'];

CMD_str = cmd.concat(cd_cmd, git_cmd);

cmd.exec(CMD_str, echo);

[Branches, Current_branch] = branch_parse(resp);

end



function [Branches, Current_branch] = branch_parse(cmd_resp)

Branches = fgit_tools.parse_list(cmd_resp);

ind = [];
for i = 1:numel(Branches)
    Br = char(Branches(i));
    if Br(1) == "*"
        ind = [ind i];
    end
end

if numel(ind) ~= 1
    msg = ['While finding current (*) branch in list: ' newline];
    for i = 1:numel(Branches)
        msg = [msg ' - ' char(Branches(i)) newline];
    end
    error(msg)
end

Br = char(Branches(ind));
pos = strfind(Br, "*");
Br(pos) = ' ';
Br = strtrim(Br);
Branches(ind) = string(Br);

Current_branch = Branches(ind);

end









