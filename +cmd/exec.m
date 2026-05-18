
function [resp, cmd_status] = exec(CMD_str, echo)
arguments
    CMD_str string
    echo logical = false
end

if echo
    disp(['CMD: ' newline char(CMD_str) newline])
    [cmd_status, resp] = system(CMD_str, "-echo");
else
    [cmd_status, resp] = system(CMD_str);
end

if nargout > 1
    no_throw = true;
else
    no_throw = false;
end

if ~no_throw
    if cmd_status ~= 0
        msg = ['CMD execution fails:' newline ...
            '  CMD:' newline ...
            '  ' char(CMD_str)  newline ...
            'Response: ' newline ...
            char(resp)];
        error(msg)
    end
end


end



