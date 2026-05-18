

function [Config_file, Temp_folder] = path_to_config_file()

Config_file_name = '.matlabfern';
Temp_folder_name = 'Matlab_Fern';

User_folder = fullfile(getenv('USERPROFILE'));
Config_file = fullfile([User_folder '/' Config_file_name]);

System_temp_folder = tempdir;
Temp_folder = fullfile([System_temp_folder '/' Temp_folder_name '/']);

end


