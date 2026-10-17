

function Version = get_fern_version()

Fern_path = f_core.get_fern_local_path();
Filename = [char(Fern_path) filesep 'README.md'];

Lines = readlines(Filename);

V_line = Lines(1); % FIXME: maybe not

Version = f_helper.version_type(V_line);

end


