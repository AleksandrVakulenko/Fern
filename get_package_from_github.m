function status = get_package_from_github(package_name)

% package_name = "aDevice";


% status = false;

Modules_path = get_fern_modules_folder();
Path = [Modules_path char(package_name)];


URL = find_module_url(package_name);

mkdir(Path);

disp(['Clone Git repo: ' char(URL)])
status = fgit_tools.clone(URL, Path);


end



