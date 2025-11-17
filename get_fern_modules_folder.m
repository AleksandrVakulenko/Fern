

function Modules_path = get_fern_modules_folder()

Fern_path = get_fern_local_path();

names = dir(Fern_path);

names(1:2) = [];

exist = false;
for i = 1:numel(names)
    if names(i).name == "Modules" && names(i).isdir
        exist = true;
        break;
    end
end

if ~exist
    mkdir([char(Fern_path) 'Modules']);
end

% disp(['Exist: ' num2str(exist)])

Modules_path = [char(Fern_path) 'Modules\'];

end