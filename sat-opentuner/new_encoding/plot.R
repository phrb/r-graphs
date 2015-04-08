#!/usr/bin/Rscript

library(ggplot2)
library(reshape2)

#
# Loading Files:
#
#brute_force <- read.table("brute-force/benchmark_0.txt", header=TRUE)
#

all <- read.table("benchmark_all.txt", header=TRUE)

#
# Generate all files.
#
#graph_all_24 <- qplot(log_all_24$tuning_time,log_all_24$run_time,data=log_all_24,
#                   ylab="Execution Time (seconds)",
#                   xlab="Tuning Time (seconds)",
#                   main="Tuning Time (Only Best Solvers) vs. Execution Time over 24h (Measured by OpenTuner)")
#
#ggsave(file="log_all_24.png",width=7,height=4,scale=2)


#Add a diamond at the mean, and make it larger
#brute_graph <- ggplot(brute_force, aes(x="Execution Time (seconds)",y=BruteForceSearch)) +
#    geom_boxplot() +
#    stat_summary(fun.y=mean, geom="point", shape=4, size=4)

all_graph <- ggplot(data=melt(all), aes(x=variable,y=value)) +
    geom_boxplot(aes(fill=variable)) +
    guides(fill=FALSE) +
    stat_summary(fun.y=mean, geom="point", shape=4, size=4) +
    xlab("Solutions") +
    ylab("Execution Time (seconds)") +
    ggtitle("Execution Times Over 20 runs of Different Solutions")

# Uncomment for visualization in R interpreter.
#
#print(brute_graph)
#readline("plot done\n")
#
print(all_graph)
readline("plot done\n")
#
#
