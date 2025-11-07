library(readxl) 
library(janitor) 
library(readr) 
library(dplyr) 

source('src/workbooks_xlsx_to_csv.r')

energy_stats_financial_url <- 'https://github.com/acep-uaf/ak-energy-statistics-2011_2021/raw/refs/heads/topical-tables-to-csv/workbooks/Energy_Stats_Financial_Tables.xlsx' 

aedg_lookup_tables_final_url <- 'https://github.com/acep-aedg/aedg-data-pond/raw/refs/heads/main/data/raw/dowl/AEDG%20LOOKUP%20TABLES_FINAL.xlsx'

read_clean_write( 
  url = energy_stats_financial_url, 
  sheet = 'Annual Sales FINAL 06262023', 
  output = 'data/test/annual_sales.csv' 
)

read_clean_write( 
  url = aedg_lookup_tables_final_url, 
  sheet = 'LOOKUP INTERTIES 2024-02-23', 
  output = 'data/test/lookup_interties_2024_02_23.csv' 
)

read_clean_write( 
  url = aedg_lookup_tables_final_url, 
  sheet = 'LOOKUP OPERATOR 2025-03-07', 
  output = 'data/test/lookup_operator_2025_03_07.csv' 
)

read_clean_write( 
  url = aedg_lookup_tables_final_url, 
  sheet = 'LOOKUP PLANTS 2025-03-10', 
  output = 'data/test/lookup_plants_2025_03_10.csv' 
)

read_clean_write( 
  url = aedg_lookup_tables_final_url, 
  sheet = 'LOOKUP SalesReport 2025-03-03', 
  output = 'data/test/lookup_sales_report_2025_03_03.csv' 
)
