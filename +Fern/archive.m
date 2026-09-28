

% FIXME: add info

function archive(operation, save_file_name)
arguments
    operation string {mustBeMember(operation, ["create", "restore"])}
    save_file_name string = []
end

if operation == "create"
    f_core.bundle_pack(save_file_name);
else
    if isempty(save_file_name)
        error("The second argument must contain the name of the archive file.")
    end
    f_core.bundle_unpack(save_file_name);
end

end