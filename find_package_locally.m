function [Status, Name, Dependencies, Info] = find_package_locally(package_name)
    Name = string.empty; % FIXME: same code as in @parse_fern_info
    Dependencies = string.empty;
    Info = string.empty;
    
% package_name = 'nyan';

    Fern_modeule_info_filename = '.fern_module';

    Modules_path = get_fern_modules_folder();
    Path = [Modules_path char(package_name)];
    
    if ~isfolder(Path)
        Status = false;
        return;
    end

    names = dir(Path);
    b = struct2cell(names);
    is_fern_module = any(ismember(b(1,:), Fern_modeule_info_filename));

    if ~is_fern_module
%         rmdir(Path, 's'); % FIXME: add protection
        Status = false;
        return;
    end
    
    Path_to_fern_info = [Path '\' Fern_modeule_info_filename];
    [Name, Dependencies, Info] = parse_fern_info(Path_to_fern_info);

    if Name ~= string(package_name)
        Status = false;
    end

    Status = true;
end
























