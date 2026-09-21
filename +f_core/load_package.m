
function load_package(package_name, update)
    arguments
        package_name string 
        update logical = false
    end
    % TODO: update modules list in arguments
    
    [found_localy, Name, Dependencies, Info] = f_core.find_package_locally(package_name);
    
    if found_localy == false
        downloaded = f_core.get_package_from_github(package_name);
        if ~downloaded
            error(['Error while downloading: ' char(package_name)])
        end
        % FIXME: do we need to get status twice?
        [status, Name, Dependencies, Info] = f_core.find_package_locally(package_name);
        if ~status
            error(['Could not find (after downloading) Fern module: '...
                char(package_name)]);
        end
    else
        status = true;
        if update
            f_core.update_package_from_github(package_name);
            [found_localy, Name, Dependencies, Info] = ...
                f_core.find_package_locally(package_name);
        end
        disp(['Fern: package <' char(package_name) '> was found locally'])
    end
    
    if status
        activate_package(package_name);
        
        for i = 1:numel(Dependencies)
            f_core.load_package(Dependencies(i), update);
        end
    else
        
        
        
    end

end




function activate_package(package_name)
    if ~is_included(package_name)
        f_core.include_in_path(package_name);
        disp(['Fern: package <' char(package_name) '> is included' newline])
    else
        disp(['Fern: package <' char(package_name) '> is already connected' newline])
    end
end


function status = is_included(package_name)
    Active_modules = f_core.find_active_modules();
    if ~isempty(Active_modules) 
        status = any(Active_modules == package_name);
    else 
        status = false;
    end
end












