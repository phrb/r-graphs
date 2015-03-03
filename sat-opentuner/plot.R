#!/usr/bin/Rscript

library(ggplot2)
library(reshape2)

log_all <- read.table("logall.txt",header=TRUE)
log_bst <- read.table("bestlog.txt",header=TRUE)
solver_data <- read.table("solver_data.txt",header=TRUE)
solver_short_data <- read.table("solver_short_data.txt",header=TRUE)
tuned_data <- read.table("solver_tuned.txt",header=TRUE)

graph_all <- qplot(log_all$tuning_time,log_all$run_time,data=log_all,
                   xlab="Execution Time (seconds)",
                   ylab="Tuning Time (seconds)", 
                   main="Tuning Time vs. Execution Time over 24h")

graph_bst <- qplot(log_bst$tuning_time,log_bst$run_time,
                   geom=c("point","line"),
                   xlab="Execution Time (seconds)",
                   ylab="Tuning Time (seconds)",      
                   main="Tuning Time vs. Best Execution Time over 24h")

graph_solver <- ggplot(data=melt(solver_data), aes(x=variable,y=value)) +
    geom_boxplot(aes(fill=variable)) +
    xlab("Solvers") +
    ylab("Execution Time (seconds)") +
    ggtitle("Execution Times Over 80 runs vs Solvers")

graph_short_solver <- ggplot(data=melt(solver_short_data), aes(x=variable,y=value)) +
    geom_boxplot(aes(fill=variable)) +
    xlab("Solvers") +
    ylab("Execution Time (seconds)") +
    ggtitle("Execution Times Over 80 runs vs Solvers")

graph_tuned_solver <- ggplot(data=melt(tuned_data), aes(x=variable,y=value)) +
    geom_boxplot(aes(fill=variable)) +
    xlab("Solvers") +
    ylab("Execution Time (seconds)") +
    ggtitle("Execution Times Over 80 runs vs Solvers")

print(graph_all)
readline("plot done\n")
print(graph_bst)
readline("plot done\n")
print(graph_solver)
readline("plot done\n")
print(graph_short_solver)
readline("plot done\n")
print(graph_tuned_solver)
readline("plot done\n")
