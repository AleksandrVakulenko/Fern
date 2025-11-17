function include_in_path(package_name)
%     package_name = 'nyan';
    Modules_path = get_fern_modules_folder();
    Path = [Modules_path char(package_name)];
    if isfolder(Path)
        addpath(Path);
    else
        error('Wrong module path')
    end
end