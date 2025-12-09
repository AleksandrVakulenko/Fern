

function status()

active_modules = find_active_modules();

if ~isempty(active_modules)
    disp("Active modules:")
    for i = 1:numel(active_modules)
        disp([' - ' char(active_modules(i))]);
    end
else
    disp("No active modules");
end

end