get_cdc_mcod <- function(path) {

  # Define column positions based on detailed file locations from the codebook
  column_specs_tb <- tribble(
    ~start, ~end, ~col_names, ~type,
    # 19, 19, "record_type", $redundant with resident_status
    20, 20, "resident_status",  "f",
    63, 63, "education", "f",
    #64, 64, "education reporting flag", #unnecessary post-2003
    65, 66, "month_of_death", "f",
    69, 69, "sex", "f",
    70, 70, "age_type", "f",
    71, 73, "detail_age", "i",
    74, 74, "age_substitution_flag", "f",
    # 75, 76, "age_recode_52", #redundant with detail age
    # 77, 78, "age_recode_27", #redundant with detail age
    # 79, 80, "age_recode_12", #redundant with detail age
    # 81, 82, "infant_age_recode_22", #redundant with detail age
    83, 83, "place_of_death", "f",
    84, 84, "marital status", "f",
    85, 85, "day_of_week_of_death", "f",
    102, 105, "data_year", "f",
    106, 106, "injury_at_work", "f",
    107, 107, "manner_of_death", "f",
    108, 108, "method_of_disposition", "f",
    109, 109, "autopsy", "f",
    144, 144, "activity_code", "f",
    145, 145, "place_of_injury", "f",
    146, 149, "underlying_icd10_code", "f",
    150, 152, "cause_recode_358", "f",
    154, 156, "cause_recode_113", "f",
    157, 159, "cause_recode_130", "f",
    160, 161, "cause_recode_39", "f",
    163, 164, "num_entity_axis_conditions", "i",
    165, 304, "entity_axis_conditions", "c",
    341, 342, "num_record_axis_conditions", "i",
    344, 443, "record_axis_conditions", "c",
    448, 448, "race_imputation_flag", "f",
    450, 450, "race", "f",
    484, 486, "hispanic_origin", "f",
    487, 488, "hispanic_origin_race_recode", "f",
    489, 490, "race_recode_40", "f",
    806, 809, "occupation_4_digit_code", "f",
    810, 811, "occupation_recode", "f",
    812, 815, "industry_4_digit_code", "f",
    816, 817, "industry_recode", "f"
    )

  column_specs <- fwf_positions(
    start = column_specs_tb$start,
    end = column_specs_tb$end,
    col_names = column_specs_tb$col_names)

  column_types = column_specs_tb %>%
    pull %>%
    str_c(collapse = "")

  # Read the fixed-width file
  df <- read_fwf(path,
          col_positions = column_specs,
          col_types = column_types) %>%
    rowid_to_column(., "id") %>%
    relocate(data_year, .before = "id")

  return(df)
}

