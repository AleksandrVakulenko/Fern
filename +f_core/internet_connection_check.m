
% FIXME: unused
% FIXME: (2) add different IPs

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

% FIXME: bad code
Lines = fgit_tools.parse_list(C);
ind_tx = find_str_in_arr(Lines, "transmitted");
ind_rx = find_str_in_arr(Lines, "received");
if ind_tx ~= ind_rx
    error('.'); % FIXME: msg
end
Line = Lines(ind_tx)

Tokens = regexp(Line, '= (\d+)', 'tokens');

error('FIXME: unfunished code')
% NOTE: maybe this
% regexp("1 packets transmitted, 1 received, 0% packet loss, time 0ms", ...
%        "(\d+) packets transmitted, (\d+) received", ...
%        "tokens")





Send = str2double(Tokens{1}{1});
Rec = str2double(Tokens{2}{1});
% Lost = str2double(Tokens{3}{1});
Lost = Send - Rec;


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


function ind = find_str_in_arr(arr, str)
ind = [];
for i = 1:numel(arr)
    if contains(arr(i), str)
        ind = [ind i];
    end
end

end



% NOTE: ping out for linux
%     "PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data."
%     "64 bytes from 8.8.8.8: icmp_seq=1 ttl=103 time=133 ms"
%     "--- 8.8.8.8 ping statistics ---"
%     "1 packets transmitted, 1 received, 0% packet loss, time 0ms"
%     "rtt min/avg/max/mdev = 133.181/133.181/133.181/0.000 ms"


