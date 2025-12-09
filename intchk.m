function [connected, Send, Rec, Lost] = intchk()

Num_to_send = 1;
IP = '8.8.8.8';

if ispc
    C = evalc(['!ping -n ' num2str(Num_to_send) ' ' IP]);
elseif isunix
    C = evalc(['!ping -c ' num2str(Num_to_send) ' ' IP]);
end

Tokens = regexp(C, '= (\d+)', 'tokens');

Send = str2double(Tokens{1}{1});
Rec = str2double(Tokens{2}{1});
Lost = str2double(Tokens{3}{1});

if Send ~= Rec + Lost
    warning('error in ping cmd')
end

if Lost == 0
    connected = true;
else
    connected = false;
end

end