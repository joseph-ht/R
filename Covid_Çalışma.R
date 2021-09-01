getwd()
setwd("C:/Users/asus/Documents/R")
iller <- read.csv("Kitap1.csv")
iller
is.data.frame(iller)
summary(iller)
iller$satýr <- 1:81
head(iller)
tail(iller)

vaka <- read.csv("Kitap2.csv")
vaka
is.data.frame(vaka)
summary(vaka)
vaka$satýr <- 1:81
tail(vaka)

covid_data <- merge(iller, vaka, by.x="satýr", by.y="satýr")
rm(covid_data)
covid_data$satýr <- NULL
summary(covid_data)

risk <- 1:81
is.vector(risk)
for (i in 1:81) {
  if (covid_data[i,2]>100) {risk[i] <- "Çok Yüksek"}
  else if (covid_data[i,2]>35 & covid_data[i,2]<100) {risk[i] <-"Yüksek"}
  else if (covid_data[i,2]>10 & covid_data[i,2]<35) {risk[i] <- "Orta"}
  else {risk[i] <- "Düþük"}
} 

rm(risk)
risk

covid_data$risk.grubu <- risk
covid_data
summary(covid_data)
covid_data$risk.grubu <- factor(covid_data$risk.grubu)
summary(covid_data)

colnames(covid_data) <- c("il","vaka","risk")
head(covid_data)
t <- ggplot(data=covid_data, aes(x=risk))
            
t +  geom_point()

write.csv(covid_data, "C:/Users/asus/Documents/R/covid_data.csv", row.names=FALSE)
       