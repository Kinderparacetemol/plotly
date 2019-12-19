library(tidyverse)
library(readxl)
library(reshape2)
library(plotly)
#Read data
data <- read_csv("Temp/19-12/Kanban.csv")
data <- data %>% mutate(Datum = as.Date(Datum, format= "%d/%m/%Y"))
#Melt data
df <- melt(data,id.vars = "Datum", measure.vars = colnames(data[,-1]))
#Create graph and plot as plotly
a <- ggplot(df) +aes(x = Datum, y = value,color = variable,fill = variable) + geom_area( size=.1,position = "stack")  + theme_minimal()+ theme(legend.position = "bottom",legend.title = element_blank())+ labs(x = NULL, y = NULL)       
ggplotly(a)
