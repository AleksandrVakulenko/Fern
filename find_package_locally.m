function [Status, Name, Dependencies, Info] = find_package_locally(package_name)
    Name = string.empty;
    Dependencies = string.empty;
    Info = string.empty;

    Fern_modeule_info_filename = '.fern_module';

    Modules_path = get_fern_modules_folder();
    Path = [Modules_path char(package_name)];
    
    if ~isfolder(Path)
        Status = false;
        return; % FIXME: early return
    end

    [contain_module_file, Path_to_fern_info] = ...
        find_file_in_dir(Path, Fern_modeule_info_filename);

    if contain_module_file
%         rmdir(Path, 's'); % FIXME: add protection
        [Name, Dependencies, Info] = parse_fern_info(Path_to_fern_info);
        if Name ~= string(package_name)
            Status = false;
            return; % FIXME: early return
        end
    end

    Status = true;
end






















