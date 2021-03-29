library(dplyr)
library(reticulate)

# source edit_pres function
reticulate::source_python("edit_pres.py")

# load in data files
for (file in list.files("data")) {
  splits <- strsplit(file, "\\.")
  assign(splits[[1]][1],
         read.csv(paste0("data/", file)))
} 

# rowwise mutate a list column onto chart_df containing the table data for each group
full_data <- chart_df %>% 
  rowwise() %>% 
  dplyr::mutate(table = list(get(paste0("table_", group))))

# create outputs directory if it doesn't exist
if (!dir.exists("outputs")) {
  dir.create("outputs")
}

# rowwise mutate the edit_pres function to generate parametrized powerpoint
generate_ppt <- full_data %>% 
  rowwise() %>% 
  dplyr::mutate(
    ppt = edit_pres(group, ., table, "templates/ppt-template.pptx", 
                                paste0("outputs/report_group_", group, ".pptx"))
    )
