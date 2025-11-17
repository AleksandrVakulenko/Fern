
function Module_names = find_active_modules()

MF = get_fern_modules_folder();
Lines = get_full_path_elements();

ind_cell = strfind(Lines, MF);
ind = find(~cellfun("isempty", ind_cell));

Lines = Lines(ind);

Module_names = string.empty;
for i = 1:numel(Lines)
    Module_names(i) = get_last_folder(Lines(i));
end

end




function Folder_name = get_last_folder(Path)
    
    Path = erase_last_slash(Path);

    ind = strfind(Path, '\');
    ind = [ind strfind(Path, '/')];
    ind = max(ind);
    Folder_name = Path(ind+1:end);

end