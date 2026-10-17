% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%
% Try to update active branch of <Path> from all possible remotes.
% Finishes after first success.
% NOTE: The <Name> argument is used only to improve readability of messages.

function update_current_branch(Name, Path, Only_master_branch)
arguments
    Name
    Path
    Only_master_branch = false;
end

status = fgit_tools.is_git_repo(Path);
if ~status
    msg = ['Error while updating: <' char(Name) '>' newline ...
           'not a git repository - ' newline ...
            char(Path) newline];
    error(msg)
end

[Branches, Current_branch] = fgit_tools.branch_list(Path);

if Only_master_branch
    Branch_to_update_from = Current_branch;
else
    if any(Branches == "master")
        Branch_to_update_from = 'master';
    elseif any(Branches == "main")
        Branch_to_update_from = 'main';
    else
        error('unknown master branch name')
    end
end

% FIXME: check if local copy is modified

Remotes_list = fgit_tools.remote_list(Path);
Errors = [];
flag = false;
for i = 1:numel(Remotes_list)
    Remote = Remotes_list(i);
    URL = fgit_tools.remote_get_url(Path, Remote);
    try
        disp(['Update <' char(Name) '> from ' char(Remote)]) % FIXME: disp
        fgit_tools.pull(Path, Branch_to_update_from, Remote);
        flag = true;
        break;
    catch err
        Errors = [Errors err];
        disp(['Unable to pull <' Remote '> from ' newline ...
            char(URL)]) % FIXME: disp
    end
end

if ~flag
    % FIXME: do something this all errors
    Last_err = Errors(end);
    rethrow(Last_err);
end

disp('    Successfully updated.')

end



