
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

#NOTE:  When H0 >=0, then alternate hyp "less" than 0 (lower tail).
#NOTE:  When H0 <=0, then alternate hyp "greater" than 0 (upper tail).
#NOTE:  When H0 =0, then alternate hyp "two.sided" than 0 (two tail).

#Ho:  Home residents have a longer hospital stay compared to nursing home.

inference_hypothesistest <- function (data, known_variance_ind=F, tail="lower", conf=.95){
  if (tail=="lower"){alt <- "less"}
  else if (tail == "upper"){alt <- "greater"}
  else {alt <- "two.sided"}
  
  #this following, Addr group has factor in the order of "home" and "NH"
  #this also proves out that if Ho were to be that home residents stay longer than nh resi, 
  #we would  rejected ho
  #the R syntax uses formula - Addr has a factor level of 2 (home, NH)
  #the order of the factor is natuallry ordered the way hypothesis is formed
  print(t.test(Total_Days_of_Stay ~ Addr, data=data, alternative=alt))
}
#-------------------------------------------------------------------
x<-read.xlsx('Clean_Data.xlsx', 1)
#plot(x$Total_Days_of_Stay ~ x$Addr)
inference_hypothesistest(x)

