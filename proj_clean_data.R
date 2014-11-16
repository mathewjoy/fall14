# ##plot(cbind(cd['Age'], cd['Length.of.Stay..d.']), xlab="Age",ylab="Length of Stay in Days", col="blue", pch=1)
# ##plot(cbind(cd['Age'], cd['Total']), xlab="Age",ylab="Total Hospital Visits", col="orange", pch=1)
# 
# setwd("C:/rutgers/fall14")
# library(xlsx)
# library(sqldf)
# x<-read.xlsx('Modified_DataFile.xlsx', 1)
# #clean up / normalize data and create a clean spreadsheet
# boxplot(c(cd['Age'], cd['Length.of.Stay..d.'], cd['Total'], cd['Length.of.Stay..d.']*cd['Total']), names=c('Age','Avg Length of Stay','Total Hospital Visits','Total Days in Hospital'), col=c('red', 'blue', 'yellow'))

#Field  1: Patient
#Field  2: Age
#Field  3: Addr Ind (0 - Home, 1 - Nursing Home)
#Field  4: Gender Ind (0 - Femail, 1 - Male)
#Field  5: Avg Length of Stay (in Days)
#Field  6: Total Visits ( Total visits to hospital in a year)
#Field  7: Total Days of Stay (for the whole year. Average Length of Stay * Total Visits)
#Field  8: Precon Ind (0 - None, 1 - DM-HTN)
#Field  9: Discharge diagonosis
#Field 10: Addr
#Field 11: Gender
#Field 12: Disease

setwd("C:/rutgers/fall14")

library(xlsx)
library(sqldf)
x<-read.xlsx('Modified_DataFile.xlsx', 1)

#clean up / normalize data and create a clean spreadsheet
cd<-sqldf("select Patient, 
          Age,
          case Addr when 'NH' then 1 when 'home' then 0 else -1 end Addr_Ind, 
          case Gender when 'm' then 1 when 'f' then 0 end Gender_Ind, 
          [Length.of.Stay..d.] Avg_Length_of_Stay, 
          Total Total_Visits,
          [Length.of.Stay..d.]*Total Total_Days_of_Stay,
          case Disease when 'DM-HTN' then 1 when 'None' then 0 end Precon_Ind, 
          [discharge.diagnosis],
          Addr, 
          Gender, 
          Disease  from x")

#create ranges for Age.
Age_Class<- cut(cd$Age, c(60,70,80,90,100, 110), label=c("60-70","70-80", "80-90", "90-100", "100-110"))
cd1<- cbind(cd, Age_Class)

#write to spreadsheet
write.xlsx(cd1,'Clean_Data.xlsx', col.names=T, row.names=F, append=F, sheetName="Data")

