function [Name, Dependencies, Info] = parse_fern_info(Path_to_fern_info)
    % TODO: update parser

    Lines = readlines(Path_to_fern_info);
    for i = 1:numel(Lines)
        Lines(i) = strtrim(Lines(i));
    end

    Name = string.empty;
    Dependencies = string.empty;
    Info = string.empty;

    if lower(Lines(1)) == "name:"
        Name = Lines(2);
    else
        error('Wrong fern file structure (name)');
    end

    if lower(Lines(4)) == "dependencies:"
        k = 5;
        i = 1;
        while(strlength(Lines(k)) ~= 0)
            Dependencies(i) = clear_lines(Lines(k));
            i = i + 1;
            k = k + 1;
        end
    else
        error('Wrong fern file structure (dependencies)');
    end

    % FIXME: add info
end