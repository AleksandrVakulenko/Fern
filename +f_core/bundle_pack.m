
% FIXME: check save_file_name path correctness 

function bundle_pack(save_file_name)
arguments
    save_file_name string = []
end

Fern_path = f_core.get_fern_local_path();

if isempty(save_file_name)
    save_file_name = [char(Fern_path) 'temp' filesep 'bundle.mat'];
end

Modules_path = f_core.get_fern_modules_folder();

exist = f_core.find_file_in_dir(Fern_path, "temp", "folder");

Temp_path = [char(Fern_path) filesep 'temp'];
Temp_path = fullfile(Temp_path); % FIXME: check on linux;

if ~exist
    mkdir(Temp_path);
end



% Temp_path


Bundle_files_arr = [];
Module_name_arr = [];
Folders_list = f_core.get_list_of_folders(Modules_path);

for i = 1:numel(Folders_list)
    Module_name = char(Folders_list(i));
    Module_path = [char(Modules_path) Module_name];
    is_git = fgit_tools.is_git_repo(Module_path);
    if is_git

%         Path
        Bundle_file_name = [Module_name '.bundle'];
        Bundle_path = [Temp_path filesep Module_name '.bundle'];
        Bundle_files_arr = [Bundle_files_arr string(Bundle_file_name)];
        Module_name_arr = [Module_name_arr string(Module_name)];
        disp(['Creating bundle of: ' Module_name]); % FIXME: disp
        fgit_tools.bundle_create(Module_path, Bundle_path);
    else
        % FIXME: delete unused folder
    end
end



Files_collection = [];

for i = 1:numel(Module_name_arr)

Module_name = char(Module_name_arr(i));
Bundle_file_name = [Module_name '.bundle'];
Bundle_path = [Temp_path filesep char(Bundle_file_name)];

disp(['Place to archive: ' Bundle_file_name]); % FIXME: disp
Bytes = read_file(Bundle_path);

File_data.name = Module_name;
File_data.data = Bytes;

Files_collection = [Files_collection File_data];

if isfile(Bundle_path)
    delete(Bundle_path);
end

end

save(save_file_name, 'Files_collection');

disp([newline 'Archive ready:']); % FIXME: disp
disp(save_file_name) % FIXME: disp

end


function Bytes = read_file(Path)
    fid = fopen(Path, 'r');
    try
        Bytes = fread(fid, Inf, '*uint8');
    catch err
        fclose(fid);
        rethrow(err);
    end
    fclose(fid);
end









