

function run_me_after_update(old_version, new_version)
arguments
    old_version f_helper.version_type
    new_version f_helper.version_type
end

if new_version > old_version
    disp('-----------------------');
    disp(['Old version: ' char(old_version.str)]);
    disp(['New version: ' char(new_version.str)]);
    disp('-----------------------');

end

end
