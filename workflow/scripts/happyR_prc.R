#!/usr/bin/env Rscript

library(tidyverse, quietly = TRUE)
library(happyR)

args <- commandArgs(trailingOnly = TRUE)
prefix <- c("ont" = "results/ont/happy/longshot/longshot", "illumina"="results/illumina/happy/longshot/longshot","pacbio"="results/pacbio/happy/longshot/longshot")
output <- args[1]

hapdata_pr = map_df(1:3, function(i){
    happyR::read_happy(prefix[i], lazy = FALSE) %>% 
    pr_data(var_type = "snv", filter = c("ALL")) %>% 
    mutate(tech = names(prefix)[i])
})

hapdata_pr_pass = map_df(1:3, function(i){
    happyR::read_happy(prefix[i], lazy = FALSE) %>% 
    pr_data(var_type = "snv", filter = c("PASS")) %>% 
    mutate(tech = names(prefix)[i]) %>%
    filter(QQ > 0)
})

hapdata_summary = map_df(1:3, function(i){
    happyR::read_happy(prefix[i], lazy = FALSE)$summary %>%
    filter(Type == "SNP") %>%
    mutate(tech = names(prefix)[i])
})


theme_set(theme_minimal())


# Precision Curve
ggplot(hapdata_pr, aes(x = QQ, y = METRIC.Precision, color = tech)) +
    geom_line() +
    labs(x = "Quality Threshold", y = "Precision", color = "Seq Tech") 

ggsave(paste0(output,"/P.png"))


# Recall Curve
ggplot(hapdata_pr, aes(x = QQ, y = METRIC.Recall, color = tech)) +
    geom_line() +
    labs(x = "Quality Threshold", y = "Recall", color = "Seq Tech") 


ggsave(paste0(output,"/R.png"))

# Precision-Recall Curve
ggplot(hapdata_pr, aes(x = METRIC.Recall, y = METRIC.Precision)) +
    geom_line(aes(color = tech)) +
    geom_point(data = hapdata_summary, aes(shape = Filter), color = "black") +
    labs(x = "Recall", y = "Precision", color = "Seq Tech", shape = "Quality Filter") 


ggsave(paste0(output,"/PR.png"))


# F1 score
hapdata_pr %>%
    ggplot(aes(x = QQ, y = METRIC.F1_Score, color = tech)) +
    geom_line() +
    labs(x = "Quality Threshold", y = "F1 Score", color = "Seq Tech") 


ggsave(paste0(output,"/F1_QQ.png"))