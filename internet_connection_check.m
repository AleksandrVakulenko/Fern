function [connected] = internet_connection_check()

[~, ~, Lost] = ping(1);

if Lost ~= 0
    disp('Check internet connection ...'); % FIXME: disp
    [Send, Rec, Lost] = ping(5);
    Str = format_result(Send, Rec, Lost);
    disp(['Finished:' newline Str]); % FIXME: disp
end

if Lost == 0
    connected = true;
else
    connected = false;
end

end



function [Send, Rec, Lost] = ping(number_of_pakets, IP)
arguments
    number_of_pakets {mustBeInteger(number_of_pakets), ...
        mustBeGreaterThan(number_of_pakets, 0)} = 1
    IP string = "8.8.8.8"
end

if ispc
    C = evalc(['!ping -n ' num2str(number_of_pakets) ' ' char(IP)]);
elseif isunix
    C = evalc(['!ping -c ' num2str(number_of_pakets) ' ' char(IP)]);
else
    error('Under construction: currently unsupported platform')
end

Tokens = regexp(C, '= (\d+)', 'tokens');

Send = str2double(Tokens{1}{1});
Rec = str2double(Tokens{2}{1});
Lost = str2double(Tokens{3}{1});

if Send ~= Rec + Lost
    Str = format_result(Send, Rec, Lost);
    error(['error in ping cmd:' newline Str])
end

end


function Str = format_result(Send, Rec, Lost)

Str = ['  Send: ' num2str(Send) newline ...
    '  Rec: ' num2str(Rec) newline ...
    '  Lost: ' num2str(Lost)];

end




