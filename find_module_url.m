function URL = find_module_url(package_name)
arguments
    package_name string
end

Fern_path = get_fern_local_path();

    URL_list_file = [Fern_path 'Modules_url_list.txt'];

    Json_text_in = fileread(URL_list_file);
    Modules_list = jsondecode(Json_text_in);
    

    Names = string.empty;
    for i = 1:numel(Modules_list)
        Names(i) = Modules_list(i).Name;
    end

    % FIXME: search function
    ind = find(Names == package_name);


    if isempty(ind)
        error(['Could not find URL for: ' char(package_name)]);
    elseif numel(ind) == 1
        URL = Modules_list(ind).URL;
    else
        msg = ['Module URL find is not possible, name search is ambiguous: ' ...
            char(package_name) newline 'possible candidates:' newline];

        for i = 1:numel(ind)
            msg = [msg  ' - ' Names(ind) newline];
        end
        error(msg);
    end

end