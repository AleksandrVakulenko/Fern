

function update(mode)
arguments
    mode string {mustBeMember(mode, ["self", "included", "all"])} = "all"
end

switch mode
    case "self"
        Path = get_fern_local_path();
        fgit_tools.update_current_branch('Fern', Path);

    case "included"
        warning('Under construction')

    case "all"
        warning('Under construction')

    otherwise
        error('Unreachable')
end

end













