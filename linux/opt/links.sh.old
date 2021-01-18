#!/bin/sh

set -e

# Get file name (without file extension) and contents
file_name=$(echo $1 | rev | cut -c 4- | rev)
file_contents=$(cat "$1")

# Get length of file name
# but also account for:
# + 4 for '[[]]'
# +1 for the semicolon
# +3 for .md
file_name_char_count=$(echo $file_name | wc -c)
file_name_char_count=$(expr $file_name_char_count + 4 + 1 + 3)

# Find what the file links to
printf "$(echo "$file_contents" | grep -Po '\[\[(.*?)\]\]+' | cut -c 3- | rev | cut -c 3- | rev)"
printf "\n"

# Find other files that link to it
regex="\[\[$file_name\]\]"
printf "$(find . -maxdepth 1 -name '*.md' -exec grep -HPo "$regex" {} \; | cut -c 3- | rev | cut -c $file_name_char_count- | rev)"

