setwd("D:/METOPEL UAS/BALQIS METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("kakao.xlsx")
dat <- read_excel("kakao.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

# regresi
reg1<-lm(ekspor~ekston+hargat+prodt+lahan+kurs,data=dat)
summary(reg1)

# Plot 
plot(dat$tahun,dat$ekspor,xlab="Tahun",ylab="Nilai FOB Ekspor Biji Kakao ")
plot(dat$tahun,dat$ekston,xlab="Tahun",ylab="Volume Ekspor (ton)")
plot(dat$tahun,dat$hargat,xlab="Tahun",ylab="Harga jual per Ton")
plot(dat$tahun,dat$kurs,xlab="Tahun",ylab="Nilai Tukar RP/USD")
plot(dat$tahun,dat$prodt,xlab="Tahun",ylab="Produksi Kopi  (ton)")
plot(dat$tahun,dat$lahan,xlab="Tahun",ylab="Luas Lahan Perkebunan (hektar)")

# Plot Error

dat$m<-resid(reg1)
plot(dat$ekspor,dat$m,xlab="Nilai Ekspor Kopi",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$ekston,dat$m,xlab="Volume Ekspor (ton)",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$hargat,dat$m,xlab="Harga jual per Ton",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$kurs,dat$m,xlab="Nilai Tukar RP/USD",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$prodt,dat$m,xlab="Produksi Kakao Indonesia (ton)",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$lahan,dat$m,xlab="Luas Lahan Perkebunan (Ha)",ylab="error")
abline(h=0) # membuat garis horizontal di y=0
