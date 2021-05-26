#!/usr/bin/env Rscript

library(ggplot2)
library(happyR)
library(magrittr)


args <- commandArgs(trailingOnly = TRUE)
prefix <- c("results/ont/happy/longshot/longshot", "results/illumina/happy/longshot/longshot", "results/pacbio/happy/longshot/longshot")
output <- args[1]

hapdata_ont <- happyR::read_happy(prefix[1])
hapdata_illumina <- happyR::read_happy(prefix[2])
hapdata_pacbio <- happyR::read_happy(prefix[3])

all_pr_ont <- pr_data(hapdata_ont)
all_pr_illumina <- pr_data(hapdata_illumina)
all_pr_pacbio <- pr_data(hapdata_pacbio)

all_pr_ont = all_pr_ont[all_pr_ont$Type == 'SNP',]
all_pr_illumina = all_pr_illumina[all_pr_illumina$Type == 'SNP',]
all_pr_pacbio = all_pr_pacbio[all_pr_pacbio$Type == 'SNP',]

ont_summary = hapdata_ont$summary[hapdata_ont$summary$Type == 'SNP' & hapdata_ont$summary$Filter == 'ALL',c('METRIC.Recall', 'METRIC.Precision')]
illumina_summary = hapdata_illumina$summary[hapdata_illumina$summary$Type == 'SNP' & hapdata_illumina$summary$Filter == 'ALL',c('METRIC.Recall', 'METRIC.Precision')]
pacbio_summary = hapdata_pacbio$summary[hapdata_pacbio$summary$Type == 'SNP' & hapdata_pacbio$summary$Filter == 'ALL',c('METRIC.Recall', 'METRIC.Precision')]

ggplot() +
  geom_line(data = all_pr_ont, aes(x = METRIC.Recall, y = METRIC.Precision), color = "red") +
  geom_line(data = all_pr_pacbio, aes(x = METRIC.Recall, y = METRIC.Precision), color = "purple") +
  theme_minimal() +
  geom_point(data = ont_summary, aes(x = METRIC.Recall, y = METRIC.Precision), color="red") +
  geom_point(data = illumina_summary, aes(x = METRIC.Recall, y = METRIC.Precision), color="blue") +
  geom_point(data = pacbio_summary, aes(x = METRIC.Recall, y = METRIC.Precision), color="purple") +
  scale_x_continuous(limits = c(0, 1)) +
  scale_y_continuous(limits = c(0.5, 0.75)) +
  theme(text = element_text(size=20)) + 
  xlab("Recall") +
  ylab("Precision")

ggsave(output)
