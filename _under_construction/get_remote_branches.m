
% FIXME: this function is ready: fgit_tools.remote_branch_list

clc

fgit_tools.branch_list('./Modules/Debug_msg')

fgit_tools.check_version()

fgit_tools.is_git_repo('./Modules/Debug_msg')

fgit_tools.remote_get_url('./Modules/Debug_msg')

%%

clc

% Path = '.';
Path = './Modules/Debug_msg';

git_fetch_prune(Path);

%
cd_cmd = cmd.cd(Path);
git_cmd = ['git branch -r'];
CMD_str = cmd.concat(cd_cmd, git_cmd);
resp = cmd.exec(CMD_str);
%

Lines = fgit_tools.parse_list(resp);

for i = 1:numel(Lines)
    ind = strfind(Lines(i), "HEAD");
    if ~isempty(ind)
        Lines(i) = [];
        break;
    end
end

Lines



%%




function git_fetch_prune(Path)
arguments
    Path string
end


cd_cmd = cmd.cd(Path);

git_cmd = ['git fetch --all --prune'];

CMD_str = cmd.concat(cd_cmd, git_cmd);

[~, cmd_status] = cmd.exec(CMD_str);

if cmd_status ~= 0
    error('error fetching origin'); % FIXME: (2) add new msg
end

end









