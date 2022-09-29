
# You should complete the lines to make the code work. 
# Some tasks are interdependent 
# To comment or uncomment lines use Ctrl + Shift + C or 
# Code -> Comment/Uncomment Lines

## Task 1
# notes <- c("A","B","A+","C", "A","B")
# notes_levels <- factor(levels = c("C", "B", "A", "A+"))
# notes_levels[3] > notes_levels[1]

## Task 2
# 
# a <- seq(from = 40, to = 2, by = -2)
# A_mat <- matrix(a, nrow = 4, byrow = TRUE)
# Region <- c("Courtelary", "Delemont", "Franches-Mnt",
# "Moutier")
# Fertility  <- c(80.2, 83.1, 92.5, 85.8)
# Agriculture <- c(17.0, 45.1, 39.7, 36.5)
# Examination <- c(15, 6, 5,12)
# Education <- c(12, 9, 5, 7)
# Catholic <- c(9.96, 84.84, 93.40, 33.77)
# Infant.Mortality <- c(22.2, 22.2, 20.2, 20.3)
# swiss4 <- data.frame(Region, Fertility, Agriculture,
# Examination, Education, Catholic)
# B_arr <- array(a, c(2,2,5))

#L_list <-  (A_mat, swiss4, B_arr)

## Task 3
#L_list["Education"]

## Task 4
#L_list

## Task 5
#for ( in ){
#  print(rnorm(1))
#}


## Task 6
#z <- 0
#i <- 0 
#while  () {
#  i <- i + 1
#  
#    print()
#}

##Task 7

#if{
#  
#  
#}

## Task 8 
# trig_vector <-  {
#   y <- c(sin(t), cos(t), tan(t), 1/tan(t))
#   return(y)
# }
# z <- (3*pi/4)
# z

## Task 9 
# data

## Task 10
#tidyverse

## Task 11
# dataset 
# dataset <- (dataset)

## Task 12
## Use Import Dataset option or complement the command:
# read.csv()

## Task 13
# ggplot(data = ) +
#   geom_point(mapping = aes(x = , y = ))

## Task 14

# pop <- population[c(784:802,1681:1699),]
# ggplot(data = pop) +
#   geom_point(mapping = aes(x = year, y = population)) +
#   facet_wrap()

##Task 15
# herbi_arti_sleep <- filter(msleep, "herbi", "Artiodactyla")

## Task 16
#select(msleep, name, contains())

## Task 17
# arrange(select(msleep,name, order, bodywt))

#Task 18
# msleep_new <- select(msleep, name, starts_with())
# sleep_phases <- mutate(msleep_new, nonrem_sleep = )