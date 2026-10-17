

function run_me_after_update(old_version, new_version)
arguments
    old_version f_helper.version_type
    new_version f_helper.version_type
end

disp('--- run_me_after_update: debug mode')
disp(['old: ' char(old_version.str)]);
disp(['new: ' char(new_version.str)]);
disp(['new > old ? ' num2str(new_version > old_version)]);
disp('--- run_me_after_update: ----------')

end
