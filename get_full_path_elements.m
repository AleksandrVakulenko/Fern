function Lines = get_full_path_elements()

Current_path = path;
Current_path = [Current_path ';'];

ind = strfind(Current_path, ';');

N = numel(ind);
Lines = string.empty;
position = 1;
for i = 1:N
    part = Current_path(position:ind(i)-1);
    position = ind(i)+1;
    Lines(i,1) = part;
end


end