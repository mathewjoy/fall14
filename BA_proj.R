setwd("C:/Users/jmathe200/Downloads")
library(xlsx)
x<-read.xlsx('Modified_DataFile.xlsx', 1)
sqldf("select Patient, case Addr when 'NH' then 1 when 'home' then 0 else -1 end Addr_NH1_Home0, case Gender when 'm' then 1 when 'f' then 0 end Gender_M1_F0, [Length.of.Stay..d.], case Disease when 'DM-HTN' then 1 when 'None' then 0 end Disease_DM1_None0, Total, [discharge.diagnosis], Addr, Gender, Disease  from x")
cd<-sqldf("select Patient, case Addr when 'NH' then 1 when 'home' then 0 else -1 end Addr_NH1_Home0, case Gender when 'm' then 1 when 'f' then 0 end Gender_M1_F0, [Length.of.Stay..d.], case Disease when 'DM-HTN' then 1 when 'None' then 0 end Disease_DM1_None0, Total, [discharge.diagnosis], Addr, Gender, Disease  from x")
write.xlsx(cd,'Clean_Data.xlsx')


##boxplot(c(cd['Age'], cd['Length.of.Stay..d.'], cd['Total']), names=c('Age','Avg Length of Stay','Total Hospital Stay'), col=c('red', 'blue', 'yellow'))
##boxplot(c(cd['Age'], cd['Length.of.Stay..d.'], cd['Total']), names=c('Age','Avg Length of Stay','Total Hospital Stay'), col=c('red', 'blue', 'yellow'), boxwex=0.5, outwex=0.5)
##plot(cbind(cd['Age'], cd['Length.of.Stay..d.']), xlab="Age",ylab="Length of Stay in Days", col="blue", pch=1)
##plot(cbind(cd['Age'], cd['Total']), xlab="Age",ylab="Total Hospital Visits", col="orange", pch=1)

setwd("C:/Users/jmathe200/Downloads")
library(xlsx)
library(sqldf)

cd<-sqldf("select Patient, 
          case Addr when 'NH' then 1 when 'home' then 0 else -1 end Addr_NH1_Home0, 
          case Gender when 'm' then 1 when 'f' then 0 end Gender_M1_F0, 
          [Length.of.Stay..d.] Avg_Length_of_Stay, 
          Total Total_Visits,
          [Length.of.Stay..d.]*Total Total_Days,
          [discharge.diagnosis],
          case Disease when 'DM-HTN' then 1 when 'None' then 0 end Precon_DM1_None0, 
          Addr, 
          Gender, 
          Disease  from x")

write.xlsx(cd,'Clean_Data.xlsx')

boxplot(c(cd['Age'], cd['Length.of.Stay..d.'], cd['Total'], cd['Length.of.Stay..d.']*cd['Total']), names=c('Age','Avg Length of Stay','Total Hospital Visits','Total Days in Hospital'), col=c('red', 'blue', 'yellow'))
