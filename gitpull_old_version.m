function status = gitpull_old_version(Path)

CMD_str = ['(cd /d "' char(Path) '") & (git pull origin master)'];
% [status, ~] = system(CMD_str, "-echo");
[status, ~] = system(CMD_str);

status = status == 0;

end