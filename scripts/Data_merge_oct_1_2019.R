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

 library(tidyverse)
write.csv(final_table_r3_jul25,"data_output/final_table_r3_jul25")

#keep combining files  rounds from jul_25

library(tidyverse)
table_trial <- read.table("data/2019-07-25-1203_BH_R4", header= TRUE, sep = "", skip = 54)
table_trial2<- read.table("data/2019-07-25-1212_BH_R4", header= TRUE, sep = "", skip = 53)
table2_r3_jul25 <-table_trial %>%
  select(date, hhmmss, BH445_LEAF, BH445_BLOCK, BH445_VINE, E, A, Ci, gsw, `Fv/Fm`)
table_trial3 <-read_table2("data/2019-07-25-1203_BH_R4", col_names = TRUE, skip = 54)
read_
table1_r5_okay <- read.csv("data/2019-07-25-1604_logdata_BH_R5.csv", header = TRUE, skip = 15,skipNul = TRUE)
table1_r5_short <- table1_r5_okay %>%
  select(date, hhmmss, BH445_LEAF, BH445_BLOCK, BH445_VINE, E, A, Ci, gsw, Fv.Fm) %>%
  mutate(day =206, year =2019, round = 5)
  table1_r5_short<- table1_r5_short[-1, ]
  
table2_r5_okay <- read.csv("data/2019-07-25-1604_BH_R5.csv", header = TRUE, skip = 13,skipNul = TRUE)           
table2_r5_short <- table2_r5_okay %>%
    select(date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, Fv.Fm) %>%
    mutate(day =206, year =2019, round = 5)
  table2_r5_short<- table2_r5_short[-1, ]
  
table3_r5_okay <- read.csv("data/2019-07-25-1603_BH_R5.csv", header = TRUE, skip = 13,skipNul = TRUE)           
  table3_r5_short <- table3_r5_okay %>%
    select(date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, Fv.Fm) %>%
    mutate(day =206, year =2019, round = 5)
  table3_r5_short<- table3_r5_short[-1, ]
  names(table1_r5_short) <- names(table2_r5_short) 
  names(table2_r5_short) <- names(table3_r5_short) 
identical(names(table1_r5_short), names(table2_r5_short))
identical(names(table2_r5_short), names(table3_r5_short))           

tabler5_ready <- rbind (table1_r5_short, table2_r5_short, table3_r5_short)

tabler4_4_okay <-read.csv("data/2019-07-25-1247_logdata_BH_R4.2_okay.csv",  header = TRUE, skip = 13,skipNul = TRUE)
table4_r4_short <- tabler4_4_okay %>%
  select(date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, Fv.Fm) %>%
  mutate(day =206, year =2019, round = 4)
table4_r4_short<- table4_r4_short[-1, ]

names(table3_r4_jul25_sel) <- names(table4_r4_short) 
identical(names(table3_r4_jul25_sel), names(table4_r4_short))



names(table1_r4_jul25_sel) <- names (table2_r4_jul25_sel)
identical(names(table1_r4_jul25_sel), names(table2_r4_jul25_sel))

names(table2_r4_jul25_sel) <- names (table3_r4_jul25_sel)
identical(names(table2_r4_jul25_sel), names(table3_r4_jul25_sel))

names(table3_r4_jul25_sel) <- names (table4_r4_short)
identical(names(table3_r4_jul25_sel), names(table4_r4_short))

table_diurnal_jul25_2 <- rbind(table1_r4_jul25_sel, table2_r4_jul25_sel, table3_r4_jul25_sel, table4_r4_short)

names(table_complete_jul25_1) <- names (table_diurnal_jul25_2)
names(table_diurnal_jul25_2) <- names (tabler5_ready)
table_diurnal_ju25_complete <- rbind (table_complete_jul25_1, table_diurnal_jul25_2, tabler5_ready)

table_diurnal_ju25_complete_okay <- table_diurnal_ju25_complete %>%
  mutate(date ="07-25-2019")
write.csv(table_diurnal_ju25_complete_okay, "data_output/table_diurnal_ju25_complete_okay")
