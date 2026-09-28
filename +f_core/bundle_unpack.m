
function bundle_unpack(save_file_name)
arguments
    save_file_name string
end

Fern_path = f_core.get_fern_local_path();
Temp_path = [char(Fern_path) filesep 'temp'];
Temp_path = fullfile(Temp_path); % FIXME: check on linux;

exist = f_core.find_file_in_dir(Fern_path, "temp", "folder");
Temp_path = [char(Fern_path) filesep 'temp'];
Temp_path = fullfile(Temp_path); % FIXME: check on linux;

if ~exist
    mkdir(Temp_path);
end

Module_name_arr = [];
Bundle_file_path_arr = [];

Data = load(save_file_name);
Files_collection = Data.Files_collection;

for i = 1:numel(Files_collection)

    File_info = Files_collection(i);

    File_name = File_info.name;
    File_data = File_info.data;

    Bundle_file_path = [char(Temp_path) filesep File_name '.bundle'];

    disp(['Unpack bundle file: ' File_name '.bundle']); % FIXME: disp
    write_file(Bundle_file_path, File_data)

    Module_name = File_name;
    Module_name_arr = [Module_name_arr string(Module_name)];
    Bundle_file_path_arr = [Bundle_file_path_arr string(Bundle_file_path)];

end


Modules_path = f_core.get_fern_modules_folder();

for i = 1:numel(Module_name_arr)

    Module_name = Module_name_arr(i);
    Module_folder = [char(Modules_path) char(Module_name)];
    Bundle_file_path = Bundle_file_path_arr(i);

    exist = f_core.find_file_in_dir(Modules_path, Module_name, "folder");

    if exist
        rmdir(Module_folder, 's');
    end

    mkdir(Module_folder);

    disp(['clone from: ' char(Module_name) '.bundle']); % FIXME: disp
    fgit_tools.clone(Bundle_file_path, Module_folder);
    
    if isfile(Bundle_file_path)
        delete(Bundle_file_path);
    end
        
end


disp([newline 'Modules restored']); % FIXME: disp

end





function write_file(Path, Data)
arguments
    Path string
    Data uint8
end

fid = fopen(Path, 'wb');
fwrite(fid, Data, 'uint8');
fclose(fid);


end


