# Fern V1.3.0
Matlab R2021 package manager

<div style="display: flex; align-items: flex-end; justify-content: center; gap: 16px;">
  <img src="logo/logo.png" width="270" alt="Fern logo" />
  <em style="font-size: 16px;">Your spells, always within reach.</em>
</div>

## Installation
1) You must have Git installed on your system.

2) Place this repo to any folder:

3) Permanently add downloaded folder to Matlab path:
    - Home -> Set path -> Add Folder

## Usage

### User functions

* To add any of avilable packages just execute Fern.load("package name");

    - This function will add the package to the current path.
    - If the package is missing, it will be downloaded from the remote repository.
    - The package will also be updated from the master branch each time you include it.

* Fern.remove("package name") 

    - Removes selected package from path.
    - "all" removes all included packeges from path.

* Fern.open_folder("package name")

    - Opens package folder in OS explorer.
    - Opens Module folder if the argument is not specified.

* Path = Fern.open_folder("package name")
    
    - If an output argument is specified, the function returns the system path to the folder, and File Explorer does not open.

* Fern.status()

    - Prints a list of included modules.

* Fern.update(arg)
    
    - arg == "self" : updates Fern from origin(remote) master(branch).
    - arg == "all" : updates all available modules.

* Fern.archive("create", Path_to_save_file_name)

    - Creates an archive file with all available modules.

* Fern.archive("restore", Path_to_save_file_name)

    - Restore modules from archive file.


### Adding new packages
~ This section is under construction ~

