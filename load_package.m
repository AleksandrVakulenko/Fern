% TODO:
% 1) multiple include problem (+V0.1)
% 2) do not update if loaded from git (+V0.1)
% 3) add exclude function (+V0.1)
% 4) add internet connection check OR catch errors
% 5) update URL list parser (+V0.0.5)
% 6) update .fern_module parser (+V0.0.5)
% 7) 
%
% COMMON:
% 1) delete name from .fern_module
% 2) add more packages
% 3) create new git API
% 4) new logo
%
% DONE:
% 1) check what is included now
% 2) 


function load_package(package_name, update)
    arguments
        package_name string 
        update logical = false
    end
    % TODO: update modules list in arguments
    
    [status, Name, Dependencies, Info] = find_package_locally(package_name);
    
    if status == false
        status = get_package_from_github(package_name);
        [status, Name, Dependencies, Info] = find_package_locally(package_name);
    else
        disp(['Fern: package <' char(package_name) '> was found locally'])
    end
    
    if status
        activate_package(package_name, update);
        
        for i = 1:numel(Dependencies)
            load_package(Dependencies(i), update);
        end
    else
        error(['Could not find Fern module: ' char(package_name)]);
    end

end




function activate_package(package_name, update)
    if update
        update_package_from_github(package_name);
    end
    
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












