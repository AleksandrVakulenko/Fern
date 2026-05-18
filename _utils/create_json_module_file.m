
% Test function to create new .fern_module JSON file
%

Name = "aDevice";
Dependecies = ["Connector", "Debug_msg"];
Info = "Collection of classes for different measurment devices";
Tegs = "Function generator; Electrometer; LCR meter; Lock-in amplifier";
Search_index = "";


Modules_info.name = Name;
Modules_info.dependecies = Dependecies;
Modules_info.info = Info;
Modules_info.Tegs = Tegs;
Modules_info.search_index = Search_index;


Filename = "TEST_file_01.txt";

Json_text = jsonencode(Modules_info, "PrettyPrint", true);

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





