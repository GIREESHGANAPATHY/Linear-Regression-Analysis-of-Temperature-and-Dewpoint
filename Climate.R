library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
climate=read.csv("F:/Datasets/climate_data.csv")
print(climate)
print(summary(climate))
print(head(climate))
hist(climate$Average.dewpoint)
plot(Average.temperature ~ Average.dewpoint,data=climate)
dew_linear=lm(Average.temperature ~ Average.dewpoint,data=climate)
print(dew_linear)
print(summary(dew_linear))
par(mfrow=c(2,2))
plot(dew_linear)


dew_graph=ggplot(climate,aes(x=Average.temperature,y=Average.dewpoint))+
  geom_point()
print(dew_graph)

dew_graph=dew_graph + geom_smooth(method="lm",col="red")
print(dew_graph)

dew_graph=dew_graph + 
  stat_regline_equation(label.x=40,label.y=20)
print(dew_graph)

dew_graph=dew_graph + 
  theme_bw()+
  labs(title= "Temperature v/s Dewpoint",
       x="Average.temperature",
       y="Average.dewpoint")
print(dew_graph)