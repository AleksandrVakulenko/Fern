function [domain, is_ssh] = parse_url(URL)
arguments
    URL string
end

URL = char(URL);

if numel(URL) < 4
    error('wrong URL'); % FIXME: msg
end

is_ssh = string(URL(1:4)) == "git@";

if is_ssh
    ind1 = strfind(URL, "@");
    ind2 = strfind(URL, ":");
    domain = URL(ind1(1)+1 : ind2(1)-1);
else
    ind1 = strfind(URL, "https://");
    ind2 = strfind(URL, "/");
    domain = URL(ind1+numel('https://') : ind2(3)-1);
end
% class(domain)
ind = strfind(domain, '.');
if isempty(ind)
    errro('error parsing git URL'); % FIXME: msg
end

domain = domain(1:ind-1);

end