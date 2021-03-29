groups <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T")

chart_df = data.frame(
  group = groups,
  cat1_1 = sample(1:60, 20)/10,
  cat2_1 = sample(1:60, 20)/10,
  cat3_1 = sample(1:60, 20)/10,
  cat4_1 = sample(1:60, 20)/10,
  cat1_2 = sample(1:60, 20)/10,
  cat2_2 = sample(1:60, 20)/10,
  cat3_2 = sample(1:60, 20)/10,
  cat4_2 = sample(1:60, 20)/10,
  cat1_3 = sample(1:60, 20)/10,
  cat2_3 = sample(1:60, 20)/10,
  cat3_3 = sample(1:60, 20)/10,
  cat4_3 = sample(1:60, 20)/10,
  pie1 = sample(1:60, 20)/10,
  pie2 = sample(1:60, 20)/10,
  pie3 = sample(1:60, 20)/10,
  pie4 = sample(1:60, 20)/10
)

write.csv(chart_df, "data/chart_df.csv", row.names = FALSE)

for (group in groups) {
  assign(paste0("table_", group),
         data.frame(
           A = sample(1:60, 8)/10,
           B = sample(1:60, 8)/10,
           C = sample(1:60, 8)/10,
           D = sample(1:60, 8)/10, 
           E = sample(1:60, 8)/10
         ))
  write.csv(get(paste0("table_", group)), 
            paste0("data/table_", group, ".csv"),
            row.names = FALSE)
}
