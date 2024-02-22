#/bin/bash

# Script using all files ending with .tar.gz
# and executes specific extracted folder to one folder.
# Can easily be modified with just remove "var/logs"

tar_files=$(find . -type f -name "*.tar.gz")

for tar_file in $tar_files
do
    # Extract the tar file
    tar -xvf $tar_file
    
    # Get the name of the tar file without the extension
    folder_name=$(basename -s .tar $tar_file)
    
    # Create a new folder with the same name as the tar file (without the extension)
    mkdir -p $folder_name
    mkdir -p all_logs
    # Move the extracted files to the new folder
    mv var/logs all_logs/$folder_name
    
done
