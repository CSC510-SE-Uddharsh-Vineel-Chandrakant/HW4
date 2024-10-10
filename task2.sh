#!/bin/bash

# Task: List files containing the word "sample" and at least 3 occurrences of "CSC510"
grep -rl "sample" dataset1/ | \
xargs -I{} sh -c 'count=$(grep -o "CSC510" "{}" | wc -l); if [ "$count" -ge 3 ]; then echo "$count {}"; fi' | \

# Sort in descending order by count, then by file size
sort -k1,1nr -k2,2n | \

gawk '{size=$(stat -c "%s" $2); print $1, size, $2}' | \
sed 's/file_/filtered_/g; s/^.* //g' > output.txt

# Output the results
cat output.txt
