% 2026/09/28
% Aleksandr Vakulenko
%
% git function for Matlab versions less than R2023b:
%  - creates bundle file of selectet git repo
% 
%

function bundle_create(Path, Bundle_file_path, echo)
arguments
    Path string
    Bundle_file_path string
    echo logical = false
end

cd_cmd = cmd.cd(Path);

git_cmd = ['git bundle create ' char(Bundle_file_path) ' --all'];

CMD_str = cmd.concat(cd_cmd, git_cmd);
% CMD_str
cmd.exec(CMD_str, echo);

end







% 'git bundle create repo.bundle --all'







