repo_root="https://raw.githubusercontent.com/acep-aedg/aedg-metadata/refs/heads/main"


# Pull metadata to document files in `raw/dowl` (not necessarily for the Data Explorer) - only did this once.
# URLS like https://raw.githubusercontent.com/acep-aedg/aedg-metadata/refs/heads/main/metadata/raw/dowl/lookup_communities_2024-02-23.json
subdir=raw/dowl
cd ../data/$subdir
for file in lookup*.csv
   do 
      metadata="${file/.csv/.json}"
      echo "Pulling $metadata"
      wget -O $metadata ${repo_root}/metadata/${subdir}/$metadata
done
# also, there is a bespoke data dictionary. Get that too.
wget -O raw_dowl_data_dictionary.csv ${repo_root}/src/registry/raw_dowl_data_dictionary.csv

cd ../../../src