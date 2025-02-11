
clean_age <- function(df) {
  df %>% mutate(
    detail_age = as.numeric(detail_age),
    age = case_when(
      detail_age == 999 ~ NA,
      age_type == 1 ~ detail_age,
      age_type == 2 ~ detail_age / 12,
      age_type == 4 ~ detail_age / 365,
      age_type == 5 ~ detail_age / (365 * 60),
      age_type == 6 ~ detail_age / (365 * 60 * 60)
    )
  )
}