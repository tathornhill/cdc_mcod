
# path to icd 10 codes for contributing to death
# note this database differs from both CM & PCS
icd_10_path <-  "https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Publications/ICD10/allvalid2023-detailed-titles-headings.csv"

# download and extract icd_10 dictionart
icd10_dictionary_raw <- read_csv(icd_10_path,
                                 skip = 6,
                                 col_names = TRUE)

# clean icd_10_dictionary_2023
icd10_dictionary <- icd10_dictionary_raw |>
  select(!`Status`) |>
  rename(icd10_code = Code,
         icd10_description = "ICD Title") |>
  filter(!is.na(icd10_code)) %>%
  mutate(icd10_code = str_remove_all(icd10_code, "\\."),
         icd10_description = str_squish(icd10_description))

# save icd_10_dictionary_2023
icd10_dictionary |>
  write_rds(here("out", "icd10_dictionary.rds"))