library(tidyverse)
library(skimr)
library(stats)
library(rio)

#getwd()
cakes = import("testy.xlsx")
# cakes = import(file.choose()) #manual !!!!!

View(cakes)
cakes
model1 = lm(data=cakes, forec ~ result)
summary(model1)

model2 = lm(data=cakes, forec ~ (result + another))
summary(model2)

glimpse(diamonds) # êğàòêàÿ èíôîğìàöèÿ î äàííûõ

d4 = filter(diamonds, price > 1000, x > y)
glimpse(d4)
d5 = filter(diamonds, cut == "Ideal" | color == "E")
glimpse(d5)
d6 = filter(diamonds, cut > "Good" | color == "E") # ordinals are ordered
glimpse(d6)
d7=mutate(diamonds, price_sq = price^2, log_price = log(price))
glimpse(d7)

0.4 %>% sin # push op
sin(0.4) # no push

arrange(diamonds, cut, -price) %>% head(10)


