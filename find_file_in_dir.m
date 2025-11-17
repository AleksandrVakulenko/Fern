function [status, path_to_name] = find_file_in_dir(folder, name, type)
arguments
    folder string
    name string
    type {mustBeMember(type, ["file", "folder"])} = "file"
end

    content = dir(folder);
    content = struct2cell(content);
    all_names = content(1, :);
    is_dir = content(5, :);
    ind = find(ismember(all_names, name));

    status = ~isempty(ind);
   
    if status && (type == "folder")
        status = status & is_dir{ind};
    elseif status && (type == "file")
        status = status & ~is_dir{ind};
    end

    if status
        folder = erase_last_slash(folder);
        path_to_name = [char(folder) '\' char(name)];
    else
        path_to_name = string.empty;
    end
end




% TODO: make external function
function string = erase_last_slash(string)
    string = char(string);
    if string(end) == "/" | string(end) == "\"
        string(end) = [];
    end
end
