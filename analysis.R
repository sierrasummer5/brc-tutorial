# Set the current working directory
setwd('~/Box Sync/brc-tutorial/') ## this is from Adina's Box folder
setwd("~/Downloads/brc-tutorial-main") ## This is its location on Sierra's local computer. 

# Load ggplot library
# If not installed, run
# install.packages('ggplot2')
library(ggplot2)

# load your theme to make the graph with a clean aesthetic. 
mytheme <- theme_bw() + 
  theme(panel.grid.minor=element_blank(), #gets rid of grey and lines in the middle
        panel.grid.major=element_blank(), #gets rid of grey and lines in the middle
        panel.background=element_rect(fill="white"),#gets rid of grey and lines in the middle
        panel.border=element_blank(), #gets rid of square going around the entire graph
        axis.line.x = element_line(colour = 'black', size = 0.5),#sets the axis line size
        axis.line.y = element_line(colour = 'black', size = 0.5),#sets the axis line size
        axis.ticks=element_line(colour = 'black', size = 0.5), #sets the tick lines
        axis.title.x = element_text(family="Arial", size=12, color="black", face="bold"), #size of x-axis title
        axis.title.y = element_text(family="Arial", size=12, color="black", face="bold"), #size of y-axis title
        axis.text.x = element_text(family="Arial", size=12, color="black"), #size of x-axis text
        axis.text.y = element_text(family="Arial", size=12, color="black"),
        plot.title = element_text(color="blue", size = 16, face = "bold"),
        plot.subtitle = element_text(size = 12))

# Read in data 
data_in <- read.csv("billionton_state_download.2015.csv", header=TRUE)
baseline_data <- subset(data_in, Scenario == "Baseline" & USDA.Region == "Corn Belt" & Feedstock %in% c("Corn", "Soybeans", "Oats", "Sorghum"))
baseline_data_cleaned <- subset(baseline_data, Yield != "null")
baseline_data_cleaned$Yield <- as.numeric(baseline_data_cleaned$Yield)
ggplot(baseline_data_cleaned, aes(x=State, y=Yield, fill=Feedstock)) + 
  geom_bar(stat="identity", position=position_dodge()) +
  mytheme + xlab("States in the Corn Belt")



