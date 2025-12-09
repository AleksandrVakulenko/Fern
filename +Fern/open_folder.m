
function open_folder(module_name)
    arguments
        module_name string {isStringScalar(module_name)} = "";
    end
    
    Modules_path = get_fern_modules_folder();

    if module_name ~= ""
        exist = find_file_in_dir(Modules_path, module_name, "folder");
    
        if exist
            Path = fullfile([Modules_path char(module_name)]);
            open_folder_in_explorer(Path);
        else
            warning(['Folder "' char(module_name) '" does not exist.'])
        end
    else
        open_folder_in_explorer(Modules_path);
    end

end


function open_folder_in_explorer(Path)
    if ispc
        CMD_str = ['explorer.exe "' char(Path) '"'];
        [cmd_status, resp] = system(CMD_str);
    else
        warning('open_folder function is not supported')
    end
end

