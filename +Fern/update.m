

function update(mode)
arguments
    mode string {mustBeMember(mode, ["self", "included", "all"])} = "all"
end

switch mode
    case "self"
        Path = f_core.get_fern_local_path();
        fgit_tools.update_current_branch('Fern', Path);

    case "included"
        % FIXME: replace update_all by update(Folder_list) and call it
        warning('Under construction')

    case "all"
        update_all();

    otherwise
        error('Unreachable')
end

end





% NOTE: update all dounloaded modules
function update_all()

Connected = f_core.internet_connection_check();
if ~Connected
    % FIXME: add fallback servers
    error('Unable to establish an internet connection.')
end

Modules_path = f_core.get_fern_modules_folder();

Folders_list = f_core.get_list_of_folders(Modules_path);

for i = 1:numel(Folders_list)
    Path = [char(Modules_path) filesep char(Folders_list(i))];
    Path = fullfile(Path); % FIXME: check on linux;
    is_git = fgit_tools.is_git_repo(Path);
    if is_git
        modified_files = fgit_tools.status(Path);
        if ~isempty(modified_files)
            % FIXME: delete folder and re-download all
            warning(['Could not update: ' char(Folders_list(i))])
        else
            % FIXME: add options to pull from other location and branch
            fgit_tools.pull(Path);
            % FIXME: do fetch and print status if updater or not
            disp(['UPDATED: ' char(Folders_list(i))])
        end
    else
        % FIXME: delete unused folder
    end
end


end








