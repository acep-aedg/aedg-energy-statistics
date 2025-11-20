import pandas as pd

def read_and_clean(file, sheet_name, output_csv):
    df = pd.read_excel(file, sheet_name=sheet_name)

    df_clean = df.loc[:, ~df.columns.str.contains('^Unnamed')]
    
    df_clean.to_csv(output_csv, index=False)

financial_url = 'https://github.com/acep-uaf/ak-energy-statistics-2011_2021/raw/refs/heads/topical-tables-to-csv/workbooks/Energy_Stats_Financial_Tables.xlsx'
generation_url = 'https://github.com/acep-uaf/ak-energy-statistics-2011_2021/raw/refs/heads/topical-tables-to-csv/workbooks/Energy_Stats_Generation_Tables.xlsx'
infrastructure_url = 'https://github.com/acep-uaf/ak-energy-statistics-2011_2021/raw/refs/heads/topical-tables-to-csv/workbooks/Energy_Stats_Infrastructure_2021.xlsx'

read_and_clean(
    file=financial_url,
    sheet_name='Annual Sales FINAL 06262023',
    output_csv='data/annual_sales_2023-06-26.csv'
)

read_and_clean(
    file=generation_url,
    sheet_name='AnnualOperationsData 2023-11-13',
    output_csv='data/annual_operations_2023-11-13.csv'
)

read_and_clean(
    file=generation_url,
    sheet_name='Monthly Gen 2001-2021',
    output_csv='data/monthly_generation_2001-2021.csv'
)

read_and_clean(
    file=infrastructure_url,
    sheet_name='Infrastructure FINAL 2023-11-13',
    output_csv='data/infrastructure_2023-11-13.csv'
)

read_and_clean(
    file=infrastructure_url,
    sheet_name='LOOKUP PLANTS 2023-11-13',
    output_csv='data/deprecated/plants.csv'
)

read_and_clean(
    file=infrastructure_url,
    sheet_name='LOOKUP INTERTIES 2023-11-08',
    output_csv='data/deprecated/interties.csv'
)