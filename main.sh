#!/bin/bash

mkdir data
mkdir data/deprecated

# python src/xlsx2csv.py
# python src/interties2grids.py
# python src/codes2csv.py

# python src/salesoperations.py

./src/pull_metadata.sh

aedg_metadata generate lookup_fuelcode_2023-11-08 -d raw/dowl --bbox none --time none --data-dictionary raw_dowl_data_dictionary.csv --save