#combining data from round from jul_25

library(tidyverse)

table1_r3 <-read_csv("data/jul_25_BH_R3_A.csv")
table1_r3_jul25 <-table1_r3 %>%
  select(date, hhmmss, BH445_LEAF, BH445_BLOCK, BH445_VINE, E, A, Ci, gsw, `Fv/Fm`) 

table2_r3 <-read_csv("data/jul_25_BH_R3_G.csv")
table2_r3_jul25 <-table2_r3 %>%
  select(date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, `Fv/Fm`) 

table3_r3 <-read_csv("data/jul_25_BH_R3_M.csv")
table3_r3_jul25 <-table3_r3 %>%
  select(date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, `Fv/Fm`) 

names(table1_r3_jul25) <- names(table2_r3_jul25) 
names(table1_r3_jul25) <- names(table3_r3_jul25) 
identical(names(table1_r3_jul25), names(table2_r3_jul25)
[1] TRUE
identical(names(table1_r3_jul25), names(table3_r3_jul25)
          
table_complete_jul25_r3 <- rbind (table1_r3_jul25, table2_r3_jul25, table3_r3_jul25)

 final_table_r3_jul25 <-table_complete_jul25_r3 %>%
   mutate(round = 3, year = 2019)

write_csv( final_table_r3_jul25, "data_output/ final_table_r3_jul25)

