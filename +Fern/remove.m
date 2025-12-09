
function remove(module_name)
    arguments
        module_name string {isStringScalar(module_name)} = "all";
    end
    
    active_modules = find_active_modules();
    
    if module_name == "all"
        for i = 1:numel(active_modules)
            exclude_single_module(active_modules(i))
        end
    else
        if any(module_name == active_modules)
            exclude_single_module(module_name)
        end
    end
end


function exclude_single_module(module_name)
    Modules_path = get_fern_modules_folder();
    Path = [Modules_path char(module_name)];
    Path = fullfile(Path);
    rmpath(Path);
    disp([char(module_name) ' excluded from Path']);
end