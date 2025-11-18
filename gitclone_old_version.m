function status = gitclone_old_version(URL, Path, echo)
arguments
    URL string
    Path string
    echo logical = false
end

% CMD_str = ['cd ' char(Path) ' & git clone ' char(URL) ' .'];
CMD_str = ['(cd /d "' char(Path) '") & (git clone ' char(URL) ' .)'];

if echo
    disp(['CMD: ' newline char(CMD_str) newline])
    [status, ~] = system(CMD_str, "-echo");
else
    [status, ~] = system(CMD_str);
end

status = status == 0;

end

