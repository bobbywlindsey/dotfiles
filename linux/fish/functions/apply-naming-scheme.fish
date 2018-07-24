function apply-naming-scheme
    # lowercase all folders
    find . -depth -type d -execdir rename 'y/A-Z/a-z/' {} \;
    # lowercase all files
    find . -depth -type f -execdir rename 'y/A-Z/a-z/' {} \;
    # replace spaces with hyphens for all folders
    find . -depth -type d -execdir rename 's/ /-/g' {} \;
    # replace spaces with hyphens for all files
    find . -depth -type f -execdir rename 's/ /-/g' {} \;
end
