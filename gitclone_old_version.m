function status = gitclone_old_version(URL, Path)

CMD_str = ['cd ' char(Path) ' & git clone ' char(URL) ' .'];
% [status, ~] = system(CMD_str, "-echo");
[status, ~] = system(CMD_str);

status = status == 0;

end

