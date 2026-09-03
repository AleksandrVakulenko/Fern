
function Module_names = find_active_modules()

MF = get_fern_modules_folder();
Lines = get_full_path_elements();

ind_cell = strfind(Lines, MF);

% FIXME: need more test of this part ---- START OF SECTION
if class(ind_cell) == "cell"
    ind = find(~cellfun("isempty", ind_cell));
else
    if isempty(ind_cell)
        ind = [];
    else
        ind = 1;
    end
end

Lines = Lines(ind);
% END ON SECTION ----

Module_names = string.empty;
for i = 1:numel(Lines)
    Module_names(i) = get_last_folder_in_path(Lines(i));
end

end




function Folder_name = get_last_folder_in_path(Path)
    
    Path = erase_last_slash(Path);

    % for any type "\" "/"
    ind = strfind(Path, '\');
    ind = [ind strfind(Path, '/')];
    ind = max(ind);
    Folder_name = Path(ind+1:end);

end