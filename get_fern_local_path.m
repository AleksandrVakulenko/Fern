function Path = get_fern_local_path()
Path = which("get_fern_local_path");
ind = strfind(Path, "get_fern_local_path.m");
Path = char(Path);
Path = Path(1:ind-1);
end
