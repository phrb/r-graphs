#!/usr/bin/Rscript

library(ggplot2)
library(reshape2)

log_all_24 <- read.table("24_short/logall.txt",header=TRUE)
log_bst_24 <- read.table("24_short/logbest.txt",header=TRUE)

log_all_12 <- read.table("12_all/logall.txt",header=TRUE)
log_bst_12 <- read.table("12_all/logbest.txt",header=TRUE)

old_benchmark <- read.table("benchmarks/old_benchmark.txt",header=TRUE)
old_short_benchmark <- read.table("benchmarks/old_short_benchmark.txt",header=TRUE)

tuned_comparison24 <- read.table("24_short/comparison.txt",header=TRUE)

graph_all_24 <- qplot(log_all_24$tuning_time,log_all_24$run_time,data=log_all_24,
                   ylab="Execution Time (seconds)",
                   xlab="Tuning Time (seconds)", 
                   main="Tuning Time vs. Execution Time over 24h")

graph_bst_24 <- qplot(log_bst_24$tuning_time,log_bst_24$run_time,
                   geom=c("point","line"),
                   ylab="Execution Time (seconds)",
                   xlab="Tuning Time (seconds)",      
                   main="Tuning Time vs. Best Execution Time over 24h")

graph_all_12 <- qplot(log_all_12$tuning_time,log_all_12$run_time,data=log_all_12,
                   ylab="Execution Time (seconds)",
                   xlab="Tuning Time (seconds)", 
                   main="Tuning Time vs. Execution Time over 12h")

graph_bst_12 <- qplot(log_bst_12$tuning_time,log_bst_12$run_time,
                   geom=c("point","line"),
                   ylab="Execution Time (seconds)",
                   xlab="Tuning Time (seconds)",      
                   main="Tuning Time vs. Best Execution Time over 12h")
graph_old_bench <- ggplot(data=melt(old_benchmark), aes(x=variable,y=value)) +
    geom_boxplot(aes(fill=variable)) +
    xlab("Solvers") +
    ylab("Execution Time (seconds)") +
    ggtitle("Execution Times Over 80 runs vs Solvers")

graph_old_short <- ggplot(data=melt(old_short_benchmark), aes(x=variable,y=value)) +
    geom_boxplot(aes(fill=variable)) +
    xlab("Solvers") +
    ylab("Execution Time (seconds)") +
    ggtitle("Execution Times Over 80 runs vs Solvers")

graph_tuned_comparison24 <- ggplot(data=melt(tuned_comparison24), aes(x=variable,y=value)) +
    geom_boxplot(aes(fill=variable)) +
    xlab("Solvers") +
    ylab("Execution Time (seconds)") +
    ggtitle("Execution Times Over 80 runs vs Solvers")

print(graph_all_24)
readline("plot done\n")
print(graph_bst_24)
readline("plot done\n")
print(graph_all_12)
readline("plot done\n")
print(graph_bst_12)
readline("plot done\n")
print(graph_old_bench)
readline("plot done\n")
print(graph_old_short)
readline("plot done\n")
print(graph_tuned_comparison24)
readline("plot done\n")
