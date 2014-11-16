
#install.packages("R2wd")


#Field  1: Patient
#Field  2: Addr Ind (0 - Home, 1 - Nursing Home)
#Field  3: Gender Ind (0 - Femail, 1 - Male)
#Field  4: Avg Length of Stay (in Days)
#Field  5: Total Visits ( Total visits to hospital in a year)
#Field  6: Total Days of Stay (for the whole year. Average Length of Stay * Total Visits)
#Field  7: Precon Ind (0 - None, 1 - DM-HTN)
#Field  8: Discharge diagonosis
#Field  9: Addr
#Field 10: Gender
#Field 11: Disease
#Field 12: Age Class

getTitleString <- function (...){
  args_list <- list(...)
  ret_str <- args_list[1]

  for( i in 2:length(args_list)){
      ret_str <- paste(ret_str, "\n", args_list[i])
  }
  return (ret_str)
}

setwd("C:/rutgers/fall14")

library(xlsx)
library(sqldf)
#require(R2wd)

############################  ALL PATIENTS ######################################
x<-read.xlsx('Clean_Data.xlsx', 1)
print(summary(x))
print(
  cor(cbind(x['Age'],x['Total_Days_of_Stay'],x['Total_Visits']))
)
# print(
#   table(x[['age_class']], x[['Total_Visits']])
# )
# print(
#   table(x[['age_class']], x[['Disease']])
# )



title_str<- getTitleString("Boxplot on complete data set:",
     "Age, Avg Length of Stay, Visits, and Total Days", 
     "for both NH and Home patients")

jpeg("boxplot1_AllData.jpg")

bpout<- boxplot(c(x['Age'], x['Avg_Length_of_Stay'], x['Total_Visits'], x['Total_Days_of_Stay']), 
        names=c('Age','Avg Length of Stay','Visits','Total Days in Hospital'), 
        col=c('red', 'blue', 'yellow')
        )

title(title_str)
dev.off()
#print(bpout)

title_str<- getTitleString("Scatterplot on complete data set:",
                           "Age vs Total Days in a Year", 
                           "for both NH and Home patients")

jpeg("Scatter1_AllData_Age_TotalDays.jpg")
plot(cbind(x['Age'], x['Total_Days_of_Stay']), xlab="Age",ylab="Length of Stay in Days", col="blue", pch=1)
title(title_str)
dev.off()

#----------------------------------------------------------------------

title_str<- getTitleString("Scatterplot on complete data set:",
                           "Age vs Total Visits in a Year", 
                           "for both NH and Home patients")

jpeg("Scatter2_AllData_Age_TotalVisits.jpg")
plot(cbind(x['Age'], x['Total_Visits']), xlab="Age",ylab="Visits to Hospitals", col="blue", pch=1)
title(title_str)
dev.off()


############################  ALL NURSING HOME PATIENTS ######################################

#----------------------------------------------------------------------
nh <- sqldf("select * from x where Addr_ind = 1")
print(summary(nh))
print(
  cor(cbind(nh['Age'],nh['Total_Days_of_Stay'],nh['Total_Visits']))
)

title_str<- getTitleString("Boxplot on Nursing Home Patients:",
                           "Age, Avg Length of Stay, Visits, and Total Days")

jpeg("boxplot1_AllNH.jpg")

bpout<- boxplot(c(nh['Age'], nh['Avg_Length_of_Stay'], nh['Total_Visits'], nh['Total_Days_of_Stay']), 
                names=c('Age','Avg Length of Stay','Visits','Total Days in Hospital'), 
                col=c('red', 'blue', 'yellow')
)

title(title_str)
dev.off()
#print(bpout)

#----------------------------------------------------------------------

title_str<- getTitleString("Scatterplot on Nursing Home Patients:",
                           "Age vs Total Days in a Year")

jpeg("Scatter1_AllNH_Age_TotalDays.jpg")
plot(cbind(nh['Age'], nh['Total_Days_of_Stay']), xlab="Age",ylab="Length of Stay in Days", col="blue", pch=1)
title(title_str)
dev.off()

#----------------------------------------------------------------------

title_str<- getTitleString("Scatterplot on Nursing Home Patients:",
                           "Age vs Total Visits in a Year")

jpeg("Scatter2_AllNH_Age_TotalVisits.jpg")
plot(cbind(nh['Age'], nh['Total_Visits']), xlab="Age",ylab="Visits to Hospitals", col="blue", pch=1)
title(title_str)
dev.off()


############################  ALL NON-NH PATIENTS ######################################

#------------------------------------------------------------------------
nnh <- sqldf("select * from x where Addr_ind = 0")
print(summary(nnh))
print(
  cor(cbind(nnh['Age'],nnh['Total_Days_of_Stay'],nnh['Total_Visits']))
)

title_str<- getTitleString("Boxplot on Home-staying Patients:",
                           "Age, Avg Length of Stay, Visits, and Total Days")

jpeg("boxplot1_AllNonNH.jpg")

bpout<- boxplot(c(nnh['Age'], nnh['Avg_Length_of_Stay'], nnh['Total_Visits'], nnh['Total_Days_of_Stay']), 
                names=c('Age','Avg Length of Stay','Visits','Total Days in Hospital'), 
                col=c('red', 'blue', 'yellow')
)

title(title_str)
dev.off()
#print(bpout)
#----------------------------------------------------------------------

title_str<- getTitleString("Scatterplot on Home-staying Patients:",
                           "Age vs Total Days in a Year")

jpeg("Scatter1_AllNonNH_Age_TotalDays.jpg")
plot(cbind(nnh['Age'], nnh['Total_Days_of_Stay']), xlab="Age",ylab="Length of Stay in Days", col="blue", pch=1)
title(title_str)
dev.off()

#----------------------------------------------------------------------

title_str<- getTitleString("Scatterplot on Home-staying Patients:",
                           "Age vs Total Visits in a Year")

jpeg("Scatter2_AllNonNH_Age_TotalVisits.jpg")
plot(cbind(nnh['Age'], nnh['Total_Visits']), xlab="Age",ylab="Visits to Hospitals", col="blue", pch=1)
title(title_str)
dev.off()


