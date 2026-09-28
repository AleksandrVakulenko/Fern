function Folders_list = get_list_of_folders(Path)
    content = dir(Path);
    content = struct2cell(content);
    is_dir = content(5, :);
    all_names = content(1, :);
    all_names = cellfun(@(x) string(x), all_names);
    is_dir = cell2mat(is_dir);
    all_names(~is_dir) = [];
    all_names(1:2) = [];

    Folders_list = all_names;
end