#!/usr/bin/env bash

AUTHOR="Mourad_Tiferras"
EMAIL="your_email@gmail.com"
NOW=$(date '+%Y/%m/%d %H:%M:%S')

FILENAME="$1"

if [ -z "$FILENAME" ]; then
    echo "Usage: file_heading.sh <filename>"
    exit 1
fi

if [ ! -f "$FILENAME" ]; then
    echo "File not found: $FILENAME"
    exit 1
fi


if grep -q "▒▓█▓▒" "$FILENAME"; then
    sed -i "s#\(Updated:\).*#\1 $NOW             */#" "$FILENAME"
    echo "Header already exists. Updated timestamp."
    exit 0
fi

header="/***************************************************************************************/
#
#░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░ ░▒▓██████▓▒░                                                   
#░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░ ▒▓█▓▒░░▒▓█▓▒░          Filename: $(basename "$FILENAME")       
#░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░ ▒▓█▓▒░                                                         
#░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░ ▒▓█▓▒░                 By: $AUTHOR <$EMAIL>                    
#░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░ ▒▓█▓▒░                                                         
#░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░ ▒▓█▓▒░░▒▓█▓▒░                                                  
# ░▒▓██████▓▒░░ ▒▓█▓▒░ ░▒▓██████▓▒░           Created: $NOW                           
#                                             Updated: $NOW                           
#                                                                                      
/***************************************************************************************/

"


TMP_FILE=$(mktemp)
echo "$header" > "$TMP_FILE"
echo "" >> "$TMP_FILE"
cat "$FILENAME" >> "$TMP_FILE"
mv "$TMP_FILE" "$FILENAME"

echo "Header added to $FILENAME"

