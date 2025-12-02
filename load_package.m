% TODO:
% 1) multiple include problem (+V0.1)
% 2) add exclude function (+V0.1)
% 3) add internet connection check OR catch errors
% 4) add .fern_dependencies file (and Fern.auto)
% 5) update URL list parser (+V0.0.5)
% 6) update .fern_module parser (+V0.0.5)
% 7) add Fern.open_folder_of_module (+V0.0.5)
% 8) add Fern.updateall (+V0.1.0)
% 9) add second try if downloading problems (+V0.0.5)

% TODO 2025/12/01:
% 1) Exclude unused pathes (in case of Matlab crash it stays forever)
% 2) Check if git does not work
% 3) Create a function index (and find function)
% 4) Create file for dependencies to load
% 5) Overall refactor

% COMMON:
% 1) delete name from .fern_module
% 2) new logo
% 3) 

% Add new packeges
% 1) https://github.com/AleksandrVakulenko/Novocontrol-file-import.git
% 2) 

% DONE:
% 1) check what is included now
% 2) create new git API

% FIXME: ISSUE: if case of empty folder it clould be included


function load_package(package_name, update)
    arguments
        package_name string 
        update logical = false
    end
    % TODO: update modules list in arguments
    
    [found_localy, Name, Dependencies, Info] = find_package_locally(package_name);
    
    if found_localy == false
        downloaded = get_package_from_github(package_name);
        if ~downloaded
            error(['Error while downloading: ' char(package_name)])
        end
        % FIXME: do we need to get status twice?
        [status, Name, Dependencies, Info] = find_package_locally(package_name);
        if ~status
            error(['Could not find (after downloading) Fern module: '...
                char(package_name)]);
        end
    else
        status = true;
        if update
            update_package_from_github(package_name);
            [found_localy, Name, Dependencies, Info] = ...
                find_package_locally(package_name);
        end
        disp(['Fern: package <' char(package_name) '> was found locally'])
    end
    
    if status
        activate_package(package_name);
        
        for i = 1:numel(Dependencies)
            load_package(Dependencies(i), update);
        end
    else
        
        
        
    end

end




function activate_package(package_name)
    if ~is_included(package_name)
        include_in_path(package_name);
        disp(['Fern: package <' char(package_name) '> is included' newline])
    else
        disp(['Fern: package <' char(package_name) '> is already connected' newline])
    end
end


function status = is_included(package_name)
    Active_modules = find_active_modules();
    if ~isempty(Active_modules) 
        status = any(Active_modules == package_name);
    else 
        status = false;
    end
end












