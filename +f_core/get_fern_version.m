

function Version = get_fern_version()

Fern_path = f_core.get_fern_local_path();
Filename = [char(Fern_path) filesep 'README.md'];

Lines = readlines(Filename);

V_line = Lines(1); % FIXME: maybe not

Data = sscanf(V_line, '# Fern V%i.%i.%i');

Version.major = Data(1);
Version.minor = Data(2);
Version.micro = Data(3);
Version.str = [num2str(Data(1)) '.' num2str(Data(2)) '.' num2str(Data(3))];
Version.int = Data(1)*1000000 + Data(2)*1000 + Data(3);

end


