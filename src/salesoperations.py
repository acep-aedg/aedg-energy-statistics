from pathlib import Path

import pandas as pd

# TODO 
# change output into nested directory 
# which will eventually contain CSV/GeoJSON data, YML config, JSON metadata, MD readme

def read_and_clean(file, sheet_name, outname):
    df = pd.read_excel(file, sheet_name=sheet_name)

    df_clean = df.loc[:, ~df.columns.str.contains('^Unnamed')]

    output_dir = Path.cwd() / "data" /Path(outname).stem
    output_dir.mkdir(parents=True, exist_ok=True)

    df_clean.to_csv(output_dir / outname, index=False)

    

financial_url = 'https://github.com/acep-uaf/ak-energy-statistics-2011_2021/raw/refs/heads/topical-tables-to-csv/workbooks/Energy_Stats_Financial_Tables.xlsx'
generation_url = 'https://github.com/acep-uaf/ak-energy-statistics-2011_2021/raw/refs/heads/topical-tables-to-csv/workbooks/Energy_Stats_Generation_Tables.xlsx'
infrastructure_url = 'https://github.com/acep-uaf/ak-energy-statistics-2011_2021/raw/refs/heads/topical-tables-to-csv/workbooks/Energy_Stats_Infrastructure_2021.xlsx'

read_and_clean(
    file=financial_url,
    sheet_name='Annual Sales FINAL 06262023',
    outname='annual_sales_2023-06-26.csv'
)

read_and_clean(
    file=generation_url,
    sheet_name='AnnualOperationsData 2023-11-13',
    outname='annual_operations_2023-11-13.csv'
)

read_and_clean(
    file=generation_url,
    sheet_name='Monthly Gen 2001-2021',
    outname='monthly_generation_2001-2021.csv'
)

read_and_clean(
    file=infrastructure_url,
    sheet_name='Infrastructure FINAL 2023-11-13',
    outname='infrastructure_2023-11-13.csv'
)

read_and_clean(
    file=infrastructure_url,
    sheet_name='LOOKUP PLANTS 2023-11-13',
    outname='plants.csv'
)

read_and_clean(
    file=infrastructure_url,
    sheet_name='LOOKUP INTERTIES 2023-11-08',
    outname='interties.csv'
)