#!/bin/bash

# python src/xlsx2csv.py
# python src/interties2grids.py
# python src/codes2csv.py

python src/salesoperations.py

# ./src/pull_metadata.sh

aedg_metadata generate \
    data/public_fuel_prices/public_fuel_prices.csv \
    ~/repos/aedg-etl-2024/data-sources \
    --bbox infer \
    -t specify \
    --save
