function string = erase_last_slash(string)
    string = char(string);
    if string(end) == "/" || string(end) == "\"
        string(end) = [];
    end
end