

Modules_list = struct("Name", "", "URL", "");

i = 0;

i = i + 1;
Modules_list(i).Name = "Connector";
Modules_list(i).URL = "https://github.com/AleksandrVakulenko/Device_connector_class.git";

i = i + 1;
Modules_list(i).Name = "aDevice";
Modules_list(i).URL = "https://github.com/AleksandrVakulenko/Automation_device_class.git";

i = i + 1;
Modules_list(i).Name = "Debug_msg";
Modules_list(i).URL = ["https://github.com/AleksandrVakulenko/Debug_msg_for_matlab.git"
                       "https://gitverse.ru/AleksandrVakulenko/Debug_msg_for_matlab.git"];

i = i + 1;
Modules_list(i).Name = "Plotlib";
Modules_list(i).URL = "https://github.com/AleksandrVakulenko/Matlab_plot_library.git";

i = i + 1;
Modules_list(i).Name = "FRA_tools";
Modules_list(i).URL = "https://github.com/AleksandrVakulenko/FRA_tools.git";

i = i + 1;
Modules_list(i).Name = "Common";
Modules_list(i).URL = "https://github.com/AleksandrVakulenko/Matlab_common_functions.git";

i = i + 1;
Modules_list(i).Name = "Dahlia";
Modules_list(i).URL = "https://github.com/AleksandrVakulenko/Dahlia_FE_analizer.git";




Filename = "Modules_url_list.txt";

Json_text = jsonencode(Modules_list, "PrettyPrint", true);

fid = fopen(Filename, 'w');
fprintf(fid, Json_text);
fclose(fid);



%%

Json_text_in = fileread(Filename);

Table = jsondecode(Json_text_in)


%%
clc

Fields = fieldnames(Table);

for i = 1:numel(Fields)

Field_name = Fields{i};

Column = Table.(Field_name);

for j = 1:numel(Table)
    Data = Table(j).(Field_name);
    if class(Data) == "char"
        Data = string(Data);
    end
    Table(j).(Field_name) = Data;
end


end








