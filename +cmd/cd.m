
function cmd_text = cd(Path)
arguments
    Path string
end

if isunix
    cmd_text = ['cd "' char(Path) '"'];
else
    cmd_text = ['cd /d "' char(Path) '"'];
end


end