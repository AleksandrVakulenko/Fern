function [status, modified_files] = status(Path, echo)
arguments
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git ls-files --others --modified --exclude-standard'];

CMD_str = cmd.concat(cd_cmd, git_cmd);

[cmd_status, resp] = cmd.exec(CMD_str);

if cmd_status ~= 0
    warning('Git clone fails:')
    disp(resp);
    status = false;
    modified_files = '';
else
    status = true;
    modified_files = fgit_tools.parse_list(resp);
end

end