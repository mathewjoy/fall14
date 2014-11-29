
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

##Chronic medical does not increase hospitalization
##We create two groups - one that has chronic illness and one that does not.
##In this case, we donot distinquish NH patients from home staying patients.

inference_hypothesistest <- function (data, known_variance_ind=F, tail="lower", conf=.95){
  if (tail=="lower"){alt <- "less"}
  else if (tail == "upper"){alt <- "greater"}
  else {alt <- "two.sided"}
  
  chr <- sqldf("select * from data where Precon_Ind = 1")
  nonchr <- sqldf("select * from data where Precon_Ind = 0")
    
  chr.Visits <- chr$Total_Visits
  nonchr.Visits <- nonchr$Total_Visits
  print(t.test(chr.Visits, nonchr.Visits, alternative=alt))
  
  #   print(t.test(nnh.Visits, nh.Visits, alternative=tail))
  #   
  #   print(c("nh sd " , sd(nh.Visits), "nh n ", length(nh.Visits)))
  #   print(c("nnh sd ", sd(nnh.Visits), "nnh n ", length(nnh.Visits)))
}
#-------------------------------------------------------------------
x<-read.xlsx('Clean_Data.xlsx', 1)
#plot(x$Total_Visits ~ x$Disease)
inference_hypothesistest(x, tail="upper")
