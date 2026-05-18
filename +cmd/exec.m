
function [cmd_status, resp] = exec(CMD_str, echo)
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

end



