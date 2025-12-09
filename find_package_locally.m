function [Status, Name, Dependencies, Info] = find_package_locally(package_name)
    Name = string.empty;
    Dependencies = string.empty;
    Info = string.empty;

    Modules_path = get_fern_modules_folder();
    Path = fullfile([Modules_path char(package_name)]);
    
    if ~isfolder(Path)
        Status = false;
        return; % FIXME: early return
    end

    content = dir(Path);
    content = struct2cell(content);
    content = content(1, :);
    if numel(content) > 2
        Status = true;
    else
        Status = false;
        rmdir(Path);
    end

    Fern_modeule_info_filename = '.fern_module';

    [contain_module_file, Path_to_fern_info] = ...
        find_file_in_dir(Path, Fern_modeule_info_filename);

    if contain_module_file
        [Name, Dependencies, Info] = parse_fern_info(Path_to_fern_info);
        if Name ~= string(package_name)
            rmdir(Path, 's'); % FIXME: add protection
            Status = false;
            return; % FIXME: early return
        end
    end
end






















