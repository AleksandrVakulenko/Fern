
% FIXME: add options for the case of corrupted version values

function run_me_after_update(old_v_int, new_v_int)
arguments
    old_v_int uint32
    new_v_int uint32
end

old_version = f_helper.version_type(old_v_int);
new_version = f_helper.version_type(new_v_int);

if new_version > old_version
    disp('-----------------------');
    disp(['Old version: ' char(old_version.str)]);
    disp(['New version: ' char(new_version.str)]);
    disp('-----------------------');

    if old_version < f_helper.version_type([1 5 1])
        Fern.update('all');
    end

end

end
