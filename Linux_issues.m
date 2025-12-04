%  FIXME
% Linux issues
% 
% 1) fatal: unable to access 'https://github.com/AleksandrVakulenko/Matlab_plot_library.git/': Could not resolve host: github.com

% 2) slash direction:
%
% Error using readlines
% Unable to find or open
% '/home/user/Documents/Fern/Modules/Plotlib\.fern_module'. Check the path and
% filename or file permissions.
% 
% Error in parse_fern_info (line 4)
%     Lines = readlines(Path_to_fern_info);
% 
% Error in find_package_locally (line 21)
%         [Name, Dependencies, Info] = parse_fern_info(Path_to_fern_info);
% 
% Error in load_package (line 50)
%         [status, Name, Dependencies, Info] = find_package_locally(package_name);
% 
% Error in Fern.load (line 14)
%     load_package(package_name, true);
% 
% 
%     