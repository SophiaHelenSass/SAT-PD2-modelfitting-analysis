library(ggpubr)
library(effsize)
library(ggplot2)
library(data.table)
library(dplyr)
library(emmeans)
library(afex)
library(rstatix)
library(apa)

setwd('//vs-grp02.zih.tu-dresden.de/nic_projects/037/B3_BEHAVIORAL_STUDY/04_Experiment/Analysis_Scripts/SAT_Results')
#setwd('//172.25.133.89/nic_projects/037/B3_BEHAVIORAL_STUDY/04_Experiment/Analysis_Scripts/SAT_Results')
imageDirectory <- '//vs-grp02.zih.tu-dresden.de/nic_projects/037/B3_BEHAVIORAL_STUDY/04_Experiment/Analysis_Scripts/SAT_Results/Plots/modelfit'
#imageDirectory <- '//172.25.133.89/nic_projects/037/B3_BEHAVIORAL_STUDY/04_Experiment/Analysis_Scripts/SAT_Results/Plots/modelfit'

nll_ya_default_0cost <- read.csv('Results_inference_group_NLL_0cost_1000steps-lr0-02_20220629/NLL_ya_group_0cost.csv')
nll_oa_default_0cost <- read.csv('Results_inference_group_NLL_0cost_1000steps-lr0-02_20220629/NLL_oa_group_0cost.csv')
elbo_ya_default_0cost <- read.csv('Results_inference_group_NLL_0cost_1000steps-lr0-02_20220629/ELBO_ya_group_0cost.csv')
elbo_oa_default_0cost <- read.csv('Results_inference_group_NLL_0cost_1000steps-lr0-02_20220629/ELBO_oa_group_0cost.csv')

nll_ya_noisedisc_0cost_theta <- read.csv('Results_inference_group_discount_Noise_theta_0cost_20230111/NLL_ya_group_discount_Noise_theta_0cost.csv')
nll_oa_noisedisc_0cost_theta <- read.csv('Results_inference_group_discount_Noise_theta_0cost_20230111/NLL_oa_group_discount_Noise_theta_0cost.csv')
elbo_ya_noisedisc_0cost_theta <- read.csv('Results_inference_group_discount_Noise_theta_0cost_20230111/ELBO_ya_group_discount_Noise_theta_0cost.csv')
elbo_oa_noisedisc_0cost_theta <- read.csv('Results_inference_group_discount_Noise_theta_0cost_20230111/ELBO_oa_group_discount_Noise_theta_0cost.csv')

nll_ya_hilonoisedisc_0cost_theta <- read.csv('Results_inference_group_discount_hiLoNoise_theta_0cost_20220706/NLL_ya_group_discount_hiLoNoise_theta_0cost.csv')
nll_oa_hilonoisedisc_0cost_theta <- read.csv('Results_inference_group_discount_hiLoNoise_theta_0cost_20220706/NLL_oa_group_discount_hiLoNoise_theta_0cost.csv')
elbo_ya_hilonoisedisc_0cost_theta <- read.csv('Results_inference_group_discount_hiLoNoise_theta_0cost_20220706/ELBO_ya_group_discount_hiLoNoise_theta_0cost.csv')
elbo_oa_hilonoisedisc_0cost_theta <- read.csv('Results_inference_group_discount_hiLoNoise_theta_0cost_20220706/ELBO_oa_group_discount_hiLoNoise_theta_0cost.csv')
#nll_ya_hilonoisedisc_0cost_theta <- read.csv('Results_discount_hiLoNoise_theta_ignoreHinoise/NLL_ya_group_discount_hiLoNoise_theta_0cost_ignoreHiNoise.csv')
#nll_oa_hilonoisedisc_0cost_theta <- read.csv('Results_discount_hiLoNoise_theta_ignoreHinoise/NLL_oa_group_discount_hiLoNoise_theta_0cost_ignoreHiNoise.csv')
#elbo_ya_hilonoisedisc_0cost_theta <- read.csv('Results_discount_hiLoNoise_theta_ignoreHinoise/ELBO_ya_group_discount_hiLoNoise_theta_0cost_ignoreHiNoise.csv')
#elbo_oa_hilonoisedisc_0cost_theta <- read.csv('Results_discount_hiLoNoise_theta_ignoreHinoise/ELBO_oa_group_discount_hiLoNoise_theta_0cost_ignoreHiNoise.csv')


#nll_ya_nolearning_0cost <- read.csv('Results_inference_nonlearning_20220919/NLL_ya_group_nonlearning_0cost.csv')
#nll_oa_nolearning_0cost <- read.csv('Results_inference_nonlearning_20220919/NLL_oa_group_nonlearning_0cost.csv')
#elbo_ya_nolearning_0cost <- read.csv('Results_inference_nonlearning_20220919/ELBO_ya_group_nonlearning_0cost.csv')
#elbo_oa_nolearning_0cost <- read.csv('Results_inference_nonlearning_20220919/ELBO_oa_group_nonlearning_0cost.csv')
nll_ya_nolearning_0cost <- read.csv('Results_nonlearning_IDs/NLL_ya_group_nonlearning_IDs.csv')
nll_oa_nolearning_0cost <- read.csv('Results_nonlearning_IDs/NLL_oa_group_nonlearning_IDs.csv')
elbo_ya_nolearning_0cost <- read.csv('Results_nonlearning_IDs/ELBO_ya_group_nonlearning_IDs.csv')
elbo_oa_nolearning_0cost <- read.csv('Results_nonlearning_IDs/ELBO_oa_group_nonlearning_IDs.csv')


nll_ya_noisedisc_theta_ignoreHinoise <- read.csv('Results_discount_Noise_theta_ignoreHinoise/NLL_ya_group_discount_Noise_theta_0cost_ignoreHinoise.csv')
nll_oa_noisedisc_theta_ignoreHinoise <- read.csv('Results_discount_Noise_theta_ignoreHinoise/NLL_oa_group_discount_Noise_theta_0cost_ignoreHinoise.csv')
elbo_ya_noisedisc_theta_ignoreHinoise <- read.csv('Results_discount_Noise_theta_ignoreHinoise/ELBO_ya_group_discount_Noise_theta_0cost_ignoreHinoise.csv')
elbo_oa_noisedisc_theta_ignoreHinoise <- read.csv('Results_discount_Noise_theta_ignoreHinoise/ELBO_oa_group_discount_Noise_theta_0cost_ignoreHinoise.csv')

nll_ya_hilonoisedisc_theta_ignoreHinoise <- read.csv('Results_discount_hiLoNoise_theta_ignoreHinoise/NLL_ya_group_discount_hiLoNoise_theta_0cost_ignoreHinoise.csv')
nll_oa_hilonoisedisc_theta_ignoreHinoise <- read.csv('Results_discount_hiLoNoise_theta_ignoreHinoise/NLL_oa_group_discount_hiLoNoise_theta_0cost_ignoreHinoise.csv')
elbo_ya_hilonoisedisc_theta_ignoreHinoise <- read.csv('Results_discount_hiLoNoise_theta_ignoreHinoise/ELBO_ya_group_discount_hiLoNoise_theta_0cost_ignoreHinoise.csv')
elbo_oa_hilonoisedisc_theta_ignoreHinoise <- read.csv('Results_discount_hiLoNoise_theta_ignoreHinoise/ELBO_oa_group_discount_hiLoNoise_theta_0cost_ignoreHinoise.csv')

nll_ya_anchorpruning <- read.csv('Results_anchor_pruning/NLL_ya_group_anchor_pruning.csv')
nll_oa_anchorpruning <- read.csv('Results_anchor_pruning/NLL_oa_group_anchor_pruning.csv')
elbo_ya_anchorpruning <- read.csv('Results_anchor_pruning/ELBO_ya_group_anchor_pruning.csv')
elbo_oa_anchorpruning <- read.csv('Results_anchor_pruning/ELBO_oa_group_anchor_pruning.csv')

nll_ya_anchorpruning_discount_noise_theta <- read.csv('Results_anchor_pruning_discount_Noise_theta/NLL_ya_group_anchor_pruning_discount_Noise_theta.csv')
nll_oa_anchorpruning_discount_noise_theta <- read.csv('Results_anchor_pruning_discount_Noise_theta/NLL_oa_group_anchor_pruning_discount_Noise_theta.csv')
elbo_ya_anchorpruning_discount_noise_theta <- read.csv('Results_anchor_pruning_discount_Noise_theta/ELBO_ya_group_anchor_pruning_discount_Noise_theta.csv')
elbo_oa_anchorpruning_discount_noise_theta <- read.csv('Results_anchor_pruning_discount_Noise_theta/ELBO_oa_group_anchor_pruning_discount_Noise_theta.csv')

nll_ya_discount_noise_theta_learnprobs <- read.csv('Results_discount_Noise_theta_learnprobs/NLL_ya_group_discount_Noise_theta_learnprobs.csv')
nll_oa_discount_noise_theta_learnprobs <- read.csv('Results_discount_Noise_theta_learnprobs/NLL_oa_group_discount_Noise_theta_learnprobs.csv')
elbo_ya_discount_noise_theta_learnprobs <- read.csv('Results_discount_Noise_theta_learnprobs/ELBO_ya_group_discount_Noise_theta_learnprobs.csv')
elbo_oa_discount_noise_theta_learnprobs <- read.csv('Results_discount_Noise_theta_learnprobs/ELBO_oa_group_discount_Noise_theta_learnprobs.csv')

nll_ya_discount_hilonoise_theta_realprobs <- read.csv('Results_discount_hiLoNoise_theta_realprobs/NLL_ya_group_discount_hiLoNoise_theta_realprobs.csv')
nll_oa_discount_hilonoise_theta_realprobs <- read.csv('Results_discount_hiLoNoise_theta_realprobs/NLL_oa_group_discount_hiLoNoise_theta_realprobs.csv')
elbo_ya_discount_hilonoise_theta_realprobs <- read.csv('Results_discount_hiLoNoise_theta_realprobs/ELBO_ya_group_discount_hiLoNoise_theta_realprobs.csv')
elbo_oa_discount_hilonoise_theta_realprobs <- read.csv('Results_discount_hiLoNoise_theta_realprobs/ELBO_oa_group_discount_hiLoNoise_theta_realprobs.csv')

nll_ya_anchorpruning_discount_hilonoise_theta <- read.csv('Results_anchor_pruning_discount_hiLoNoise_theta/NLL_ya_group_anchor_pruning_discount_hiLoNoise_theta.csv')
nll_oa_anchorpruning_discount_hilonoise_theta <- read.csv('Results_anchor_pruning_discount_hiLoNoise_theta/NLL_oa_group_anchor_pruning_discount_hiLoNoise_theta.csv')
elbo_ya_anchorpruning_discount_hilonoise_theta <- read.csv('Results_anchor_pruning_discount_hiLoNoise_theta/ELBO_ya_group_anchor_pruning_discount_hiLoNoise_theta.csv')
elbo_oa_anchorpruning_discount_hilonoise_theta <- read.csv('Results_anchor_pruning_discount_hiLoNoise_theta/ELBO_oa_group_anchor_pruning_discount_hiLoNoise_theta.csv')

nll_ya_discount_noise_theta_realprobs <- read.csv('Results_discount_Noise_theta_realprobs/NLL_ya_group_discount_Noise_theta_realprobs.csv')
nll_oa_discount_noise_theta_realprobs <- read.csv('Results_discount_Noise_theta_realprobs/NLL_oa_group_discount_Noise_theta_realprobs.csv')
elbo_ya_discount_noise_theta_realprobs <- read.csv('Results_discount_Noise_theta_realprobs/ELBO_ya_group_discount_Noise_theta_realprobs.csv')
elbo_oa_discount_noise_theta_realprobs <- read.csv('Results_discount_Noise_theta_realprobs/ELBO_oa_group_discount_Noise_theta_realprobs.csv')



print(c('ELBO YA default zero cost:', tail(elbo_ya_default_0cost$X0, 1)))
print(c('ELBO YA noisedisc zero cost_theta:', tail(elbo_ya_noisedisc_0cost_theta$X0, 1)))
print(c('ELBO YA hiLoNoisedisc zero cost_theta:', tail(elbo_ya_hilonoisedisc_0cost_theta$X0, 1)))
print(c('ELBO YA nonlearning zero cost:', tail(elbo_ya_nolearning_0cost$X0, 1))) 
print(c('ELBO YA noisedisc theta ignore high noise:', tail(elbo_ya_noisedisc_theta_ignoreHinoise$X0, 1)))
print(c('ELBO YA hiLonoisedisc theta ignore high noise:', tail(elbo_ya_hilonoisedisc_theta_ignoreHinoise$X0, 1)))

print(c('ELBO YA anchor pruning:', tail(elbo_ya_anchorpruning$X0, 1)))
print(c('ELBO YA anchor pruning noisedisc theta:', tail(elbo_ya_anchorpruning_discount_noise_theta$X0, 1)))
print(c('ELBO YA noisedisc theta learn probs:', tail(elbo_ya_discount_noise_theta_learnprobs$X0, 1)))
print(c('ELBO YA hiLo noisedisc theta real probs:', tail(elbo_ya_discount_hilonoise_theta_realprobs$X0, 1)))
print(c('ELBO YA noisedisc theta real probs:', tail(elbo_ya_discount_noise_theta_realprobs$X0, 1)))
print(c('ELBO YA anchor pruning hi+Lo noisedisc theta:', tail(elbo_ya_anchorpruning_discount_hilonoise_theta$X0, 1)))

#df_elbo <- as.data.frame(c(elbo_ya[1000,]$X0, elbo_ya_nolearning[1000,]$X0))


print(c('ELBO OA default zero cost:', tail(elbo_oa_default_0cost$X0, 1)))
print(c('ELBO OA noisedisc zero cost_theta:', tail(elbo_oa_noisedisc_0cost_theta$X0, 1)))
print(c('ELBO OA hiLoNoisedisc zero cost_theta:', tail(elbo_oa_hilonoisedisc_0cost_theta$X0, 1)))
print(c('ELBO OA nonlearning zero cost:', tail(elbo_oa_nolearning_0cost$X0, 1))) 
print(c('ELBO OA noisedisc theta ignore high noise:', tail(elbo_oa_noisedisc_theta_ignoreHinoise$X0, 1)))
print(c('ELBO OA hiLonoisedisc theta ignore high noise:', tail(elbo_oa_hilonoisedisc_theta_ignoreHinoise$X0, 1)))

print(c('ELBO OA anchor pruning:', tail(elbo_oa_anchorpruning$X0, 1)))
print(c('ELBO OA anchor pruning noisedisc theta:', tail(elbo_oa_anchorpruning_discount_noise_theta$X0, 1)))
print(c('ELBO OA noisedisc theta learn probs:', tail(elbo_oa_discount_noise_theta_learnprobs$X0, 1)))
print(c('ELBO OA hiLo noisedisc theta real probs:', tail(elbo_oa_discount_hilonoise_theta_realprobs$X0, 1)))
print(c('ELBO OA noisedisc theta real probs:', tail(elbo_oa_discount_noise_theta_realprobs$X0, 1)))
print(c('ELBO OA anchor pruning hi+Lo noisedisc theta:', tail(elbo_oa_anchorpruning_discount_hilonoise_theta$X0, 1)))

nll_ya_default_0cost$model <- NULL
nll_ya_default_0cost$model <- "6-default zero cost"
nll_ya_default_0cost$age <- NULL
nll_ya_default_0cost$age <- "YA"
nll_ya_default_0cost$ID <- NULL
nll_ya_default_0cost$ID <- paste('YA', nll_ya_default_0cost$X, sep="")
nll_oa_default_0cost$model <- NULL
nll_oa_default_0cost$model <- "6-default zero cost"
nll_oa_default_0cost$age <- NULL
nll_oa_default_0cost$age <- "OA"
nll_oa_default_0cost$ID <- NULL
nll_oa_default_0cost$ID <- paste('OA', nll_oa_default_0cost$X, sep="")


nll_ya_noisedisc_0cost_theta$model <- NULL
nll_ya_noisedisc_0cost_theta$model <- "9-noisedisc_zerocost_theta"
nll_ya_noisedisc_0cost_theta$age <- NULL
nll_ya_noisedisc_0cost_theta$age <- "YA"
#nll_ya_noisedisc_0cost_theta$ID <- NULL
#nll_ya_noisedisc_0cost_theta$ID <- paste('YA', nll_ya_noisedisc_0cost_theta$X, sep="")
nll_oa_noisedisc_0cost_theta$model <- NULL
nll_oa_noisedisc_0cost_theta$model <- "9-noisedisc_zerocost_theta"
nll_oa_noisedisc_0cost_theta$age <- NULL
nll_oa_noisedisc_0cost_theta$age <- "OA"
#nll_oa_noisedisc_0cost_theta$ID <- NULL
#nll_oa_noisedisc_0cost_theta$ID <- paste('OA', nll_oa_noisedisc_0cost_theta$X, sep="")

nll_ya_hilonoisedisc_0cost_theta$model <- NULL
nll_ya_hilonoisedisc_0cost_theta$model <- "10-hiLoNoisedisc_zerocost_theta"
nll_ya_hilonoisedisc_0cost_theta$age <- NULL
nll_ya_hilonoisedisc_0cost_theta$age <- "YA"
nll_ya_hilonoisedisc_0cost_theta$ID <- NULL
nll_ya_hilonoisedisc_0cost_theta$ID <- paste('YA', nll_ya_hilonoisedisc_0cost_theta$X, sep="")
nll_oa_hilonoisedisc_0cost_theta$model <- NULL
nll_oa_hilonoisedisc_0cost_theta$model <- "10-hiLoNoisedisc_zerocost_theta"
nll_oa_hilonoisedisc_0cost_theta$age <- NULL
nll_oa_hilonoisedisc_0cost_theta$age <- "OA"
nll_oa_hilonoisedisc_0cost_theta$ID <- NULL
nll_oa_hilonoisedisc_0cost_theta$ID <- paste('OA', nll_oa_hilonoisedisc_0cost_theta$X, sep="")


nll_ya_nolearning_0cost$model <- NULL
nll_ya_nolearning_0cost$model <- "16-nolearning-zerocost"
nll_ya_nolearning_0cost$age <- NULL
nll_ya_nolearning_0cost$age <- "YA"
#nll_ya_nolearning_0cost$ID <- NULL
#nll_ya_nolearning_0cost$ID <- paste('YA', nll_ya_nolearning_0cost$X, sep="")
nll_oa_nolearning_0cost$model <- NULL
nll_oa_nolearning_0cost$model <- "16-nolearning-zerocost"
nll_oa_nolearning_0cost$age <- NULL
nll_oa_nolearning_0cost$age <- "OA"
#nll_oa_nolearning_0cost$ID <- NULL
#nll_oa_nolearning_0cost$ID <- paste('OA', nll_oa_nolearning_0cost$X, sep="")


nll_ya_noisedisc_theta_ignoreHinoise$model <- NULL
nll_ya_noisedisc_theta_ignoreHinoise$model <- "17-Noisedisc-theta-ignoreHinoise"
nll_ya_noisedisc_theta_ignoreHinoise$age <- NULL
nll_ya_noisedisc_theta_ignoreHinoise$age <- "YA"
#nll_ya_noisedisc_theta_ignoreHinoise$ID <- NULL
#nll_ya_noisedisc_theta_ignoreHinoise$ID <- paste('YA', nll_ya_noisedisc_theta_ignoreHinoise$X, sep="")
nll_oa_noisedisc_theta_ignoreHinoise$model <- NULL
nll_oa_noisedisc_theta_ignoreHinoise$model <- "17-Noisedisc-theta-ignoreHinoise"
nll_oa_noisedisc_theta_ignoreHinoise$age <- NULL
nll_oa_noisedisc_theta_ignoreHinoise$age <- "OA"
#nll_oa_noisedisc_theta_ignoreHinoise$ID <- NULL
#nll_oa_noisedisc_theta_ignoreHinoise$ID <- paste('OA', nll_oa_noisedisc_theta_ignoreHinoise$X, sep="")

nll_ya_hilonoisedisc_theta_ignoreHinoise$model <- NULL
nll_ya_hilonoisedisc_theta_ignoreHinoise$model <- "18-hiLoNoisedisc-theta-ignoreHinoise"
nll_ya_hilonoisedisc_theta_ignoreHinoise$age <- NULL
nll_ya_hilonoisedisc_theta_ignoreHinoise$age <- "YA"
#nll_ya_hilonoisedisc_theta_ignoreHinoise$ID <- NULL
#nll_ya_hilonoisedisc_theta_ignoreHinoise$ID <- paste('YA', nll_ya_noisedisc_theta_ignoreHinoise$X, sep="")
nll_oa_hilonoisedisc_theta_ignoreHinoise$model <- NULL
nll_oa_hilonoisedisc_theta_ignoreHinoise$model <- "18-hiLoNoisedisc-theta-ignoreHinoise"
nll_oa_hilonoisedisc_theta_ignoreHinoise$age <- NULL
nll_oa_hilonoisedisc_theta_ignoreHinoise$age <- "OA"
#nll_oa_hilonoisedisc_theta_ignoreHinoise$ID <- NULL
#nll_oa_hilonoisedisc_theta_ignoreHinoise$ID <- paste('OA', nll_oa_noisedisc_theta_ignoreHinoise$X, sep="")

nll_ya_anchorpruning$model <- NULL
nll_ya_anchorpruning$model <- "19-anchor-pruning"
nll_ya_anchorpruning$age <- NULL
nll_ya_anchorpruning$age <- "YA"
#nll_ya_anchorpruning$ID <- NULL
#nll_ya_anchorpruning$ID <- paste('YA', nll_ya_anchorpruning$X, sep="")
nll_oa_anchorpruning$model <- NULL
nll_oa_anchorpruning$model <- "19-anchor-pruning"
nll_oa_anchorpruning$age <- NULL
nll_oa_anchorpruning$age <- "OA"
#nll_oa_anchorpruning$ID <- NULL
#nll_oa_anchorpruning$ID <- paste('OA', nll_oa_anchorpruning$X, sep="")

nll_ya_anchorpruning_discount_noise_theta$model <- NULL
nll_ya_anchorpruning_discount_noise_theta$model <- "20-anchor-pruning-discount-noise-theta"
nll_ya_anchorpruning_discount_noise_theta$age <- NULL
nll_ya_anchorpruning_discount_noise_theta$age <- "YA"
#nll_ya_anchorpruning_discount_noise_theta$ID <- NULL
#nll_ya_anchorpruning_discount_noise_theta$ID <- paste('YA', nll_ya_anchorpruning_discount_noise_theta$X, sep="")
nll_oa_anchorpruning_discount_noise_theta$model <- NULL
nll_oa_anchorpruning_discount_noise_theta$model <- "20-anchor-pruning-discount-noise-theta"
nll_oa_anchorpruning_discount_noise_theta$age <- NULL
nll_oa_anchorpruning_discount_noise_theta$age <- "OA"
#nll_oa_anchorpruning_discount_noise_theta$ID <- NULL
#nll_oa_anchorpruning_discount_noise_theta$ID <- paste('OA', nll_oa_anchorpruning_discount_noise_theta$X, sep="")

nll_ya_discount_noise_theta_learnprobs$model <- NULL
nll_ya_discount_noise_theta_learnprobs$model <- "21-discount-noise-theta-learn-probs"
nll_ya_discount_noise_theta_learnprobs$age <- NULL
nll_ya_discount_noise_theta_learnprobs$age <- "YA"
#nll_ya_discount_noise_theta_learnprobs$ID <- NULL
#nll_ya_discount_noise_theta_learnprobs$ID <- paste('YA', nll_ya_discount_noise_theta_learnprobs$X, sep="")
nll_oa_discount_noise_theta_learnprobs$model <- NULL
nll_oa_discount_noise_theta_learnprobs$model <- "21-discount-noise-theta-learn-probs"
nll_oa_discount_noise_theta_learnprobs$age <- NULL
nll_oa_discount_noise_theta_learnprobs$age <- "OA"
#nll_oa_discount_noise_theta_learnprobs$ID <- NULL
#nll_oa_discount_noise_theta_learnprobs$ID <- paste('OA', nll_oa_discount_noise_theta_learnprobs$X, sep="")

nll_ya_discount_hilonoise_theta_realprobs$model <- NULL
nll_ya_discount_hilonoise_theta_realprobs$model <- "22-discount-hiLonoise-theta-real-probs"
nll_ya_discount_hilonoise_theta_realprobs$age <- NULL
nll_ya_discount_hilonoise_theta_realprobs$age <- "YA"
nll_oa_discount_hilonoise_theta_realprobs$model <- NULL
nll_oa_discount_hilonoise_theta_realprobs$model <- "22-discount-hiLonoise-theta-real-probs"
nll_oa_discount_hilonoise_theta_realprobs$age <- NULL
nll_oa_discount_hilonoise_theta_realprobs$age <- "OA"

nll_ya_anchorpruning_discount_hilonoise_theta$model <- NULL
nll_ya_anchorpruning_discount_hilonoise_theta$model <- "23-anchor-pruning-discount-hiLonoise-theta"
nll_ya_anchorpruning_discount_hilonoise_theta$age <- NULL
nll_ya_anchorpruning_discount_hilonoise_theta$age <- 'YA'
nll_oa_anchorpruning_discount_hilonoise_theta$model <- NULL
nll_oa_anchorpruning_discount_hilonoise_theta$model <- "23-anchor-pruning-discount-hiLonoise-theta"
nll_oa_anchorpruning_discount_hilonoise_theta$age <- NULL
nll_oa_anchorpruning_discount_hilonoise_theta$age <- 'OA'

nll_ya_discount_noise_theta_realprobs$model <- NULL
nll_ya_discount_noise_theta_realprobs$model <- "26-discount-noise-theta-real-probs"
nll_ya_discount_noise_theta_realprobs$age <- NULL
nll_ya_discount_noise_theta_realprobs$age <- "YA"
nll_oa_discount_noise_theta_realprobs$model <- NULL
nll_oa_discount_noise_theta_realprobs$model <- "26-discount-noise-theta-real-probs"
nll_oa_discount_noise_theta_realprobs$age <- NULL
nll_oa_discount_noise_theta_realprobs$age <- "OA"

elbo_ya_default_0cost$age <- NULL 
elbo_ya_default_0cost$age <- "YA"
elbo_oa_default_0cost$age <- NULL 
elbo_oa_default_0cost$age <- "OA"

elbo_ya_noisedisc_0cost_theta$age <- NULL 
elbo_ya_noisedisc_0cost_theta$age <- "YA"
elbo_oa_noisedisc_0cost_theta$age <- NULL 
elbo_oa_noisedisc_0cost_theta$age <- "OA"

elbo_ya_hilonoisedisc_0cost_theta$age <- NULL 
elbo_ya_hilonoisedisc_0cost_theta$age <- "YA"
elbo_oa_hilonoisedisc_0cost_theta$age <- NULL 
elbo_oa_hilonoisedisc_0cost_theta$age <- "OA"


elbo_ya_nolearning_0cost$age <- NULL 
elbo_ya_nolearning_0cost$age <- "YA"
elbo_oa_nolearning_0cost$age <- NULL 
elbo_oa_nolearning_0cost$age <- "OA"

elbo_ya_noisedisc_theta_ignoreHinoise$age <- NULL 
elbo_ya_noisedisc_theta_ignoreHinoise$age <- "YA"
elbo_oa_noisedisc_theta_ignoreHinoise$age <- NULL 
elbo_oa_noisedisc_theta_ignoreHinoise$age <- "OA"

elbo_ya_hilonoisedisc_theta_ignoreHinoise$age <- NULL 
elbo_ya_hilonoisedisc_theta_ignoreHinoise$age <- "YA"
elbo_oa_hilonoisedisc_theta_ignoreHinoise$age <- NULL 
elbo_oa_hilonoisedisc_theta_ignoreHinoise$age <- "OA"

elbo_ya_anchorpruning$age <- NULL 
elbo_ya_anchorpruning$age <- "YA"
elbo_oa_anchorpruning$age <- NULL 
elbo_oa_anchorpruning$age <- "OA"

elbo_ya_anchorpruning_discount_noise_theta$age <- NULL 
elbo_ya_anchorpruning_discount_noise_theta$age <- "YA"
elbo_oa_anchorpruning_discount_noise_theta$age <- NULL 
elbo_oa_anchorpruning_discount_noise_theta$age <- "OA"

elbo_ya_discount_noise_theta_learnprobs$age <- NULL 
elbo_ya_discount_noise_theta_learnprobs$age <- "YA"
elbo_oa_discount_noise_theta_learnprobs$age <- NULL 
elbo_oa_discount_noise_theta_learnprobs$age <- "OA"

elbo_ya_discount_hilonoise_theta_realprobs$age <- NULL
elbo_ya_discount_hilonoise_theta_realprobs$age <- "YA"
elbo_oa_discount_hilonoise_theta_realprobs$age <- NULL
elbo_oa_discount_hilonoise_theta_realprobs$age <- "OA"

elbo_ya_anchorpruning_discount_hilonoise_theta$age <- NULL
elbo_ya_anchorpruning_discount_hilonoise_theta$age <- 'YA'
elbo_oa_anchorpruning_discount_hilonoise_theta$age <- NULL
elbo_oa_anchorpruning_discount_hilonoise_theta$age <- 'OA'


elbo_yaoa_default_0cost <- rbind(elbo_ya_default_0cost, elbo_oa_default_0cost)
elbo_yaoa_noisedisc_0cost_theta <- rbind(elbo_ya_noisedisc_0cost_theta, elbo_oa_noisedisc_0cost_theta)
elbo_yaoa_hilonoisedisc_0cost_theta <- rbind(elbo_ya_hilonoisedisc_0cost_theta, elbo_oa_hilonoisedisc_0cost_theta)
elbo_yaoa_nolearning_0cost <- rbind(elbo_ya_nolearning_0cost, elbo_oa_nolearning_0cost)
elbo_yaoa_noisedisc_theta_ignoreHinoise <- rbind(elbo_ya_noisedisc_theta_ignoreHinoise, elbo_oa_noisedisc_theta_ignoreHinoise)
elbo_yaoa_hilonoisedisc_theta_ignoreHinoise <- rbind(elbo_ya_hilonoisedisc_theta_ignoreHinoise, elbo_oa_hilonoisedisc_theta_ignoreHinoise)
elbo_yaoa_anchorpruning <- rbind(elbo_ya_anchorpruning, elbo_oa_anchorpruning)
elbo_yaoa_anchorpruning_discount_noise_theta <- rbind(elbo_ya_anchorpruning_discount_noise_theta, elbo_oa_anchorpruning_discount_noise_theta)
elbo_yaoa_discount_noise_theta_learnprobs <- rbind(elbo_ya_discount_noise_theta_learnprobs, elbo_oa_discount_noise_theta_learnprobs)
elbo_yaoa_discount_hilonoise_theta_realprobs <- rbind(elbo_ya_discount_hilonoise_theta_realprobs, elbo_oa_discount_hilonoise_theta_realprobs)
elbo_yaoa_anchorpruning_discount_hilonoise_theta <- rbind(elbo_ya_anchorpruning_discount_hilonoise_theta, elbo_oa_anchorpruning_discount_hilonoise_theta)

def_elbo_yaoa_default_0cost <- subset(elbo_yaoa_default_0cost, X>998)
def_elbo_yaoa_default_0cost$model <- NULL
def_elbo_yaoa_default_0cost$model <-'6-default-0cost'
setnames(def_elbo_yaoa_default_0cost, old=c("X0"), new=c("ELBO"))

elbo_yaoa_noisedisc_0cost_theta <- subset(elbo_yaoa_noisedisc_0cost_theta, X>998)
elbo_yaoa_noisedisc_0cost_theta$model <- NULL
elbo_yaoa_noisedisc_0cost_theta$model <-'9-noisedisc_zerocost_theta'
setnames(elbo_yaoa_noisedisc_0cost_theta, old=c("X0"), new=c("ELBO"))

elbo_yaoa_hilonoisedisc_0cost_theta <- subset(elbo_yaoa_hilonoisedisc_0cost_theta, X>998)
elbo_yaoa_hilonoisedisc_0cost_theta$model <- NULL
elbo_yaoa_hilonoisedisc_0cost_theta$model <-'10-hiLoNoisedisc_zerocost_theta'
setnames(elbo_yaoa_hilonoisedisc_0cost_theta, old=c("X0"), new=c("ELBO"))

df_elbo_nl_yaoa_0cost <- subset(elbo_yaoa_nolearning_0cost, X>998)
df_elbo_nl_yaoa_0cost$model <- NULL
df_elbo_nl_yaoa_0cost$model <-'2-nolearning-oldcost'
setnames(df_elbo_nl_yaoa_0cost, old=c("X0"), new=c("ELBO"))

df_elbo_noisedisc_theta_ignoreHinoise <- subset(elbo_yaoa_noisedisc_theta_ignoreHinoise, X>998)
df_elbo_noisedisc_theta_ignoreHinoise$model <- NULL
df_elbo_noisedisc_theta_ignoreHinoise$model <-'17-Noisedisc-theta-ignoreHinoise'
setnames(df_elbo_noisedisc_theta_ignoreHinoise, old=c("X0"), new=c("ELBO"))

df_elbo_hilonoisedisc_theta_ignoreHinoise <- subset(elbo_yaoa_hilonoisedisc_theta_ignoreHinoise, X>998)
df_elbo_hilonoisedisc_theta_ignoreHinoise$model <- NULL
df_elbo_hilonoisedisc_theta_ignoreHinoise$model <-'18-hiLoNoisedisc-theta-ignoreHinoise'
setnames(df_elbo_hilonoisedisc_theta_ignoreHinoise, old=c("X0"), new=c("ELBO"))

df_elbo_yaoa_anchorpruning <- subset(elbo_yaoa_anchorpruning, X>998)
df_elbo_yaoa_anchorpruning$model <- NULL
df_elbo_yaoa_anchorpruning$model <-'19-anchor-pruning'
setnames(df_elbo_yaoa_anchorpruning, old=c("X0"), new=c("ELBO"))

df_elbo_yaoa_anchorpruning_discount_noise_theta <- subset(elbo_yaoa_anchorpruning_discount_noise_theta, X>998)
df_elbo_yaoa_anchorpruning_discount_noise_theta$model <- NULL
df_elbo_yaoa_anchorpruning_discount_noise_theta$model <-'20-anchor-pruning-discount-noise-theta'
setnames(df_elbo_yaoa_anchorpruning_discount_noise_theta, old=c("X0"), new=c("ELBO"))

df_elbo_yaoa_discount_noise_theta_learnprobs <- subset(elbo_yaoa_discount_noise_theta_learnprobs, X>998)
df_elbo_yaoa_discount_noise_theta_learnprobs$model <- NULL
df_elbo_yaoa_discount_noise_theta_learnprobs$model <-'21-discount-noise-theta-learn-probs'
setnames(df_elbo_yaoa_discount_noise_theta_learnprobs, old=c("X0"), new=c("ELBO"))

df_elbo_yaoa_discount_hilonoise_theta_realprobs <- subset(elbo_yaoa_discount_hilonoise_theta_realprobs, X>998)
df_elbo_yaoa_discount_hilonoise_theta_realprobs$model <- NULL
df_elbo_yaoa_discount_hilonoise_theta_realprobs$model <- '22-discount-hiLonoise-theta-real-probs'
setnames(df_elbo_yaoa_discount_hilonoise_theta_realprobs, old=c("X0"), new=c("ELBO"))

df_elbo_yaoa_anchorpruning_discount_hilonoise_theta <- subset(elbo_yaoa_anchorpruning_discount_hilonoise_theta, X>998)
df_elbo_yaoa_anchorpruning_discount_hilonoise_theta$model <- NULL
df_elbo_yaoa_anchorpruning_discount_hilonoise_theta$model <-'23-anchor-pruning-discount-hilonoise-theta'
setnames(df_elbo_yaoa_anchorpruning_discount_hilonoise_theta, old=c("X0"), new=c("ELBO"))

df_elbo_comp_zerocost_top3 <- rbind(def_elbo_yaoa_default_0cost, elbo_yaoa_noisedisc_0cost_theta, df_elbo_noisedisc_theta_ignoreHinoise)

df_elbo_comp_zerocost_6models <- rbind(elbo_yaoa_hilonoisedisc_0cost_theta,                                         
                                        elbo_yaoa_noisedisc_0cost_theta,
                                        def_elbo_yaoa_default_0cost,
                                        df_elbo_nl_yaoa_0cost,
                                       df_elbo_noisedisc_theta_ignoreHinoise,
                                       df_elbo_hilonoisedisc_theta_ignoreHinoise)

df_elbo_comp_systematic <- rbind(def_elbo_yaoa_default_0cost, 
                                 df_elbo_yaoa_anchorpruning,
                                 elbo_yaoa_noisedisc_0cost_theta,
                                 df_elbo_yaoa_anchorpruning_discount_noise_theta,
                                 df_elbo_yaoa_discount_noise_theta_learnprobs,
                                 df_elbo_yaoa_discount_hilonoise_theta_realprobs,
                                 df_elbo_yaoa_anchorpruning_discount_hilonoise_theta)


df_elbo_comp_all <- rbind(def_elbo_yaoa_default_0cost, # 6
                          elbo_yaoa_noisedisc_0cost_theta, # 9 
                          elbo_yaoa_hilonoisedisc_0cost_theta, # 10
                          df_elbo_noisedisc_theta_ignoreHinoise, # 17
                          df_elbo_hilonoisedisc_theta_ignoreHinoise, # 18
                          df_elbo_yaoa_anchorpruning, # 19
                          df_elbo_yaoa_anchorpruning_discount_noise_theta, # 20
                          df_elbo_yaoa_discount_noise_theta_learnprobs, # 21
                          df_elbo_yaoa_discount_hilonoise_theta_realprobs, # 22
                          df_elbo_yaoa_anchorpruning_discount_hilonoise_theta # 23
                          )

nll_yaoa_default_0cost <- rbind(nll_ya_default_0cost, nll_oa_default_0cost) # BIC correctly computed for 3 parameters (beta, theta, alpha)
nll_yaoa_noisedisc_0cost_theta <- rbind(nll_ya_noisedisc_0cost_theta, nll_oa_noisedisc_0cost_theta)
nll_yaoa_hilonoisedisc_0cost_theta <- rbind(nll_ya_hilonoisedisc_0cost_theta, nll_oa_hilonoisedisc_0cost_theta)  
nll_yaoa_nolearning_0cost <- rbind(nll_ya_nolearning_0cost, nll_oa_nolearning_0cost)# BIC correctly computed for 2 parameters (beta, theta)
nll_yaoa_noisedisc_theta_ignoreHinoise <- rbind(nll_ya_noisedisc_theta_ignoreHinoise, nll_oa_noisedisc_theta_ignoreHinoise)
nll_yaoa_anchorpruning <- rbind(nll_ya_anchorpruning, nll_oa_anchorpruning)
nll_yaoa_anchorpruning_discount_noise_theta <- rbind(nll_ya_anchorpruning_discount_noise_theta, nll_oa_anchorpruning_discount_noise_theta)
nll_yaoa_discount_noise_theta_learnprobs <- rbind(nll_ya_discount_noise_theta_learnprobs, nll_oa_discount_noise_theta_learnprobs)
nll_yaoa_discount_hilonoise_theta_realprobs <- rbind(nll_ya_discount_hilonoise_theta_realprobs, nll_oa_discount_hilonoise_theta_realprobs)
nll_yaoa_discount_noise_theta_realprobs <- rbind(nll_ya_discount_noise_theta_realprobs, nll_oa_discount_noise_theta_realprobs)
nll_yaoa_anchorpruning_discount_hilonoise_theta <- rbind(nll_ya_anchorpruning_discount_hilonoise_theta, nll_oa_anchorpruning_discount_hilonoise_theta)
nll_yaoa_hilonoisedisc_theta_ignoreHinoise <- rbind(nll_ya_hilonoisedisc_theta_ignoreHinoise, nll_oa_hilonoisedisc_theta_ignoreHinoise)


nll_yaoa_noisedisc_0cost_theta$BIC_120_mean         <- nll_yaoa_noisedisc_0cost_theta$BIC_120_mean - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_noisedisc_0cost_theta$BIC_hinoise_120_mean <- nll_yaoa_noisedisc_0cost_theta$BIC_hinoise_120_mean - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_noisedisc_0cost_theta$BIC_lonoise_120_mean <- nll_yaoa_noisedisc_0cost_theta$BIC_lonoise_120_mean - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_hilonoisedisc_0cost_theta$BIC_120_mean         <- nll_yaoa_hilonoisedisc_0cost_theta$BIC_120_mean #- log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_hilonoisedisc_0cost_theta$BIC_hinoise_120_mean <- nll_yaoa_hilonoisedisc_0cost_theta$BIC_hinoise_120_mean # - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_hilonoisedisc_0cost_theta$BIC_lonoise_120_mean <- nll_yaoa_hilonoisedisc_0cost_theta$BIC_lonoise_120_mean # - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_noisedisc_theta_ignoreHinoise$BIC_120_mean         <- nll_yaoa_noisedisc_theta_ignoreHinoise$BIC_120_mean - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_noisedisc_theta_ignoreHinoise$BIC_hinoise_120_mean <- nll_yaoa_noisedisc_theta_ignoreHinoise$BIC_hinoise_120_mean - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_noisedisc_theta_ignoreHinoise$BIC_lonoise_120_mean <- nll_yaoa_noisedisc_theta_ignoreHinoise$BIC_lonoise_120_mean - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3
nll_yaoa_discount_noise_theta_learnprobs$BIC_120_mean <- nll_yaoa_discount_noise_theta_learnprobs$BIC_120_mean - log(120) # Error in the python script - stored BIC values computed for 5 params, not 4
nll_yaoa_discount_noise_theta_learnprobs$BIC_hinoise_120_mean <- nll_yaoa_discount_noise_theta_learnprobs$BIC_hinoise_120_mean - log(120) # Error in the python script - stored BIC values computed for 5 params, not 4
nll_yaoa_discount_noise_theta_learnprobs$BIC_lonoise_120_mean <- nll_yaoa_discount_noise_theta_learnprobs$BIC_lonoise_120_mean - log(120) # Error in the python script - stored BIC values computed for 5 params, not 4
nll_yaoa_discount_noise_theta_realprobs$BIC_120_mean <- nll_yaoa_discount_noise_theta_realprobs$BIC_120_mean - log(120) # Error in the python script - stored BIC values computed for 5 params, not 4
nll_yaoa_discount_noise_theta_realprobs$BIC_hinoise_120_mean <- nll_yaoa_discount_noise_theta_realprobs$BIC_hinoise_120_mean - log(120) # Error in the python script - stored BIC values computed for 5 params, not 4
nll_yaoa_discount_noise_theta_realprobs$BIC_lonoise_120_mean <- nll_yaoa_discount_noise_theta_realprobs$BIC_lonoise_120_mean - log(120) # Error in the python script - stored BIC values computed for 4 params, not 3

nll_yaoa_default_0cost$subjIDs <- NULL
nll_yaoa_noisedisc_0cost_theta$subjIDs <- NULL
nll_yaoa_hilonoisedisc_0cost_theta$subjIDs <- NULL
nll_yaoa_nolearning_0cost$subjIDs <- NULL
nll_yaoa_noisedisc_theta_ignoreHinoise$subjIDs <- NULL

nll_yaoa_anchorpruning$subjIDs <- NULL
nll_yaoa_anchorpruning_discount_noise_theta$subjIDs <- NULL
nll_yaoa_discount_noise_theta_learnprobs$subjIDs <- NULL
nll_yaoa_discount_hilonoise_theta_realprobs$subjIDs <- NULL

#nll_yaoa_anchorpruning_discount_hilonoise_theta

nll_yaoa_modelcomp_zerocost_top3 <- rbind(nll_yaoa_default_0cost, nll_yaoa_noisedisc_0cost_theta, nll_yaoa_noisedisc_theta_ignoreHinoise)



nll_yaoa_modelcomp_5models <- rbind(nll_yaoa_hilonoisedisc_0cost_theta,
                                    nll_yaoa_noisedisc_0cost_theta,
                                    nll_yaoa_default_0cost,
                                    nll_yaoa_nolearning_0cost,
                                    nll_yaoa_noisedisc_theta_ignoreHinoise)

nll_yaoa_comp_systematic <- rbind(nll_yaoa_default_0cost, 
                                 nll_yaoa_anchorpruning,
                                 nll_yaoa_noisedisc_0cost_theta,
                                 nll_yaoa_anchorpruning_discount_noise_theta,
                                 nll_yaoa_discount_noise_theta_learnprobs,
                                 nll_yaoa_discount_hilonoise_theta_realprobs,
                                 nll_yaoa_anchorpruning_discount_hilonoise_theta)

nll_yaoa_comp_systematic$n_params <- NULL
nll_yaoa_comp_systematic$n_params <- (nll_yaoa_comp_systematic$BIC_120_mean - 2*nll_yaoa_comp_systematic$nll_1staction_120_mean) /log(120)
aggregate(nll_yaoa_comp_systematic$n_params, list(nll_yaoa_comp_systematic$model), FUN=mean, na.rm=TRUE) 

nll_yaoa_comp_all <- rbind(nll_yaoa_default_0cost, # 6
                          nll_yaoa_noisedisc_0cost_theta, # 9 
                          nll_yaoa_hilonoisedisc_0cost_theta, # 10
                          nll_yaoa_noisedisc_theta_ignoreHinoise, # 17
                          nll_yaoa_hilonoisedisc_theta_ignoreHinoise, # 18
                          nll_yaoa_anchorpruning, # 19
                          nll_yaoa_anchorpruning_discount_noise_theta, # 20
                          nll_yaoa_discount_noise_theta_learnprobs, # 21
                          nll_yaoa_discount_hilonoise_theta_realprobs, # 22
                          nll_yaoa_discount_noise_theta_realprobs,                          
                          nll_yaoa_anchorpruning_discount_hilonoise_theta # 23
)
nll_yaoa_comp_all$n_params <- NULL
nll_yaoa_comp_all$n_params <- (nll_yaoa_comp_all$BIC_120_mean - 2*nll_yaoa_comp_all$nll_1staction_120_mean) /log(120)
aggregate(nll_yaoa_comp_all$n_params, list(nll_yaoa_comp_all$model), FUN=mean, na.rm=TRUE) 

library(scales)
myColors <- hue_pal()(11) #extract hex color codes for a plot with five elements in ggplot2 
names(myColors) <- unique(nll_yaoa_comp_systematic$model)
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")[1:11] # colorblind-friendly

#gp_modelcomp_elbo <- ggplot(data = df_elbo_comp_zerocost_top3, aes(x=age, y=ELBO, color=model, fill=model, group=model)) +    
gp_modelcomp_elbo <- ggplot(data = df_elbo_comp_systematic, aes(x=age, y=ELBO, color=model, fill=model, group=model)) +      
  stat_summary(fun = identity, geom = "bar", position="dodge") + 
  #labs(title = 'YA')+ 
  #,subtitle = '(*p<.05, **p<.01, ***p<.001)') +
  #scale_fill_manual(values = myColors) +
  #scale_color_manual(values = myColors) +  
  ylab("ELBO") + xlab('Age group' ) +
  #annotate("text", x = 1, y = 10500, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='default']) ), size=6) +  
  #annotate("text", x = 2, y = 10800, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='nolearning']) ), size=6) +    
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_elbo)
#imageFile <- file.path(imageDirectory,"model_comparison_ELBO_YAOA_zerocost_top3_col.png")
imageFile <- file.path(imageDirectory,"model_comparison_ELBO_YAOA_systematic_col.png")
ggsave(imageFile)




df_def_sub_hinoise_0cost <- select(nll_yaoa_default_0cost, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_def_sub_hinoise_0cost$noise <- NULL
df_def_sub_hinoise_0cost$noise <- 'high'
df_def_sub_lonoise_0cost <- select(nll_yaoa_default_0cost, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_def_sub_lonoise_0cost$noise <- NULL
df_def_sub_lonoise_0cost$noise <- 'low'
setnames(df_def_sub_hinoise_0cost, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
setnames(df_def_sub_lonoise_0cost, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
df_def_noise_0cost <- rbind(df_def_sub_hinoise_0cost, df_def_sub_lonoise_0cost)


df_default_0cost_hinoise <- select(nll_yaoa_default_0cost, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_default_0cost_hinoise$noise <- NULL
df_default_0cost_hinoise$noise <- 'high'
df_default_0cost_lonoise <- select(nll_yaoa_default_0cost, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_default_0cost_lonoise$noise <- NULL
df_default_0cost_lonoise$noise <- 'low'
setnames(df_default_0cost_hinoise, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
setnames(df_default_0cost_lonoise, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
df_default_0cost_noise <- rbind(df_default_0cost_hinoise, df_default_0cost_lonoise)

df_noisedisc_0cost_theta_hinoise <- select(nll_yaoa_noisedisc_0cost_theta, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_noisedisc_0cost_theta_hinoise$noise <- NULL
df_noisedisc_0cost_theta_hinoise$noise <- 'high'
df_noisedisc_0cost_theta_lonoise <- select(nll_yaoa_noisedisc_0cost_theta, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_noisedisc_0cost_theta_lonoise$noise <- NULL
df_noisedisc_0cost_theta_lonoise$noise <- 'low'
setnames(df_noisedisc_0cost_theta_hinoise, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
setnames(df_noisedisc_0cost_theta_lonoise, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
df_noisedisc_0cost_theta_noise <- rbind(df_noisedisc_0cost_theta_hinoise, df_noisedisc_0cost_theta_lonoise)


df_hilonoisedisc_0cost_theta_hinoise <- select(nll_yaoa_hilonoisedisc_0cost_theta, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_hilonoisedisc_0cost_theta_hinoise$noise <- NULL
df_hilonoisedisc_0cost_theta_hinoise$noise <- 'high'
df_hilonoisedisc_0cost_theta_lonoise <- select(nll_yaoa_hilonoisedisc_0cost_theta, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_hilonoisedisc_0cost_theta_lonoise$noise <- NULL
df_hilonoisedisc_0cost_theta_lonoise$noise <- 'low'
setnames(df_hilonoisedisc_0cost_theta_hinoise, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
setnames(df_hilonoisedisc_0cost_theta_lonoise, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
df_hilonoisedisc_0cost_theta_noise <- rbind(df_hilonoisedisc_0cost_theta_hinoise, df_hilonoisedisc_0cost_theta_lonoise)

df_anchorpruning_hinoise <- select(nll_yaoa_anchorpruning, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_anchorpruning_hinoise$noise <- NULL
df_anchorpruning_hinoise$noise <- 'high'
df_anchorpruning_lonoise <- select(nll_yaoa_anchorpruning, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_anchorpruning_lonoise$noise <- NULL
df_anchorpruning_lonoise$noise <- 'low'
setnames(df_anchorpruning_hinoise, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
setnames(df_anchorpruning_lonoise, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
df_anchorpruning_noise <- rbind(df_anchorpruning_hinoise, df_anchorpruning_lonoise)

df_anchorpruning_hinoise_discount_noise_theta <- select(nll_yaoa_anchorpruning_discount_noise_theta, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_anchorpruning_hinoise_discount_noise_theta$noise <- NULL
df_anchorpruning_hinoise_discount_noise_theta$noise <- 'high'
df_anchorpruning_lonoise_discount_noise_theta <- select(nll_yaoa_anchorpruning_discount_noise_theta, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_anchorpruning_lonoise_discount_noise_theta$noise <- NULL
df_anchorpruning_lonoise_discount_noise_theta$noise <- 'low'
setnames(df_anchorpruning_hinoise_discount_noise_theta, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
setnames(df_anchorpruning_lonoise_discount_noise_theta, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
df_anchorpruning_noise <- rbind(df_anchorpruning_hinoise_discount_noise_theta, df_anchorpruning_lonoise_discount_noise_theta)

df_discount_noise_theta_learnprobs_hinoise <- select(nll_yaoa_discount_noise_theta_learnprobs, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_discount_noise_theta_learnprobs_hinoise$noise <- NULL
df_discount_noise_theta_learnprobs_hinoise$noise <- 'high'
df_discount_noise_theta_learnprobs_lonoise <- select(nll_yaoa_discount_noise_theta_learnprobs, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_discount_noise_theta_learnprobs_lonoise$noise <- NULL
df_discount_noise_theta_learnprobs_lonoise$noise <- 'low'
setnames(df_discount_noise_theta_learnprobs_hinoise, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
setnames(df_discount_noise_theta_learnprobs_lonoise, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
df_discount_noise_theta_learnprobs_noise <- rbind(df_discount_noise_theta_learnprobs_hinoise,
                                                  df_discount_noise_theta_learnprobs_lonoise)

df_discount_hilonoise_theta_realprobs_hinoise <- select(nll_yaoa_discount_hilonoise_theta_realprobs, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_discount_hilonoise_theta_realprobs_hinoise$noise <- NULL
df_discount_hilonoise_theta_realprobs_hinoise$noise <- 'high'
df_discount_hilonoise_theta_realprobs_lonoise <- select(nll_yaoa_discount_hilonoise_theta_realprobs, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_discount_hilonoise_theta_realprobs_lonoise$noise <- NULL
df_discount_hilonoise_theta_realprobs_lonoise$noise <- 'low'
setnames(df_discount_hilonoise_theta_realprobs_hinoise, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"), skip_absent=TRUE)
setnames(df_discount_hilonoise_theta_realprobs_hinoise, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"), skip_absent=TRUE)
df_discount_hilonoise_theta_realprobs_noise <- rbind(df_discount_hilonoise_theta_realprobs_hinoise,
                                                  df_discount_hilonoise_theta_realprobs_hinoise)

df_discount_noise_theta_realprobs_hinoise <- select(nll_yaoa_discount_noise_theta_realprobs, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_discount_noise_theta_realprobs_hinoise$noise <- NULL
df_discount_noise_theta_realprobs_hinoise$noise <- 'high'
df_discount_noise_theta_realprobs_lonoise <- select(nll_yaoa_discount_noise_theta_realprobs, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_discount_noise_theta_realprobs_lonoise$noise <- NULL
df_discount_noise_theta_realprobs_lonoise$noise <- 'low'
setnames(df_discount_noise_theta_realprobs_hinoise, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"), skip_absent=TRUE)
setnames(df_discount_noise_theta_realprobs_hinoise, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"), skip_absent=TRUE)
df_discount_noise_theta_realprobs_noise <- rbind(df_discount_noise_theta_realprobs_hinoise,
                                                     df_discount_noise_theta_realprobs_hinoise)


df_anchorpruning_hinoise_discount_hilonoise_theta <- select(nll_yaoa_anchorpruning_discount_hilonoise_theta, BIC_hinoise_120_mean, pseudo_Rsquare_1staction_hinoise_120_mean, model, age, ID)
df_anchorpruning_hinoise_discount_hilonoise_theta$noise <- NULL
df_anchorpruning_hinoise_discount_hilonoise_theta$noise <- 'high'
df_anchorpruning_lonoise_discount_hilonoise_theta <- select(nll_yaoa_anchorpruning_discount_hilonoise_theta, BIC_lonoise_120_mean, pseudo_Rsquare_1staction_lonoise_120_mean, model, age, ID)
df_anchorpruning_lonoise_discount_hilonoise_theta$noise <- NULL
df_anchorpruning_lonoise_discount_hilonoise_theta$noise <- 'low'
setnames(df_anchorpruning_hinoise_discount_hilonoise_theta, old=c("BIC_hinoise_120_mean","pseudo_Rsquare_1staction_hinoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
setnames(df_anchorpruning_lonoise_discount_hilonoise_theta, old=c("BIC_lonoise_120_mean","pseudo_Rsquare_1staction_lonoise_120_mean"), 
         new=c("BIC_noise_120_mean", "pseudo_Rsquare_1staction_noise_120_mean"))
df_anchorpruning_hilonoise <- rbind(df_anchorpruning_hinoise_discount_hilonoise_theta, df_anchorpruning_lonoise_discount_hilonoise_theta)



# Comparison between models:

#gp_modelcomp_nll <- ggplot(data = nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=nll_1staction_120_mean, color=model, fill=model, group=model)) +
gp_modelcomp_nll <- ggplot(data = nll_yaoa_comp_systematic, aes(x=age, y=nll_1staction_120_mean, color=model, fill=model, group=model)) +    
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  #scale_fill_manual(values = myColors) +
  #scale_color_manual(values = myColors) +  
  #geom_segment(aes(x=0.7, y=67, xend=1.0, yend=67), color='black', size=1) + 
  #annotate("text", x = 0.85, y = 69, label = '*', size=6) +  
  #geom_segment(aes(x=0.7, y=72, xend=1.3, yend=72), color='black', size=1) + 
  #annotate("text", x = 1.0, y = 74, label = '***', size=6) +  
  #geom_segment(aes(x=0.78, y=72, xend=1.22, yend=72), color='black', size=1) + 
  #annotate("text", x = 1.0, y = 74, label = '***', size=6) +  
  #,subtitle = '(*p<.05, **p<.01, ***p<.001)') +
  ylab("NLL") + xlab('Age group' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_nll)
#imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_top3_col.png")
imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_systematic_col.png")
ggsave(imageFile)

# Caution - Currently, in the "ignore high noise" model, all miniblocks are declared as "low noise"!
# Therefore, the variable nll_1staction_lonoise_120_mean is identical to nll_1staction_120_mean,
# and nll_1staction_hinoise_120_mean contains only zeros!!!
#gp_modelcomp_nll_lonoise <- ggplot(data = nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=nll_1staction_lonoise_120_mean, color=model, fill=model, group=model)) +
gp_modelcomp_nll_lonoise <- ggplot(data = nll_yaoa_comp_systematic, aes(x=age, y=nll_1staction_lonoise_120_mean, color=model, fill=model, group=model)) +          
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(values = myColors) +
  scale_color_manual(values = myColors) +  
  ylab("NLL") + xlab('Age group' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) +
  labs(title = 'Low noise') 
plot(gp_modelcomp_nll_lonoise)
#imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_top3_lonoise.png")
imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_systematic_lonoise.png")
ggsave(imageFile)

aggregate(nll_yaoa_modelcomp_zerocost_top3$BIC_120_mean, list(nll_yaoa_modelcomp_zerocost_top3$model, nll_yaoa_modelcomp_zerocost_top3$age), FUN=mean, na.rm=TRUE)
aggregate(nll_yaoa_comp_systematic$BIC_120_mean, list(nll_yaoa_comp_systematic$model, nll_yaoa_comp_systematic$age), FUN=mean, na.rm=TRUE) 



#gp_modelcomp_nll_hinoise <- ggplot(data = nll_yaoa_modelcomp_5models, aes(x=age, y=nll_1staction_hinoise_120_mean, color=model, fill=model, group=model)) +
#gp_modelcomp_nll_hinoise <- ggplot(data = nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=nll_1staction_hinoise_120_mean, color=model, fill=model, group=model)) +
gp_modelcomp_nll_hinoise <- ggplot(data = nll_yaoa_comp_systematic, aes(x=age, y=nll_1staction_hinoise_120_mean, color=model, fill=model, group=model)) +        
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  #scale_fill_manual(values = myColors) +
  #scale_color_manual(values = myColors) +  
  ylab("NLL") + xlab('Age group' ) +
  #geom_segment(aes(x=1.78, y=140, xend=2.22, yend=140), color='black', size=1) + 
  #annotate("text", x = 2.0, y = 142, label = '**', size=6) +    
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) +
  labs(title = 'High noise') 
plot(gp_modelcomp_nll_hinoise)
#imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_top3_hinoise.png")
imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_systematic_hinoise.png")
ggsave(imageFile)

#anova_nll_models_top3 <- aov_ez(id="ID", dv="nll_1staction_120_mean", nll_yaoa_modelcomp_zerocost_top3, type="III", 
#                                                         within=c("model"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
#summary(anova_nll_models_top3)
#emmeans(anova_nll_models_top3, specs = pairwise ~ model|age)
#petasq(anova_nll_models_top3, 'age')
#petasq(anova_nll_models_top3, 'model')
#petasq(anova_nll_models_top3, 'age:model')



#gp_modelcomp_bic <- ggplot(data =  nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=BIC_120_mean, color=model, fill=model, group=model)) +  
gp_modelcomp_bic <- ggplot(data =  nll_yaoa_comp_systematic, aes(x=age, y=BIC_120_mean, color=model, fill=model, group=model)) +    
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  #scale_fill_manual(labels=c('Ignore high noise \n + discounting', 'Default \n','Uncertainty \n discounting'), values = myColors) +
  #scale_color_manual(labels=c('Ignore high noise \n + discounting', 'Default \n','Uncertainty \n discounting'), values = myColors) +  
  #scale_fill_manual(labels=c('Anchor pruning', 
  #                           'Anchor pruning \n discounting',
  #                           'Discounting \n learned probs.',
  #                           'Default model',
  #                           'Discounting \n ignore high noise'), values = myColors) +
  #scale_color_manual(labels=c('Anchor pruning', 
  #                            'Anchor pruning \n discounting',
  #                            'Discounting \n learned probs.',
  #                            'Default model',
  #                            'Discounting \n ignore high noise'), values = myColors) +  
  #annotate("text", x = 0.825, y = 152, label = '**', size=6) +  
  #geom_segment(aes(x=0.7, y=150, xend=0.95, yend=150), color='black', size=1) + 
  #annotate("text", x = 1.175, y = 152, label = '**', size=6) +  
  #geom_segment(aes(x=1.05, y=150, xend=1.3, yend=150), color='black', size=1) + 
  #annotate("text", x = 1.0, y = 165, label = 'n.s.', size=6) +  
  #geom_segment(aes(x=0.7, y=160, xend=1.3, yend=160), color='black', size=1) + 
  #annotate("text", x = 1.825, y = 142, label = '*', size=6) +  
  #geom_segment(aes(x=1.7, y=140, xend=1.95, yend=140), color='black', size=1) + 
  #annotate("text", x = 2.175, y = 142, label = '*', size=6) +  
  #geom_segment(aes(x=2.05, y=140, xend=2.3, yend=140), color='black', size=1) + 
  #annotate("text", x = 2.0, y = 155, label = 'n.s.', size=6) +  
  #geom_segment(aes(x=1.7, y=150, xend=2.3, yend=150), color='black', size=1) + 
  ylab("BIC") + xlab('Age group' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_bic)
#imageFile <- file.path(imageDirectory,"model_comparison_BIC_zerocost_YAOA_col_top3.png")
imageFile <- file.path(imageDirectory,"model_comparison_BIC_zerocost_YAOA_col_systematic.png")
ggsave(imageFile)

# Output mean values:
#aggregate(nll_yaoa_modelcomp_5models$BIC_120_mean, list(nll_yaoa_modelcomp_5models$model, nll_yaoa_modelcomp_5models$age), FUN=mean, na.rm=TRUE) 
aggregate(nll_yaoa_comp_systematic$BIC_120_mean, list(nll_yaoa_comp_systematic$model, nll_yaoa_comp_systematic$age), FUN=mean, na.rm=TRUE) 
aggregate(nll_yaoa_comp_all$BIC_120_mean, list(nll_yaoa_comp_all$model, nll_yaoa_comp_all$age), FUN=mean, na.rm=TRUE) 




gp_modelcomp_bic_all <- ggplot(data =  nll_yaoa_comp_all, aes(x=age, y=BIC_120_mean, color=model, fill=model, group=model)) +    
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  #scale_fill_manual(labels=c('Ignore high noise \n + discounting', 'Default \n','Uncertainty \n discounting'), values = myColors) +
  #scale_color_manual(labels=c('Ignore high noise \n + discounting', 'Default \n','Uncertainty \n discounting'), values = myColors) +  
  #scale_fill_manual(labels=c('Anchor pruning', 
  #                           'Anchor pruning \n discounting',
  #                           'Discounting \n learned probs.',
  #                           'Default model',
  #                           'Discounting \n ignore high noise'), values = myColors) +
  #scale_color_manual(labels=c('Anchor pruning', 
  #                            'Anchor pruning \n discounting',
  #                            'Discounting \n learned probs.',
  #                            'Default model',
#                            'Discounting \n ignore high noise'), values = myColors) +  
ylab("BIC") + xlab('Age group' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_bic_all)
imageFile <- file.path(imageDirectory,"model_comparison_BIC_zerocost_YAOA_col_all.png")
ggsave(imageFile)

gp_modelcomp_bic_hinoise_all <- ggplot(data =  nll_yaoa_comp_all, aes(x=age, y=BIC_hinoise_120_mean, color=model, fill=model, group=model)) +    
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  labs(title = 'High noise') +
  ylab("BIC") + xlab('Age group' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) +
  coord_cartesian(ylim = c(0, 80)) 
plot(gp_modelcomp_bic_hinoise_all)
imageFile <- file.path(imageDirectory,"model_comparison_BIC_hinoise_YAOA_col_all.png")
ggsave(imageFile)

gp_modelcomp_bic_lonoise_all <- ggplot(data =  nll_yaoa_comp_all, aes(x=age, y=BIC_lonoise_120_mean, color=model, fill=model, group=model)) +    
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  labs(title = 'Low noise') +
  ylab("BIC") + xlab('Age group' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) +
  coord_cartesian(ylim = c(0, 80)) 
plot(gp_modelcomp_bic_lonoise_all)
imageFile <- file.path(imageDirectory,"model_comparison_BIC_lonoise_YAOA_col_all.png")
ggsave(imageFile)


anova_bic_models_top3 <- aov_ez(id="ID", dv="BIC_120_mean", nll_yaoa_modelcomp_zerocost_top3, type="III", 
                           within=c("model"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_bic_models_top3)
emmeans(anova_bic_models_top3, specs = pairwise ~ model|age)
petasq(anova_bic_models_top3, 'age')
petasq(anova_bic_models_top3, 'model')
petasq(anova_bic_models_top3, 'age:model')

anova_bic_hinoise_models_top3 <- aov_ez(id="ID", dv="BIC_hinoise_120_mean", nll_yaoa_modelcomp_zerocost_top3, type="III", 
                                within=c("model"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_bic_hinoise_models_top3)
emmeans(anova_bic_hinoise_models_top3, specs = pairwise ~ model|age)

anova_bic_lonoise_models_top3 <- aov_ez(id="ID", dv="BIC_lonoise_120_mean", nll_yaoa_modelcomp_zerocost_top3, type="III", 
                                        within=c("model"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_bic_lonoise_models_top3)
emmeans(anova_bic_lonoise_models_top3, specs = pairwise ~ model|age)

# TODO: Joint analysis including age, noise condition, and model
nll_yaoa_modelcomp_zerocost_top3_lonoise <- select(nll_yaoa_modelcomp_zerocost_top3, BIC_lonoise_120_mean, ID, age, model, nll_1staction_lonoise_120_mean)
nll_yaoa_modelcomp_zerocost_top3_lonoise$noise <- "low"
setnames(nll_yaoa_modelcomp_zerocost_top3_lonoise, old=c('BIC_lonoise_120_mean', 'nll_1staction_lonoise_120_mean'), 
                                                   new=c('BIC_noise_120_mean', 'nll_1staction_noise_120_mean'))
nll_yaoa_modelcomp_zerocost_top3_hinoise <- select(nll_yaoa_modelcomp_zerocost_top3, BIC_hinoise_120_mean, ID, age, model, nll_1staction_hinoise_120_mean)
nll_yaoa_modelcomp_zerocost_top3_hinoise$noise <- "high"
setnames(nll_yaoa_modelcomp_zerocost_top3_hinoise, old=c('BIC_hinoise_120_mean', 'nll_1staction_hinoise_120_mean'), 
                                                   new=c('BIC_noise_120_mean', 'nll_1staction_noise_120_mean'))
nll_yaoa_modelcomp_zerocost_top3_noise <- rbind(nll_yaoa_modelcomp_zerocost_top3_lonoise, nll_yaoa_modelcomp_zerocost_top3_hinoise)

model_names <- unique(nll_yaoa_modelcomp_zerocost_top3_noise$model)

anova_bic_noise_models_top2 <- aov_ez(id="ID", dv="BIC_noise_120_mean", subset(nll_yaoa_modelcomp_zerocost_top3_noise, model!=model_names[3]), type="III", 
                                      within=c("model", "noise"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))


anova_bic_noise_models_top3 <- aov_ez(id="ID", dv="BIC_noise_120_mean", nll_yaoa_modelcomp_zerocost_top3_noise, type="III", 
                                        within=c("model", "noise"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_bic_noise_models_top3)
emmeans(anova_bic_noise_models_top3, specs = pairwise ~ model|noise|age)
emmeans(anova_bic_noise_models_top3, specs = pairwise ~ model|age)
emmeans(anova_bic_noise_models_top3, specs = pairwise ~ model|noise)


#nll_yaoa_modelcomp_zerocost_top3_noise$bayes_factor <- NULL
# The Bayes factor is the ratio of the model evidences (=probabilities of the data given the model).
# NLL is the negative log-likelihood -> exp(-nll) gives the raw probabilities/model evidences.
# As the ratios of proailities can be very large or very small, it is convienient to look at log(Bayes factor).

# Default model (6) vs. noise discounting (9):
setDT(nll_yaoa_modelcomp_zerocost_top3_noise)[model==model_names[1], log_bayes_factor := log((exp(-subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[2])$nll_1staction_noise_120_mean)
                                                                                      / exp(-subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1])$nll_1staction_noise_120_mean)))]
nll_yaoa_modelcomp_zerocost_top3_noise$bayes_factor_logLik <- NULL
setDT(nll_yaoa_modelcomp_zerocost_top3_noise)[model==model_names[1], bayes_factor_logLik := (subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1])$nll_1staction_noise_120_mean
                                                                                      - subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[2])$nll_1staction_noise_120_mean)]
nll_yaoa_modelcomp_zerocost_top3_noise$delta_BIC <- NULL
setDT(nll_yaoa_modelcomp_zerocost_top3_noise)[model==model_names[1], delta_BIC := (subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1])$BIC_noise_120_mean
                                                                                             - subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[2])$BIC_noise_120_mean)]

# Default model (6) vs. ignoring high noise (17):
setDT(nll_yaoa_modelcomp_zerocost_top3_noise)[model==model_names[3], log_bayes_factor := log((exp(-subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[3])$nll_1staction_noise_120_mean)
                                                                                              / exp(-subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1])$nll_1staction_noise_120_mean)))]
setDT(nll_yaoa_modelcomp_zerocost_top3_noise)[model==model_names[3], bayes_factor_logLik := (subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1])$nll_1staction_noise_120_mean
                                                                                             - subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[3])$nll_1staction_noise_120_mean)]
setDT(nll_yaoa_modelcomp_zerocost_top3_noise)[model==model_names[3], delta_BIC := (subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1])$BIC_noise_120_mean
                                                                                   - subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[3])$BIC_noise_120_mean)]



gp_modelcomp_bf <- ggplot(data =  subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1]), aes(x=age, y=log_bayes_factor, color=noise, fill=noise, group=noise)) +  
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(labels=c('High noise', 'Low noise'), values = myColors) +
  scale_color_manual(labels=c('High noise', 'Low noise'), values = myColors) +  
  ylab("Log Bayes factor \n (Ratio of model evidence)") + xlab('Age group' ) +
  labs(title='Model comparison', subtitle='Values > 0 denote higher evidence for discounting') + 
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_bf)
imageFile <- file.path(imageDirectory,"model_comparison_BayesFactor_YAOA_col_top3.png")
ggsave(imageFile)

gp_modelcomp_deltaBIC_default_vs_ignoreHinoise <- ggplot(data =  subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1]), aes(x=age, y=delta_BIC, color=noise, fill=noise, group=noise)) +  
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(labels=c('High noise', 'Low noise'), values = myColors) +
  scale_color_manual(labels=c('High noise', 'Low noise'), values = myColors) +  
  ylab("Delta BIC \n (Ratio of model evidence)") + xlab('Age group' ) +
  labs(title='Model comparison', subtitle='Values > 0 denote higher evidence for discounting') + 
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_deltaBIC_default_vs_ignoreHinoise)

gp_modelcomp_deltaBIC_default_vs_ignoreHinoise_discount <- ggplot(data =  subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[3]), aes(x=age, y=delta_BIC, color=noise, fill=noise, group=noise)) +  
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(labels=c('High noise', 'Low noise'), values = myColors) +
  scale_color_manual(labels=c('High noise', 'Low noise'), values = myColors) +  
  ylab("Delta BIC \n (Ratio of model evidence)") + xlab('Age group' ) +
  labs(title='Model comparison', subtitle='Values > 0 denote higher evidence for discounting') + 
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_deltaBIC_default_vs_ignoreHinoise_discount)

t.test(subset(nll_yaoa_modelcomp_zerocost_top3_noise, (model==model_names[1])*(age=='YA')*(noise=='high')==1)$log_bayes_factor)
t.test(subset(nll_yaoa_modelcomp_zerocost_top3_noise, (model==model_names[1])*(age=='YA')*(noise=='low')==1)$log_bayes_factor)
t.test(subset(nll_yaoa_modelcomp_zerocost_top3_noise, (model==model_names[1])*(age=='OA')*(noise=='high')==1)$log_bayes_factor)
t.test(subset(nll_yaoa_modelcomp_zerocost_top3_noise, (model==model_names[1])*(age=='OA')*(noise=='low')==1)$log_bayes_factor)

aggregate(nll_yaoa_modelcomp_zerocost_top3_noise$log_bayes_factor, list(nll_yaoa_modelcomp_zerocost_top3_noise$noise, nll_yaoa_modelcomp_zerocost_top3_noise$age), FUN=mean, na.rm=TRUE)
aggregate(nll_yaoa_modelcomp_zerocost_top3_noise$delta_BIC, list(nll_yaoa_modelcomp_zerocost_top3_noise$noise, nll_yaoa_modelcomp_zerocost_top3_noise$age), FUN=mean, na.rm=TRUE)

gp_modelcomp_bf_logLik <- ggplot(data =  subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1]), aes(x=age, y=bayes_factor_logLik, color=noise, fill=noise, group=noise)) +  
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(labels=c('High noise', 'Low noise'), values = myColors) +
  scale_color_manual(labels=c('High noise', 'Low noise'), values = myColors) +  
  ylab("Log Bayes factor \n (Ratio of model evidence)") + xlab('Age group' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_bf_logLik)


#ggpaired(nll_yaoa_modelcomp_zerocost_choice2, 
#ggpaired(subset(nll_yaoa_modelcomp_zerocost_top3, age=='YA'),          
ggpaired(subset(nll_yaoa_modelcomp_zerocost_top3, age=='OA'), 
         x="model", y="BIC_120_mean",
         color="age", id="ID", palette="npg")

#ggpaired(nll_yaoa_modelcomp_zerocost_choice2, 
#ggpaired(nll_yaoa_modelcomp_zerocost_top3,
#ggpaired(subset(nll_yaoa_modelcomp_zerocost_top3, age=='YA'),                  
ggpaired(subset(nll_yaoa_modelcomp_zerocost_top3, age=='OA'),          
         x="model", y="BIC_hinoise_120_mean",
         color="age", id="ID", palette="npg")


#gp_modelcomp_bic_hinoise <- ggplot(data =  nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=BIC_hinoise_120_mean, color=model, fill=model, group=model)) +
gp_modelcomp_bic_hinoise <- ggplot(data =  nll_yaoa_comp_systematic, aes(x=age, y=BIC_hinoise_120_mean, color=model, fill=model, group=model)) +                               
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  #scale_fill_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +
  #scale_color_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +  
  #annotate("text", x = 1.0, y = 82, label = '**', size=6) +  
  #geom_segment(aes(x=0.78, y=80, xend=1.22, yend=80), color='black', size=1) + 
  #annotate("text", x = 2.0, y = 82, label = '***', size=6) +  
  #geom_segment(aes(x=1.78, y=80, xend=2.22, yend=80), color='black', size=1) +     
  ylab("BIC") + xlab('Age group' ) +
  labs(title = 'High noise') +  
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_bic_hinoise)
#imageFile <- file.path(imageDirectory,"model_comparison_BIC_hinoise_zerocost_YAOA_col_5models.png")
#imageFile <- file.path(imageDirectory,"model_comparison_BIC_hinoise_zerocost_YAOA_col_top3.png")
imageFile <- file.path(imageDirectory,"model_comparison_BIC_hinoise_zerocost_YAOA_col_sytematic.png")
ggsave(imageFile)

#gp_modelcomp_bic_lonoise <- ggplot(data =  nll_yaoa_modelcomp_5models, aes(x=age, y=BIC_lonoise_120_mean, color=model, fill=model, group=model)) +
gp_modelcomp_bic_lonoise <- ggplot(data =  nll_yaoa_comp_systematic, aes(x=age, y=BIC_lonoise_120_mean, color=model, fill=model, group=model)) +                             
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  #scale_fill_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +
  #scale_color_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +  
  #annotate("text", x = 1.0, y = 82, label = '**', size=6) +  
  #geom_segment(aes(x=0.78, y=80, xend=1.22, yend=80), color='black', size=1) + 
  #annotate("text", x = 2.0, y = 83, label = 'n.s.', size=6) +  
  #geom_segment(aes(x=1.78, y=80, xend=2.22, yend=80), color='black', size=1) +     
  ylab("BIC") + xlab('Age group' ) +
  labs(title = 'Low noise') +  
  #annotate("text", x = 1, y = 10500, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='default']) ), size=6) +  
  #annotate("text", x = 2, y = 10800, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='nolearning']) ), size=6) +    
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_bic_lonoise)
#imageFile <- file.path(imageDirectory,"model_comparison_BIC_lonoise_zerocost_YAOA_col_11models.png")
#imageFile <- file.path(imageDirectory,"model_comparison_BIC_lonoise_zerocost_YAOA_col_3models.png")
#imageFile <- file.path(imageDirectory,"model_comparison_BIC_lonoise_zerocost_YAOA_col_top3.png")
imageFile <- file.path(imageDirectory,"model_comparison_BIC_lonoise_zerocost_YAOA_col_systematic.png")
ggsave(imageFile)

gp_modelcomp_nll_lonoise <- ggplot(data =  nll_yaoa_modelcomp_5models, aes(x=age, y=nll_1staction_lonoise_120_mean, color=model, fill=model, group=model)) +                         
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(values = myColors) +
  scale_color_manual(values = myColors) +  
  #geom_segment(aes(x=1.78, y=140, xend=2.22, yend=140), color='black', size=1) + 
  #annotate("text", x = 2.0, y = 142, label = '**', size=6) +  
  ylab("NLL") + xlab('Age group' ) +
  labs(title = 'Low noise') +  
  #annotate("text", x = 1, y = 10500, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='default']) ), size=6) +  
  #annotate("text", x = 2, y = 10800, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='nolearning']) ), size=6) +    
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_nll_lonoise)



gp_def_rho_noise <- ggplot(data = df_def_noise_0cost, aes(x=noise, y=pseudo_Rsquare_1staction_noise_120_mean,color=age,group=age,fill=age)) + 
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') + 
  labs(title = 'Default model')+ 
  #,subtitle = '(*p<.05, **p<.01, ***p<.001)') +
  #geom_signif(comparisons = list(c("high", "low")), map_signif_level=TRUE,
  #            test = t.test, color = 'black',
  #            test.args = list(alternative = "two.sided", var.equal = FALSE,
  #                             paired=TRUE) ) +
  geom_signif(
    y_position = c(0.55, 0.45), xmin = c(1.25, 0.75), xmax = c(2.25, 1.75),
    annotation = c("***", "n.s."), tip_length = 0.005, textsize = 7, size = 1, color='black') + 
  ylab(expression(paste('Model fit (',rho^2,')'))) + xlab('Noise condition' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # 
  theme(legend.text = element_text(size = 20)) +
  ylim(0, 0.8)  
plot(gp_def_rho_noise)
imageFile <- file.path(imageDirectory,"model_default_rho_YAOA.png")
ggsave(imageFile)




gp_def_bic_noise <- ggplot(data = df_def_noise_0cost, aes(x=noise, y=BIC_noise_120_mean, color=age,group=age,fill=age)) + 
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') + 
  labs(title = 'Default model')+ 
  #,subtitle = '(*p<.05, **p<.01, ***p<.001)') +
  #geom_signif(comparisons = list(c("high", "low")), map_signif_level=TRUE,
  #            test = t.test, color = 'black',
  #            test.args = list(alternative = "two.sided", var.equal = FALSE,
  #                             paired=TRUE) ) +
  geom_signif(
    y_position = c(80, 90), xmin = c(1.25, 0.75), xmax = c(2.25, 1.75),
    annotation = c("***", "n.s."), tip_length = 0.005, textsize = 7, size = 1, color='black') + 
  ylab(expression(paste('Model fit (BIC)'))) + xlab('Noise condition' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # 
  theme(legend.text = element_text(size = 20)) +
  ylim(0, 95)  
plot(gp_def_bic_noise)
imageFile <- file.path(imageDirectory,"model_default_rho_YAOA.png")
ggsave(imageFile)

anova_bic_def_noise <- aov_ez(id="ID", dv="BIC_noise_120_mean", df_def_noise_0cost, type="III", 
                                      within=c("noise"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_bic_def_noise)
#capture.output(anova(anova_rho_default_0cost_noise), file="Plots/modelfit/anova_output.txt")
emmeans(anova_bic_def_noise, specs = pairwise ~ noise|age)


anova_rho_default_0cost_noise <- aov_ez(id="ID", dv="pseudo_Rsquare_1staction_noise_120_mean", df_default_0cost_noise, type="III", 
                        within=c("noise"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_rho_default_0cost_noise)
capture.output(anova(anova_rho_default_0cost_noise), file="Plots/modelfit/anova_output.txt")
emmeans(anova_rho_default_0cost_noise, specs = pairwise ~ noise|age)

petasq(anova_rho_default_0cost_noise, 'age')
petasq(anova_rho_default_0cost_noise, 'noise')
petasq(anova_rho_default_0cost_noise, 'age:noise')


#gp_default_0cost_rho_noise <- ggplot(data = df_default_0cost_noise, aes(x=age, y=pseudo_Rsquare_1staction_noise_120_mean, color=noise, group=noise, fill=noise)) +
gp_default_0cost_rho_noise <- ggplot(data = df_default_0cost_noise, aes(x=noise, y=pseudo_Rsquare_1staction_noise_120_mean, color=age, group=age, fill=age)) +   
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') + 
  labs(title = 'Default model')+ 
  #,subtitle = '(*p<.05, **p<.01, ***p<.001)') +
  #geom_signif(comparisons = list(c("high", "low")), map_signif_level=TRUE,
  #            test = t.test, color = 'black',
  #            test.args = list(alternative = "two.sided", var.equal = FALSE,
  #                             paired=TRUE) ) +
  geom_signif(
    y_position = c(0.55, 0.45), xmin = c(1.25, 0.75), xmax = c(2.25, 1.75),
    annotation = c("***", "n.s."), tip_length = 0.005, textsize = 7, size = 1, color='black') + 
  ylab(expression(paste('Model fit (',rho^2,')'))) + xlab('Noise condition' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # 
  theme(legend.text = element_text(size = 20)) +
  ylim(0, 0.8)  
plot(gp_default_0cost_rho_noise)
imageFile <- file.path(imageDirectory,"model_default_zerocost_rho_YAOA.png")
ggsave(imageFile)



anova_rho_noisedisc_0cost_theta_noise <- aov_ez(id="ID", dv="pseudo_Rsquare_1staction_noise_120_mean", df_noisedisc_0cost_theta_noise, type="III", 
                                                   within=c("noise"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_rho_noisedisc_0cost_theta_noise)
emmeans(anova_rho_noisedisc_0cost_theta_noise, specs = pairwise ~ noise|age)
petasq(anova_rho_noisedisc_0cost_theta_noise, 'age')
petasq(anova_rho_noisedisc_0cost_theta_noise, 'noise')
petasq(anova_rho_noisedisc_0cost_theta_noise, 'age:noise')


gp_noisedisc_0cost_theta_noise <- ggplot(data = df_noisedisc_0cost_theta_noise, aes(x=noise, y=pseudo_Rsquare_1staction_noise_120_mean, color=age, group=age, fill=age)) +   
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') + 
  labs(title = 'Model discount noise zero cost theta')+ 
  #,subtitle = '(*p<.05, **p<.01, ***p<.001)') +
  #geom_signif(comparisons = list(c("high", "low")), map_signif_level=TRUE,
  #            test = t.test, color = 'black',
  #            test.args = list(alternative = "two.sided", var.equal = FALSE,
  #                             paired=TRUE) ) +
  geom_signif(
    y_position = c(0.55, 0.45), xmin = c(1.25, 0.75), xmax = c(2.25, 1.75),
    annotation = c("***", "n.s."), tip_length = 0.005, textsize = 7, size = 1, color='black') + 
  ylab(expression(paste('Model fit (',rho^2,')'))) + xlab('Noise condition' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # 
  theme(legend.text = element_text(size = 20)) +
  ylim(0, 0.8)  
plot(gp_noisedisc_0cost_theta_noise)
imageFile <- file.path(imageDirectory,"model_noisedisc_0cost_theta_rho_YAOA.png")
ggsave(imageFile)




anova_rho_hilonoisedisc_0cost_theta_noise <- aov_ez(id="ID", dv="pseudo_Rsquare_1staction_noise_120_mean", df_hilonoisedisc_0cost_theta_noise, type="III", 
                                                within=c("noise"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_rho_hilonoisedisc_0cost_theta_noise)
emmeans(anova_rho_hilonoisedisc_0cost_theta_noise, specs = pairwise ~ noise|age)
petasq(anova_rho_hilonoisedisc_0cost_theta_noise, 'age')
petasq(anova_rho_hilonoisedisc_0cost_theta_noise, 'noise')
petasq(anova_rho_hilonoisedisc_0cost_theta_noise, 'age:noise')


gp_hilonoisedisc_0cost_theta_noise <- ggplot(data = df_hilonoisedisc_0cost_theta_noise, aes(x=noise, y=pseudo_Rsquare_1staction_noise_120_mean, color=age, group=age, fill=age)) +   
#gp_hilonoisedisc_0cost_theta_noise <- ggplot(data = df_hilonoisedisc_0cost_theta_noise, aes(x=age, y=pseudo_Rsquare_1staction_noise_120_mean, color=noise, group=noise, fill=noise)) +     
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') + 
  labs(title = 'Model discount hiLoNoise zero cost theta')+ 
  #,subtitle = '(*p<.05, **p<.01, ***p<.001)') +
  #geom_signif(comparisons = list(c("high", "low")), map_signif_level=TRUE,
  #            test = t.test, color = 'black',
  #            test.args = list(alternative = "two.sided", var.equal = FALSE,
  #                             paired=TRUE) ) +
  geom_signif(
    y_position = c(0.55, 0.45), xmin = c(1.25, 0.75), xmax = c(2.25, 1.75),
    annotation = c("***", "n.s."), tip_length = 0.005, textsize = 7, size = 1, color='black') + 
  ylab(expression(paste('Model fit (',rho^2,')'))) + xlab('Noise condition' ) +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # 
  theme(legend.text = element_text(size = 20)) +
  ylim(0, 0.8)  
plot(gp_hilonoisedisc_0cost_theta_noise)
imageFile <- file.path(imageDirectory,"model_hilonoisedisc_zerocost_theta_rho_YAOA.png")
ggsave(imageFile)

# Model comparison:
df_modelcomp_zerocost <- rbind(df_default_0cost_noise, df_noisedisc_0cost_theta_noise, df_hilonoisedisc_0cost_theta_noise)
anova_modelcomp_zerocost <- aov_ez(id="ID", dv="pseudo_Rsquare_1staction_noise_120_mean", df_modelcomp_zerocost, type="III", 
                                                    within=c("noise", "model"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_modelcomp_zerocost)
emmeans(anova_modelcomp_zerocost, specs = pairwise ~ model|noise|age)
emmeans(anova_modelcomp_zerocost, specs = pairwise ~ noise|model|age)

