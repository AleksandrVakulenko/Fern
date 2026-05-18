% git clone function
% for Matlab versions less than R2023b

function [status, Branches, Current_branch] = branch(Path, echo)
arguments
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git branch'];

CMD_str = cmd.concat(cd_cmd, git_cmd);

[cmd_status, resp] = cmd.exec(CMD_str, echo);

if cmd_status ~= 0
    warning('Git clone fails:')
    disp(resp);
    status = false;
    Branches = '';
    Current_branch = '';
else
    status = true;
    [Branches, Current_branch] = branch_parse(resp);
end


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









