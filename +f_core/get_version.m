

function Version = get_version()

Fern_path = f_core.get_fern_local_path();
Filename = [char(Fern_path) filesep 'README.md'];

Lines = readlines(Filename);

V_line = Lines(1); % FIXME: maybe not

Data = sscanf(V_line, '# Fern V%i.%i.%i');

Version.major = Data(1);
Version.minor = Data(2);
Version.micro = Data(3);
Version.str = [num2str(Data(1)) '.' num2str(Data(2)) '.' num2str(Data(3))];

end


