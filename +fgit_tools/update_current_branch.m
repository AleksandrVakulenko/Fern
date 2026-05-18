% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%
% Try to update active branch of <Path> from all possible remotes.
% Finishes after first success.
% NOTE: The <Name> argument is used only to improve readability of messages.

function update_current_branch(Name, Path)

status = fgit_tools.is_git_repo(Path);
if ~status
    msg = ['Error while updating: <' char(Name) '>' newline ...
           'not a git repository - ' newline ...
            char(Path) newline];
    error(msg)
end

[~, Current_branch] = fgit_tools.branch_list(Path);

Remotes_list = fgit_tools.remote_list;
Errors = [];
flag = false;
for i = 1:numel(Remotes_list)
    Remote = Remotes_list(i);
    URL = fgit_tools.remote_get_url(Path, Remote);
    try
        disp(['Update <' char(Name) '> from ' char(Remote)]) % FIXME: disp
        fgit_tools.pull(Path, Current_branch, Remote);
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

end



