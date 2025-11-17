function URL = find_module_url(package_name)


Fern_path = get_fern_local_path();

    URL_list_file = [Fern_path 'Modules_url_list.txt'];

    Lines = readlines(URL_list_file);
    for i = 1:numel(Lines)
        Lines(i) = strtrim(Lines(i));
    end

    range = strlength(Lines) == 0;
    Lines(range) = [];
    
    ind = -1;
    for i = 1:numel(Lines)
        if Lines(i) == string(package_name)
            ind = i+1;
            break;
        end
    end

    if ind ~= -1
        URL = Lines(ind);
    else
        error(['Could not find URL for: ' char(package_name)]);
    end

end