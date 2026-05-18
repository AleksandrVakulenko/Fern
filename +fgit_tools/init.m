% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git init
% init new local repo in Path
%

% FIXME: need test

function status = init(Path, echo)
arguments
    Path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);
git_cmd = 'git init';
CMD_str = cmd.concat(cd_cmd, git_cmd);

[cmd_status, resp] = cmd.exec(CMD_str, echo);

if cmd_status ~= 0
    warning('Git pull fails:')
    disp(resp);
    status = false;
else
    status = true;
end

end






