
function [Version_txt, Version_struct] = get_fern_vrersion()

Data = fileread('README.md');

Data = split(Data, newline);

Data = strtrim(Data{1});

ind = strfind(Data, 'V');

Data = Data(ind+1:end);

Version_txt = Data;

Tokens = split(Version_txt, '.');
Major = str2double(Tokens{1});
Minor = str2double(Tokens{2});
Micro = str2double(Tokens{3});


Version_struct = struct("major", Major, "minor", Minor, 'micro', Micro);

end