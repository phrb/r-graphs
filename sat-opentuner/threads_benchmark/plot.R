#!/usr/bin/Rscript

library(ggplot2)
library(reshape2)

temp <- list.files(pattern='benchmark_*')
threads_benchmark <- lapply(temp,read.table,header=TRUE)


#
# Uncomment to generate all files.
#
#graph_all_24 <- qplot(log_all_24$tuning_time,log_all_24$run_time,data=log_all_24,
#                   ylab="Execution Time (seconds)",
#                   xlab="Tuning Time (seconds)", 
#                   main="Tuning Time (Only Best Solvers) vs. Execution Time over 24h (Measured by OpenTuner)")
#
#ggsave(file="log_all_24.png",width=7,height=4,scale=2)

#
# Uncomment for visualization in R interpreter.
#
#print(graph_all_24)
#readline("plot done\n")
#
