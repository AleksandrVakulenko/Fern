% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git remote show <remote>
% Returns list of branches in remote repo
%

function Branches = remote_branch_list(Path, Remote, echo)
arguments
    Path string
    Remote string
    echo logical = false
end

cd_cmd = cmd.cd(Path);
git_cmd = ['git remote show ' char(Remote)];
CMD_str = cmd.concat(cd_cmd, git_cmd);

resp = cmd.exec(CMD_str, echo);

Branches = branch_parse(resp);

end



function [Branches] = branch_parse(cmd_resp)

Tokens = fgit_tools.parse_list(cmd_resp, true);

for i = 1:numel(Tokens)
    ind = strfind(Tokens(i), "Remote branch:");
    if ~isempty(ind)
        break;
    end
end

if isempty(ind)
    error('Error parsing response in remote branches list.')
end

Line = i;
num_base = count_lead_spaces(Tokens(Line));
k = 0;
Branches = string.empty;
for i = Line+1:numel(Tokens)
    Tok = Tokens(i);
    num = count_lead_spaces(Tok);
    if num == num_base + 2
        k = k + 1;
        Branches(k) = get_branch_name(Tok);
    else
        break
    end
end

end





function num = count_lead_spaces(Str)
    Str = char(Str);
    
    C = Str(1);
    num = 0;
    while C == " "
    num = num + 1;
    Str(1) = [];
    C = Str(1);
    end
end


function Branch_name = get_branch_name(Str)
    Tokens = split(Str, " ");
    Branch_name = '';
    for i = 1:numel(Tokens)
        Tok = strtrim(char(Tokens(i)));
        if ~isempty(Tok)
            Branch_name = Tok;
            break;
        end
    end
    
    if isempty(Branch_name)
        error('Error while rapsing branch name in remote_branch_list()')
    end
    
    Branch_name = string(Branch_name);
end



