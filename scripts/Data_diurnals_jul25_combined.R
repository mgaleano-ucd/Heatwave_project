# Combining rounds diurnal jul_25

library(tidyverse)
table1_r4_jul25 <-read_table2("data/2019-07-25-1203_BH_R4", col_names = TRUE, skip = 54)
table1_r4_jul25_sel<- table1_r4_jul25 %>%
  select (date, hhmmss, BH445_LEAF, BH445_BLOCK, BH445_VINE, BAR, E, A, Ci, gsw, `Fv/Fm`) %>%
  mutate(day = 206, year =2019, round = 4) %>%   
  mutate (BH445_LEAF = BH445_BLOCK, BH445_BLOCK = BH445_VINE, BH445_VINE = BAR) %>%
  select( -BAR) %>%
  filter (date == 20190724) %>%
  mutate(date = 20190725)
table2_r4_jul25<- read_table2 ("data/2019-07-25-1212_BH_R4", col_names = TRUE, skip =53)
library(tidyverse)
table2_r4_jul25_sel<- table2_r4_jul25 %>%
  select (date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, `Fv/Fm`) %>%
  mutate(day = 206, year =2019, round = 4)%>%
  filter (date == 20190725)
table2_r4_jul25_sel$BH_Vine[21] <- 1

table3_r4_jul25<- read_table2 ("data/2019-07-25-1216_logdata_BH_R4", col_names = TRUE, skip =53)
table3_r4_jul25_sel<- table3_r4_jul25 %>%
  select (date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, `Fv/Fm`) %>%
  mutate(day = 206, year =2019, round = 4)%>%
  filter (date == 20190725)
table4_r4_jul25<-read_table2 ("data/2019-07-25-1247_logdata_BH_R4.2", col_names = TRUE, skip =53)
table3_r4_jul25<- read_table2 ("data/2019-07-25-1216_logdata_BH_R4", col_names = TRUE, skip =53)
table4_r4_jul25_sel<- table4_r4_jul25 %>%
  select (date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, `Fv/Fm`) %>%
  mutate(day = 206, year =2019, round = 4)%>%
  filter (date == 20190725)
table1_r5_jul25<-read_table2 ("data/2019-07-25-1603_BH_R5", col_names = TRUE, skip =53)
table1_r5_jul25_sel<- table1_r5_jul25 %>%
  select (date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, `Fv/Fm`) %>%
  mutate(day = 206, year =2019, round = 5)%>%
  filter (date == 20190725)

table2_r5_jul25<-read_table2 ("data/2019-07-25-1604_BH_R5", col_names = TRUE, skip =53)
table2_r5_jul25_sel<- table2_r5_jul25 %>%
  select (date, hhmmss, BH_Leaf, BH_Block, BH_Vine, E, A, Ci, gsw, `Fv/Fm`) %>%
  mutate(day = 206, year =2019, round = 5)%>%
  filter (date == 20190725)

table3_r5_jul25<-read_table2 ("data/2019-07-25-1604_logdata_BH_R5", col_names = TRUE, skip =54)
table3_r5_jul25_sel<- table3_r5_jul25 %>%
  select (date, hhmmss, BH445_LEAF, BH445_BLOCK, BH445_VINE, E, A, Ci, gsw, `Fv/Fm`) %>%
  mutate(day = 206, year =2019, round = 5)%>%
  filter (date == 20190724) %>%
  mutate (date =20190725)

names(table1_r4_jul25_sel) <- names(table2_r4_jul25_sel) 
names(table2_r4_jul25_sel) <- names(table3_r4_jul25_sel) 
identical(names(table1_r4_jul25_sel), names(table2_r4_jul25_sel))
identical(names(table2_r4_jul25_sel), names(table3_r4_jul25_sel))

names(table1_r5_jul25_sel) <- names(table2_r5_jul25_sel) 
names(table2_r5_jul25_sel) <- names(table3_r5_jul25_sel) 
identical(names(table1_r5_jul25_sel), names(table2_r5_jul25_sel))
identical(names(table2_r5_jul25_sel), names(table3_r5_jul25_sel))          

table_r1<- read_csv("data_output/2019-07-25-0431_BH_R1_combined.csv")
table_r2<- read.table("data_output/table_complete_jul25_r2",header = TRUE,sep = ",")
library(tidyverse)

table_r2_final <- table_r2 %>%
  mutate(day =206, year = 2019, round = 2) %>%
  select(-X)

table_r1_final <- table_r1 %>%
  select(date, hhmmss, BH445_LEAF, BH445_BLOCK, BH445_VINE, E, A, Ci, gsw, Fv/Fm) %>%
mutate(day = 206, year =2019, round = 1)
names (table1_r5_jul25_sel) <- names ( table_r1_final)
identical(names(table1_r5_jul25_sel), names(table_r1_final))

table_r3<- read.table("data_output/final_table_r3_jul25", header = TRUE, sep = ",")
table_r3_final<- table_r3 %>%
  select(-X) %>%
  mutate (day = 206)
names (table1_r5_jul25_sel) <- names ( table_r3_final)
identical(names(table1_r5_jul25_sel), names(table_r3_final))

names(table_r1_final) <- names (table_r2_final)
identical(names(table_r1_final), names(table_r2_final))

names(table_r1_final) <- names (table_r3_final)
identical(names(table_r1_final), names(table_r3_final))

names(table_r1_final) <- names (table1_r4_jul25_sel)
identical(names(table_r1_final), names(table1_r4_jul25_sel))

names(table_r1_final) <- names (table2_r4_jul25_sel)
identical(names(table_r1_final), names(table2_r4_jul25_sel))

names(table_r1_final) <- names (table3_r4_jul25_sel)
identical(names(table_r1_final), names(table3_r4_jul25_sel))

names(table_r1_final) <- names (table1_r5_jul25_sel)
identical(names(table_r1_final), names(table1_r5_jul25_sel))

names(table_r1_final) <- names (table2_r5_jul25_sel)
identical(names(table_r1_final), names(table2_r5_jul25_sel))

names(table_r1_final) <- names (table3_r5_jul25_sel)
identical(names(table_r1_final), names(table3_r5_jul25_sel))


table_r2_final<- table_r2_final %>%
  select(date, hhmmss, BH_Leaf, BH_Block, BH_Vine,E, A, Ci, gsw, Fv.Fm, day, year, round)

table_r3_final<- table_r3_final %>%
  select(date, hhmmss, BH_Leaf, BH_Block, BH_Vine,E, A, Ci, gsw, Fv.Fm, day, year, round)

table_r1_final<- table_r1_final %>%
  select(date, hhmmss, BH445_LEAF, BH445_BLOCK, BH445_VINE, E, A, Ci, gsw, `Fv/Fm`, day, year, round)

names(table_r1_final) <- names (table_r2_final)
identical(names(table_r1_final), names(table_r2_final))

names(table_r1_final) <- names (table_r3_final)
identical(names(table_r1_final), names(table_r3_final))

names(table_r3_final) <- names (table1_r4_jul25_sel)
identical(names(table_r3_final), names(table1_r4_jul25_sel))

names(table1_r4_jul25_sel) <- names (table2_r4_jul25_sel)
identical(names(table1_r4_jul25_sel), names(table2_r4_jul25_sel))

names(table1_r4_jul25_sel) <- names (table3_r4_jul25_sel)
identical(names(table1_r4_jul25_sel), names(table3_r4_jul25_sel))

names(table1_r4_jul25_sel) <- names (table1_r5_jul25_sel)
identical(names(table1_r4_jul25_sel), names(table1_r5_jul25_sel))

names(table1_r4_jul25_sel) <- names (table1_r5_jul25_sel)
identical(names(table1_r4_jul25_sel), names(table1_r5_jul25_sel))

names(table1_r4_jul25_sel) <- names (table2_r5_jul25_sel)
identical(names(table1_r4_jul25_sel), names(table2_r5_jul25_sel))

names(table1_r4_jul25_sel) <- names (table3_r5_jul25_sel)
identical

table_r1_final<-table_r1 %>%
  select(date, hhmmss, BH445_LEAF, BH445_BLOCK, BH445_VINE, E, A, Ci, gsw, `Fv/Fm`) %>%
  mutate(day =206, year = 2019, round = 1)
names(table_r1_final) <- names (table_r2_final)
identical(names(table_r1_final), names(table_r2_final))

names(table_r2_final) <- names (table_r3_final)
identical(names(table_r2_final), names(table_r3_final))

table_complete_jul25_1 <- rbind(table_r1_final, table_r2_final, table_r3_final)


names(table1_r5_jul25_sel) <- names (table2_r5_jul25_sel)
identical(names(table1_r5_jul25_sel), names(table2_r5_jul25_sel))

names(table2_r5_jul25_sel) <- names (table3_r5_jul25_sel)
identical(names(table2_r5_jul25_sel), names(table3_r5_jul25_sel))

table_complete_jul25_2 <-rbind(table1_r5_jul25_sel, table2_r5_jul25_sel, table3_r5_jul25_sel)

table4_r4_jul25_sel_okay  <- table4_r4_jul25_sel %>%
  select(-day, -year, -round)  %>%
  mutate (day =206, year = 2019, round =4)


names(table1_r4_jul25_sel) <- names (table2_r4_jul25_sel)
identical(names(table1_r4_jul25_sel), names(table2_r4_jul25_sel))

names(table2_r4_jul25_sel) <- names (table3_r4_jul25_sel)
identical(names(table2_r4_jul25_sel), names(table3_r4_jul25_sel))

names(table3_r4_jul25_sel) <- names (table4_r4_jul25_sel_okay)
identical(names(table3_r4_jul25_sel), names(table4_r4_jul25_sel_okay))

table_complete_jul25_3<- rbind(table1_r4_jul25_sel, table2_r4_jul25_sel, table3_r4_jul25_sel, table4_r4_jul25_sel_okay)

names(table_complete_jul25_1) <- names (table_complete_jul25_2)
identical(names(table_complete_jul25_1), names(table_complete_jul25_2))

names(table_complete_jul25_2) <- names (table_complete_jul25_3)
identical(names(table_complete_jul25_2), names(table_complete_jul25_3))

table_complete_jul25_diurnals <- rbind(table_complete_jul25_1, table_complete_jul25_3, table_complete_jul25_2)

write_csv(table_complete_jul25_diurnals,"data_output/table_complete_jul25_diurnals")
library (dplyr)

table_complete_jul25_diurnals <- table_complete_jul25_diurnals %>%
  mutate(date = "07-25-2019")
write_csv(table_complete_jul25_diurnals,"data_output/table_complete_jul25_diurnals")
