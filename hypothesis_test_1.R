
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

setwd("C:/rutgers/fall14")

library(xlsx)
library(sqldf)
#require(R2wd)


inference_hypothesistest <- function (data, known_variance_ind=F, tail="less", conf=.95){
  nh <- sqldf("select * from data where Addr_ind = 1")
  nnh <- sqldf("select * from data where Addr_ind = 0")
  
  nnh.Visits <- nnh$Total_Visits
  nh.Visits <- nh$Total_Visits
  print(t.test(nh.Visits, nnh.Visits, alternative=tail))
  
#   print(t.test(nnh.Visits, nh.Visits, alternative=tail))
#   
#   print(c("nh sd " , sd(nh.Visits), "nh n ", length(nh.Visits)))
#   print(c("nnh sd ", sd(nnh.Visits), "nnh n ", length(nnh.Visits)))
}
#-------------------------------------------------------------------
x<-read.xlsx('Clean_Data.xlsx', 1)
#plot(x$Total_Visits ~ x$Addr)

inference_hypothesistest(x)
