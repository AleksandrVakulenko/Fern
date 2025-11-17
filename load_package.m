% TODO:
% 1) multiple indlude problem
% 2) update .fern_module parser
% 3) update URL list parser
% 4) create new git API
% 5) check what is included now
% 6) add exclude function
% 7) do not update if loaded from git


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
        disp(['Fern: package <' char(package_name) '> included' newline])
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

    include_in_path(package_name);
end




