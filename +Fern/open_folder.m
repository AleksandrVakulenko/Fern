

% NOTE: opens folder in explorer if no output args are presented.
% NOTE: returnst path to module if single output arg is presented.

function Out_path = open_folder(module_name)
    arguments
        module_name string {isStringScalar(module_name)} = "";
    end
    
    Modules_path = f_core.get_fern_modules_folder();

    if module_name ~= ""
        exist = f_core.find_file_in_dir(Modules_path, module_name, "folder");
    
        if exist
            Path = fullfile([Modules_path char(module_name)]);
            if nargout == 0
                open_folder_in_explorer(Path);
                Out_path = Path;
            else
                % NOTE: just return path
                Out_path = Path;
            end
        else
            warning(['Folder "' char(module_name) '" does not exist.'])
        end
    else
        if nagrout == 0
            open_folder_in_explorer(Modules_path);
            Out_path = Modules_path;
        else
            % NOTE: just return path
            Out_path = Modules_path;
        end
    end

end


function open_folder_in_explorer(Path)
    if ispc
        CMD_str = ['explorer.exe "' char(Path) '"'];
        [cmd_status, resp] = system(CMD_str);
    elseif isunix
        CMD_str = ['xdg-open ' '"' char(Path) '"'];
        [cmd_status, resp] = system(CMD_str);
    else
        warning('open_folder function is not supported')
    end
end

