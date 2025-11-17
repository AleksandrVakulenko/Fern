function Lines = clear_lines(Lines)
    pat=num2cell('!@#$%^&*()+<,>.\|/''"?;:');
    for i = 1:numel(Lines)
        Lines(i) = strtrim(Lines(i));
        Lines(i) = erase(Lines(i), pat);
    end
end