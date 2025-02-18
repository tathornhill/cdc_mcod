# CDC Multiple Cause of Death (MCOD) Data


# Steps

1.  [read_cdc_data.QMD](read_cdc_data.QMD)
    Read in large CDC text files using `readr::read_fwf()` and save as a parquet file.
2.  [subset_cdc_mcod_drugs.qmd](subset_cdc_mcod_drugs.qmd)
    Subset the data to only include drug-related deaths and explore.
    This is a broad inclusion criteria (i.e., much broader than just overdoses).
3.  To do: join with ICD 10 descriptions

# Data Sources

[CDC Mortality Multiple Cause
Files](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm)  
*Note: I have only been able to extract these files using 7zip via the
terminal (installed via Brew). The archive package does not work.*

[CDC Mortality Multiple Cause
codebooks](https://www.cdc.gov/nchs/nvss/mortality_public_use_data.htm)

[ICD 10 Codes (1999-2023) for both underlying and multiple cause of
death](https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Publications/ICD10/allvalid2023-detailed-titles-headings.csv)  
*Note: This database differs from other ICD databases: CM (Clinical
Modification) and PCS (Procedure Coding System)*

ICD 10 codes associated with drugs:  
[ICD-10 CM: Hospital Drug
Use](https://www.cdc.gov/nchs/dhcs/drug-use/icd10-codes.htm)  
[ICD-10-CM: Table of Drugs &
Chemicals](https://ftp.cdc.gov/pub/health_statistics/nchs/publications/ICD10CM/2019/icd10cm_drug_2019.pdf)  
[2021
Addenda](https://ftp.cdc.gov/pub/health_statistics/nchs/publications/ICD10CM/2021/icd10cm_drug_addenda_2021.pdf)
