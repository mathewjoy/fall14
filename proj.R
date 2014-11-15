setwd('~/rutgers/fall14/ba')
library(xlsx)
dat<-read.xlsx('df.xlsx',1, header=T)
str(dat)
head(dat)
summary(dat)

plot(cbind(dat['Age'], dat['Total']))
plot(cbind(dat['Age'], dat['Length.of.Stay..d.']))

#clusters of concetration, and outliers as age increases, more lenght of stay goes up as well
plot(cbind(dat['Age'], dat['Length.of.Stay..d.'])) 


#cov(dat['Age'], dat['Total'])
#cov(dat['Age'], dat['Length.of.Stay..d.'])
#cov(dat['Total'], dat['Length.of.Stay..d.'])

cov(cbind(dat['Age'], dat['Total'], dat['Length.of.Stay..d.']))

# Output
#                           Age    Total Length.of.Stay..d.
# Age                116.515288 9.699704          30.263614
# Total                9.699704 3.859307           4.714058
# Length.of.Stay..d.  30.263614 4.714058          44.316245

# cor(dat['Age'], dat['Total'])
# cor(dat['Age'], dat['Length.of.Stay..d.'])
# cor(dat['Total'], dat['Length.of.Stay..d.'])
cor(cbind(dat['Age'], dat['Total'], dat['Length.of.Stay..d.']))

# Output
#                          Age     Total Length.of.Stay..d.
# Age                1.0000000 0.4574170          0.4211607
# Total              0.4574170 1.0000000          0.3604614
# Length.of.Stay..d. 0.4211607 0.3604614          1.0000000




