function Modules_path = get_fern_modules_folder()
    Fern_path = get_fern_local_path();
    exist = find_file_in_dir(Fern_path, "Modules", "folder");
    if ~exist
        mkdir([char(Fern_path) 'Modules']);
    end
    Modules_path = [char(Fern_path) 'Modules\'];
end