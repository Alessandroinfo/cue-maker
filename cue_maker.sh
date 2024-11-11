#!/bin/sh

# Default values for root, recursive, and overwrite
root="roms"
recursive="true"
overwrite="false"

# Check for input arguments
if [ -n "$1" ]; then
    root="$1"
fi

if [ -n "$2" ]; then
    case "$2" in
        Y|y|Yes|yes|T|t|True|true) recursive="true" ;;
        N|n|No|no|F|f|False|false) recursive="false" ;;
        *) echo "Invalid value for recursive. Use Y/N." ; exit 1 ;;
    esac
fi

if [ -n "$3" ]; then
    case "$3" in
        Y|y|Yes|yes|T|t|True|true) overwrite="true" ;;
        N|n|No|no|F|f|False|false) overwrite="false" ;;
        *) echo "Invalid value for overwrite. Use Y/N." ; exit 1 ;;
    esac
fi

# Define cue file template
cue='FILE "%FILENAME%" BINARY
TRACK 01 MODE1/2352
INDEX 01 00:00:00'

# Function to create or overwrite a .cue file if needed
create_cue_file() {
    dirpath=$1
    file=$2
    filename="${file%.*}"
    save_path="${dirpath}/${filename}.cue"

    # Create or overwrite .cue file based on overwrite setting
    if [ "$overwrite" = "true" ] || [ ! -f "$save_path" ]; then
        echo "${cue//%FILENAME%/$file}" > "$save_path"
        echo "Cue created: $save_path"
    else
        echo "Cue file already exists, skipping: $save_path"
    fi
}

# Traverse directories and create .cue files as needed
find "$root" -type f \( -iname "*.bin" -o -iname "*.iso" -o -iname "*.img" \) | while read filepath; do
    dirpath=$(dirname "$filepath")
    file=$(basename "$filepath")
    filename="${file%.*}"

    # Check if .cue file exists and create or skip based on overwrite setting
    if ! ls "$dirpath" | grep -iq "^${filename}.cue$" || [ "$overwrite" = "true" ]; then
        create_cue_file "$dirpath" "$file"
    fi

    # If recursive search is disabled, break after processing the first directory
    [ "$recursive" = "false" ] && break
done
