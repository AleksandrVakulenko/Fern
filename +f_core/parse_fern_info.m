function [Name, Dependencies, Info, Tegs] = parse_fern_info(Path_to_fern_info)

Data = read_fern_info_json(Path_to_fern_info);

Name = Data.name;
Dependencies = Data.dependecies;
Info = Data.info;
Tegs = Data.Tegs;

for i = 1:numel(Dependencies)
    Dependencies(i) = f_helper.clear_lines(Dependencies(i));
end

if isempty(Name)
    Name = string.empty;
end

if isempty(Dependencies)
    Dependencies = string.empty;
end

if isempty(Info)
    Info = string.empty;
end

if isempty(Tegs)
    Tegs = string.empty;
end

end











function Data = read_fern_info_json(Filename)
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