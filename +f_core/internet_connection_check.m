
% NOTE: add more variants

function [connected] = internet_connection_check()

Google_DNS = checkConnection('8.8.8.8',   53);    % Google DNS
Github_HTTPS = checkConnection('github.com', 443); % github HTTPS
Github_SSH = checkConnection('github.com', 22);  % git SSH

connected = Google_DNS && Github_HTTPS && Github_SSH;

end





function isConnected = checkConnection(ipAddress, port, Timeout)
arguments
    ipAddress = '8.8.8.8'
    port = 53
    Timeout = 2.0
end

    if Timeout < 1
        Timeout = 1.0;
    end

    try
        t = tcpclient(ipAddress, port, "ConnectTimeout", Timeout);
        isConnected = true;
        clear t;   % close connection
    catch
        isConnected = false;
    end
end





% Service    Port     Typical target
% HTTP       80       web servers, routers, IoT
% HTTPS      443      web servers
% SSH        22       Linux servers
% Telnet     23       routers, switches
% DNS        53       8.8.8.8, 1.1.1.1
% RDP        3389     Windows PCs
% SMB        445      Windows file shares


% checkConnection('8.8.8.8',   53)    % Google DNS
% checkConnection('1.1.1.1',   53)    % Cloudflare DNS
% checkConnection('google.com', 443)  % Google HTTPS
% checkConnection('github.com', 443); % github HTTPS
% checkConnection('github.com', 22);  % git SSH
% checkConnection('192.168.1.1', 80)  % router's web UI
% checkConnection('192.168.0.1', 80)  % router's web UI

% NOTE: full router check
% ips   = {'192.168.1.1','192.168.0.1','192.168.2.1','192.168.50.1','192.168.88.1'};
% ports = [80 443 8443 23 22 2022 7007];


