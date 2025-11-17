function status = update_package_from_github(package_name)

Modules_path = get_fern_modules_folder();
Path = [Modules_path char(package_name)];

disp(['Update from Git repo: ' char(package_name)])
status = gitpull_old_version(Path);


end