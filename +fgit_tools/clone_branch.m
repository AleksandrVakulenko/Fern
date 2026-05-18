% 2026/05/18
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - git git clone -b <Branch> <URL>
% Creates local repo and clones <Branch> from <URL>
%

% FIXME: need test

function status = clone_branch(URL, Path, Branch, echo)
arguments
    URL string
    Path string
    Branch string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git clone -b' char(Branch) char(URL) ' .'];

CMD_str = cmd.concat(cd_cmd, git_cmd);

[cmd_status, resp] = cmd.exec(CMD_str, echo);

if cmd_status ~= 0
    warning('Git clone fails:')
    disp(resp);
    status = false;
else
    status = true;
end

end


% git clone -b dev https://github.com/AleksandrVakulenko/LCR_setup.git .







