#!/usr/bin/Rscript

library(ggplot2)
library(reshape2)

#
# Loading Files:
#
#brute_force <- read.table("brute-force/benchmark_0.txt", header=TRUE)
#

all <- read.table("sat_lib_harder_benchmark/all.txt", header=TRUE)
brute_benchmark <- read.table("brute-force/brute_force_comparison.txt", header=TRUE)

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

all_graph <- ggplot(data=melt(all), aes(x=variable,y=value,colour=variable,fill=variable)) +
    stat_summary(fun.y=mean, geom="point") +
    stat_summary(fun.data=mean_cl_normal, position=position_dodge(width=0.95), geom="errorbar", aes(width=0.2)) +
#    theme(axis.text.x=element_blank()) +
    guides(colour=guide_legend(title="Solvers")) +
    guides(fill=guide_legend(title="Solvers")) +
    xlab("Individual Solvers") +
    ylab("Execution Time (seconds)") +
    ggtitle("Benchmark of Individual Solvers, 100 instances and 30 runs") +
    coord_flip()

brute_benchmark_graph <- ggplot(data=melt(brute_benchmark), aes(x=variable,y=value,colour=variable,fill=variable)) +
    stat_summary(fun.y=mean, geom="point") +
    stat_summary(fun.data=mean_cl_normal, position=position_dodge(width=0.95), geom="errorbar", aes(width=0.2)) +
#    theme(axis.text.x=element_blank()) +
    guides(colour=guide_legend(title="Solvers")) +
    guides(fill=guide_legend(title="Solvers")) +
    xlab("Individual Solvers") +
    ylab("Execution Time (seconds)") +
    ggtitle("Benchmark of Individual Solvers, 100 instances and 30 runs") +
    coord_flip()

# Uncomment for visualization in R interpreter.
#
#print(brute_graph)
#readline("plot done\n")
#
print(all_graph)
readline("plot done\n")
print(brute_benchmark_graph)
readline("plot done\n")
#
#
