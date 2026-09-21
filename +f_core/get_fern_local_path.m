

function Path = get_fern_local_path()
Path = which("f_core.get_fern_local_path");
% ind = strfind(Path, "+f_core/get_fern_local_path.m")
ind = strfind(Path, "+f_core");
Path = char(Path);
Path = Path(1:ind-1);
end
