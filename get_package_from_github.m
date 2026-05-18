function status = get_package_from_github(package_name)

% package_name = "aDevice";


% status = false;

Modules_path = get_fern_modules_folder();
Path = [Modules_path char(package_name)];


URL = find_module_url(package_name);

% FIXME: URL could be an array
if class(URL) ~= "char" && numel(URL) > 1
    if class(URL) == "cell"
        URL = URL{1};
    else
        URL = URL(1);
    end
end

mkdir(Path);

disp(['Clone Git repo: ' char(URL)]) % FIXME: disp function
try
    fgit_tools.clone(URL, Path);
    status = true;
catch
    status = false;
end


end



