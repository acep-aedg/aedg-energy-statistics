#!/bin/sh

repo_root="https://github.com/acep-aedg/aedg-metadata/raw/refs/heads/main"

# Pull metadata to document files in `data`
# URLS like https://raw.githubusercontent.com/acep-aedg/aedg-metadata/refs/heads/main/metadata/raw/dowl/lookup_communities_2024-02-23.json
subdir=raw/dowl

for file in data/lookup*.csv; do
  [ -e "$file" ] || continue

  base="${file##*/}"                     
  metadata="${base%.csv}.json"           
  url="$repo_root/metadata/$subdir/$metadata"
  out="data/$metadata"

  if wget -q -O "$out" "$url"; then
    printf '%s: Success\n' "${base%.csv}"
  else
    rc=$?
    printf >&2 '%s: Error (wget exit %d) — %s\n' "$metadata" "$rc" "$url"
  fi
done


# also pull the data dictionary
data_dictionary_url="$repo_root/src/registry/raw_dowl_data_dictionary.csv"
out="data/data_dictionary.csv"

if wget -q -O "$out" "$data_dictionary_url"; then
   printf "Data Dictionary: Success\n"
else
   rc=$?
   printf >&2 "Error fetching the data dictionary: (wget exit %d)"
fi




