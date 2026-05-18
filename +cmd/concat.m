

function cmd_text = concat(varargin)

N = nargin;

cmd_text = '';
for i = 1:N
    cmd = char(varargin{i});
    if i ~= N
        cmd_text = [cmd_text cmd ' && '];
    else
        cmd_text = [cmd_text cmd];
    end
end

end

% FIXME: ??? 
% if isunix
%     CMD_str = [cd_cmd ' && ' git_cmd];
% else
%     CMD_str = ['(' cd_cmd ') && (' git_cmd ')'];
% end




