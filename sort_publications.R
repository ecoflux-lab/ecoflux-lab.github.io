library(jsonlite)
library(dplyr)
library(purrr)

# Load JSON exported from Zotero
data <- fromJSON("lab_publications.json", flatten = TRUE)

# Function to extract year from each row
extract_year <- function(x) {
  # Case 1: If x is numeric (like 2022), return it
  if (is.numeric(x)) {
    return(x)
  }
  # Case 2: If x is a character vector, return first value as integer
  if (is.character(x) && length(x) > 0) {
    return(as.integer(trimws(x[1])))
  }
  return(NA_integer_)  # Fallback
}

# Apply to your dataframe
data <- data %>%
  mutate(year = map_int(`issued.date-parts`, extract_year))

# Sort by year
data_sorted <- data %>%
  arrange(desc(year))

data_sorted <- data_sorted %>%
  mutate(
    issued = pmap(list(year), function(y) {
      list(`date-parts` = list(c(as.character(y))))
    })
  )

# Drop original column
data_sorted <- data_sorted %>%
  select(-`issued.date-parts`)

# Write sorted JSON
write_json(data_sorted, "lab_publications_sorted.json", pretty = TRUE)

# Now list all papers

# Filter rows where type is not "thesis", then extract the id column
id_list <- data_sorted %>%
  filter(type != "thesis") %>%
  pull(id)

formatted_id <- paste0("@",id_list)

# Print each on its own line, without quotes
for (url in formatted_id) {
  cat(url, "\n")
}

# Filter rows where type is "thesis", then extract the id column
id_list <- data_sorted %>%
  filter(type == "thesis") %>%
  pull(id)

formatted_id <- paste0("@",id_list)

# Print each on its own line, without quotes
for (url in formatted_id) {
  cat(url, "\n")
}


