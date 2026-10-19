
% Test function to create new .fern_module JSON file

% TEST FOR NEW
%     [Name, Dependencies, Info, Tegs] = parse_fern_info(Path_to_fern_info)

clc

% Name = "aDevice";
% Dependencies = ["Connector", "Debug_msg"];
% Info = "Collection of classes for different measurment devices";
% Tegs = "Function generator; Electrometer; LCR meter; Lock-in amplifier";

% Name = "Aster_FRA";
% Dependencies = ["Time_domain_FRA", "aDevice", "klog"];
% Info = "Frequency response analysis by Aster device.";
% Tegs = "FRA, frequency response analysis";

% Name = "Common";
% Dependencies = [];
% Info = "Common functions for Matlab";
% Tegs = "files, path, figure, math";

% Name = "Connector";
% Dependencies = ["Debug_msg"];
% Info = "Collection of classes and functions for devices connection";
% Tegs = "USB; GPIB; ETHERNET; COM; connection;";

% Name = "Dahlia";
% Dependencies = ["aDevice"];
% Info = "Special type low current ammeter and function generator";
% Tegs = "";

% Name = "Debug_msg";
% Dependencies = [];
% Info = "Сustomizable debug messages";
% Tegs = "debug; pring; console";

% Name = "FRA_tools";
% Dependencies = ["Plotlib"];
% Info = "Collection of classes and functions for FRA analysis";
% Tegs = "plot; figure; FRA; frequency response analysis";

% Name = "klog";
% Dependencies = [];
% Info = "Сustomizable debug messages (replacement for Debug_msg)";
% Tegs = "debug; pring; console";

Name = "Plotlib";
Dependencies = ["ShadedErrorBar"];
Info = "Collection of functions for matlab plot";
Tegs = "plot; figure; logscale, tickmarks";

% Name = "Time_domain_FRA";
% Dependencies = ["FRA_tools", "Common", "klog"];
% Info = "Core functinons for real-time low freq FRA";
% Tegs = "FRA; frequency response analysis; Time domain";


Modules_info = [];
Modules_info.name = Name;
Modules_info.dependecies = Dependencies;
Modules_info.info = Info;
Modules_info.Tegs = Tegs;

Json_text = jsonencode(Modules_info, "PrettyPrint", true);

disp(Json_text);

%%
Filename = "TEST_file_01.txt";
fid = fopen(Filename, 'w');
fprintf(fid, Json_text);
fclose(fid);

%%

clc

Data = read_fern_info(Filename)

Data.name;
Data.dependecies;
Data.info;
Data.Tegs;


function Data = read_fern_info(Filename)
Json_text_in = fileread(Filename);

Table = jsondecode(Json_text_in);

Data = update_json_table(Table);

end



function Table = update_json_table(Table)

Fields = fieldnames(Table);
for i = 1:numel(Fields)

    Field_name = Fields{i};

    Column = Table.(Field_name);

    for j = 1:numel(Table)
        Data = Table(j).(Field_name);
        if class(Data) == "char"
            Data = string(Data);
        end
        if class(Data) == "cell"
            if class(Data{1}) == "char"
                Data2 = string.empty;
                for k = 1:numel(Data)
                    Data2(k) = string(Data{k});
                end
                Data = Data2;
            end
        end
        Table(j).(Field_name) = Data;
    end
end

end



