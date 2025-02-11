# ICD 10 Codes

# F10–F19: Mental and Behavioral Disorders Due to Psychoactive Substance Use
sub_use_dx <- c(
  #"F10", # alcohol
  "F11", # opioids
  "F12", # cannabis
  "F13", # sedatives(or hypnotics)
  "F14", # cocaine
  "F15", # other stimulants
  "F16", # hallucinogens
  #"F17", # tobacco
  "F18", # inhalants
  "F19" # multiple drugs & other drugs
)

# P04: Newborn Affected by Maternal Factors and Complications of Pregnancy, Labor, and Delivery
# P96: Conditions Originating in the Perinatal Period
newborn_perinatal_factors_dx <- c(
  #"P040",  # Maternal anesthesia and analgesia
  #"P041",  # Maternal medication (incl. opioids)
  #"P042",  # Maternal use of tobacco
  "P044", # Maternal use of drugs of addiction
  #"P048"  # Maternal use of alcohol
  "P961"  # Neonatal withdrawal symptoms from maternal drugs of addiction
  #"P962"   # Withdrawal symptoms from therapeutic drug use in newborn
)

# R78: Findings of Drugs and Other Substances, Not Normally Found in Blood
drug_findings_dx <- c(
  #"R780",  # Finding of alcohol in blood
  "R781",  # Finding of opiate in blood
  "R782",  # Finding of cocaine in blood
  "R783",  # Finding of hallucinogen in blood
  "R784",  # Finding of other addictive drugs in blood
  "R785",  # Finding of psychotropic drug in blood
  "R786"   # Finding of other drugs and medicinal substances in blood
)

# Z79: Long-Term (Current) Drug Therapy
long_term_therapy_dx <- c(
  "Z798" # Long-term use of opiates
)

# T36–T50: Poisoning by Drugs, Medicaments, and Biological Substances
opioids <- c(
  "T400", # opium,
  "T401", # heroin
  "T402", # other (natural and semisynthetic) opioids (codeine, morphine)
  "T403", # methadone
  "T404", # synthetic opioids, other than methadone (fentanyl, tramadol)
  "T406") # other and unspecified narcotics

stimulants <- c(
  "T405", # cocaine
  "T436") # psychostimulant (methamphetamines, mdma, etc.)

other_drugs <- c(
  "T407", # cannabis
  "T408", # lsd
  "T409", # other hallucinogens
  "T424", # benzodiazepines
  "T426") # antiepileptic and sedative-hypnotics

all_drug_related_codes <- c(
  sub_use_dx,
  newborn_perinatal_factors_dx,
  drug_findings_dx,
  long_term_therapy_dx,
  opioids,
  stimulants,
  other_drugs)

# cause of death (cod or intent)
accidental <- c("X40", "X41", "X42", "X43", "X44")
intentional <- c("X60", "X61", "X62", "X63", "X64")
assault <- "X85"
undetermined <- c("Y10", "Y11", "Y12", "Y13", "Y14")

drug_filter <- function(df){
  df %>%
    filter(str_detect(record_axis_conditions, str_c(all_drugs, collapse = "|"))) %>%
    mutate(any_opioid = case_when(
      str_detect(record_axis_conditions, "T400|T401|T402|T403|T404|T406") ~ 1,
      TRUE ~ 0),
      opium = case_when(
        str_detect(record_axis_conditions, "T400") ~ 1,
        TRUE ~ 0),
      heroin = case_when(
        str_detect(record_axis_conditions, "T401") ~ 1,
        TRUE ~ 0),
      other_opioids = case_when(
        str_detect(record_axis_conditions, "T402") ~ 1,
        TRUE ~ 0),
      methadone = case_when(
        str_detect(record_axis_conditions, "T403") ~ 1,
        TRUE ~ 0),
      synthetic_opioids = case_when(
        str_detect(record_axis_conditions, "T404") ~ 1,
        TRUE ~ 0),
      other_narcotics = case_when(
        str_detect(record_axis_conditions, "T406") ~ 1,
        TRUE ~ 0),
      cocaine = case_when(
        str_detect(record_axis_conditions, "T405") ~ 1,
        TRUE ~ 0),
      psychostimulants = case_when(
        str_detect(record_axis_conditions, "T436") ~ 1,
        TRUE ~ 0),
      benzodiazepines = case_when(
        str_detect(record_axis_conditions, "T424") ~ 1,
        TRUE ~ 0),
      antiepileptic_sedative_hypnotics = case_when(
        str_detect(record_axis_conditions, "T426") ~ 1,
        TRUE ~ 0),
      lsd = case_when(
        str_detect(record_axis_conditions, "T408") ~ 1,
        TRUE ~ 0),
      other_hallucinogens = case_when(
        str_detect(record_axis_conditions, "T409") ~ 1,
        TRUE ~ 0),
      cannabis = case_when(
        str_detect(record_axis_conditions, "T407") ~ 1,
        TRUE ~ 0),
      cod = case_when(
        str_detect(record_axis_conditions, "X4[0-4]") ~ "accidental",
        str_detect(record_axis_conditions, "X6[0-4]") ~ "intentional",
        str_detect(record_axis_conditions, "X85") ~ "assault",
        str_detect(record_axis_conditions, "X4[0-4]") ~ "undetermined",
        TRUE ~ NA_character_)
      )
}