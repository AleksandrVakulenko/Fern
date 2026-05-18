

function List = parse_list(cmd_resp)

if isempty(char(cmd_resp))
    List = '';
else

    Tokens = split(cmd_resp, newline);

    List = string.empty;

    k = 0;
    for i = 1:numel(Tokens)

        Tok = Tokens{i};
        if ~isempty(Tok)
            k = k + 1;
            List(k) = strtrim(string(Tok));
        end
    end
    List = List';
end

end









