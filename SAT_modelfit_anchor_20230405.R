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

nll_ya_noisedisc_0cost_theta <- read.csv('Results_inference_group_discount_Noise_theta_0cost_20220706/NLL_ya_group_discount_Noise_theta_0cost.csv')
nll_oa_noisedisc_0cost_theta <- read.csv('Results_inference_group_discount_Noise_theta_0cost_20220706/NLL_oa_group_discount_Noise_theta_0cost.csv')
elbo_ya_noisedisc_0cost_theta <- read.csv('Results_inference_group_discount_Noise_theta_0cost_20220706/ELBO_ya_group_discount_Noise_theta_0cost.csv')
elbo_oa_noisedisc_0cost_theta <- read.csv('Results_inference_group_discount_Noise_theta_0cost_20220706/ELBO_oa_group_discount_Noise_theta_0cost.csv')

nll_ya_hilonoisedisc_0cost_theta <- read.csv('Results_inference_group_discount_hiLoNoise_theta_0cost_20220706/NLL_ya_group_discount_hiLoNoise_theta_0cost.csv')
nll_oa_hilonoisedisc_0cost_theta <- read.csv('Results_inference_group_discount_hiLoNoise_theta_0cost_20220706/NLL_oa_group_discount_hiLoNoise_theta_0cost.csv')
elbo_ya_hilonoisedisc_0cost_theta <- read.csv('Results_inference_group_discount_hiLoNoise_theta_0cost_20220706/ELBO_ya_group_discount_hiLoNoise_theta_0cost.csv')
elbo_oa_hilonoisedisc_0cost_theta <- read.csv('Results_inference_group_discount_hiLoNoise_theta_0cost_20220706/ELBO_oa_group_discount_hiLoNoise_theta_0cost.csv')

nll_ya_nolearning_0cost <- read.csv('Results_inference_nonlearning_20220919/NLL_ya_group_nonlearning_0cost.csv')
nll_oa_nolearning_0cost <- read.csv('Results_inference_nonlearning_20220919/NLL_oa_group_nonlearning_0cost.csv')
elbo_ya_nolearning_0cost <- read.csv('Results_inference_nonlearning_20220919/ELBO_ya_group_nonlearning_0cost.csv')
elbo_oa_nolearning_0cost <- read.csv('Results_inference_nonlearning_20220919/ELBO_oa_group_nonlearning_0cost.csv')

nll_ya_noisedisc_theta_ignoreHinoise <- read.csv('Results_discount_Noise_theta_ignoreHinoise/NLL_ya_group_discount_Noise_theta_0cost_ignoreHinoise.csv')
nll_oa_noisedisc_theta_ignoreHinoise <- read.csv('Results_discount_Noise_theta_ignoreHinoise/NLL_oa_group_discount_Noise_theta_0cost_ignoreHinoise.csv')
elbo_ya_noisedisc_theta_ignoreHinoise <- read.csv('Results_discount_Noise_theta_ignoreHinoise/ELBO_ya_group_discount_Noise_theta_0cost_ignoreHinoise.csv')
elbo_oa_noisedisc_theta_ignoreHinoise <- read.csv('Results_discount_Noise_theta_ignoreHinoise/ELBO_oa_group_discount_Noise_theta_0cost_ignoreHinoise.csv')


print(c('ELBO YA default zero cost:', tail(elbo_ya_default_0cost$X0, 1)))
print(c('ELBO YA noisedisc zero cost_theta:', tail(elbo_ya_noisedisc_0cost_theta$X0, 1)))
print(c('ELBO YA hiLoNoisedisc zero cost_theta:', tail(elbo_ya_hilonoisedisc_0cost_theta$X0, 1)))
print(c('ELBO YA nonlearning zero cost:', tail(elbo_ya_nolearning_0cost$X0, 1))) 

#df_elbo <- as.data.frame(c(elbo_ya[1000,]$X0, elbo_ya_nolearning[1000,]$X0))


print(c('ELBO OA default zero cost:', tail(elbo_oa_default_0cost$X0, 1)))
print(c('ELBO OA noisedisc zero cost_theta:', tail(elbo_oa_noisedisc_0cost_theta$X0, 1)))
print(c('ELBO OA hiLoNoisedisc zero cost_theta:', tail(elbo_oa_hilonoisedisc_0cost_theta$X0, 1)))
print(c('ELBO OA nonlearning zero cost:', tail(elbo_oa_nolearning_0cost$X0, 1))) 

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
nll_ya_noisedisc_0cost_theta$ID <- NULL
nll_ya_noisedisc_0cost_theta$ID <- paste('YA', nll_ya_noisedisc_0cost_theta$X, sep="")
nll_oa_noisedisc_0cost_theta$model <- NULL
nll_oa_noisedisc_0cost_theta$model <- "9-noisedisc_zerocost_theta"
nll_oa_noisedisc_0cost_theta$age <- NULL
nll_oa_noisedisc_0cost_theta$age <- "OA"
nll_oa_noisedisc_0cost_theta$ID <- NULL
nll_oa_noisedisc_0cost_theta$ID <- paste('OA', nll_oa_noisedisc_0cost_theta$X, sep="")

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
nll_ya_nolearning_0cost$ID <- NULL
nll_ya_nolearning_0cost$ID <- paste('YA', nll_ya_nolearning_0cost$X, sep="")
nll_oa_nolearning_0cost$model <- NULL
nll_oa_nolearning_0cost$model <- "16-nolearning-zerocost"
nll_oa_nolearning_0cost$age <- NULL
nll_oa_nolearning_0cost$age <- "OA"
nll_oa_nolearning_0cost$ID <- NULL
nll_oa_nolearning_0cost$ID <- paste('OA', nll_oa_nolearning_0cost$X, sep="")


nll_ya_noisedisc_theta_ignoreHinoise$model <- NULL
nll_ya_noisedisc_theta_ignoreHinoise$model <- "17-Noisedisc-theta-ignoreHinoise"
nll_ya_noisedisc_theta_ignoreHinoise$age <- NULL
nll_ya_noisedisc_theta_ignoreHinoise$age <- "YA"
nll_ya_noisedisc_theta_ignoreHinoise$ID <- NULL
nll_ya_noisedisc_theta_ignoreHinoise$ID <- paste('YA', nll_ya_noisedisc_theta_ignoreHinoise$X, sep="")
nll_oa_noisedisc_theta_ignoreHinoise$model <- NULL
nll_oa_noisedisc_theta_ignoreHinoise$model <- "17-Noisedisc-theta-ignoreHinoise"
nll_oa_noisedisc_theta_ignoreHinoise$age <- NULL
nll_oa_noisedisc_theta_ignoreHinoise$age <- "OA"
nll_oa_noisedisc_theta_ignoreHinoise$ID <- NULL
nll_oa_noisedisc_theta_ignoreHinoise$ID <- paste('OA', nll_oa_noisedisc_theta_ignoreHinoise$X, sep="")

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


elbo_yaoa_default_0cost <- rbind(elbo_ya_default_0cost, elbo_oa_default_0cost)
elbo_yaoa_noisedisc_0cost_theta <- rbind(elbo_ya_noisedisc_0cost_theta, elbo_oa_noisedisc_0cost_theta)
elbo_yaoa_hilonoisedisc_0cost_theta <- rbind(elbo_ya_hilonoisedisc_0cost_theta, elbo_oa_hilonoisedisc_0cost_theta)
elbo_yaoa_nolearning_0cost <- rbind(elbo_ya_nolearning_0cost, elbo_oa_nolearning_0cost)
elbo_yaoa_noisedisc_theta_ignoreHinoise <- rbind(elbo_ya_noisedisc_theta_ignoreHinoise, elbo_oa_noisedisc_theta_ignoreHinoise)


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



df_elbo_comp_zerocost_top3 <- rbind(def_elbo_yaoa_default_0cost, elbo_yaoa_noisedisc_0cost_theta, df_elbo_noisedisc_theta_ignoreHinoise)

df_elbo_comp_zerocost_5models <- rbind(elbo_yaoa_hilonoisedisc_0cost_theta,                                         
                                        elbo_yaoa_noisedisc_0cost_theta,
                                        def_elbo_yaoa_default_0cost,
                                        df_elbo_nl_yaoa_0cost,
                                       df_elbo_noisedisc_theta_ignoreHinoise)


nll_yaoa_default_0cost <- rbind(nll_ya_default_0cost, nll_oa_default_0cost)
nll_yaoa_noisedisc_0cost_theta <- rbind(nll_ya_noisedisc_0cost_theta, nll_oa_noisedisc_0cost_theta)
nll_yaoa_hilonoisedisc_0cost_theta <- rbind(nll_ya_hilonoisedisc_0cost_theta, nll_oa_hilonoisedisc_0cost_theta)
nll_yaoa_nolearning_0cost <- rbind(nll_ya_nolearning_0cost, nll_oa_nolearning_0cost)
nll_yaoa_noisedisc_theta_ignoreHinoise <- rbind(nll_ya_noisedisc_theta_ignoreHinoise, nll_oa_noisedisc_theta_ignoreHinoise)

nll_yaoa_default_0cost$subjIDs <- NULL
nll_yaoa_noisedisc_0cost_theta$subjIDs <- NULL
nll_yaoa_hilonoisedisc_0cost_theta$subjIDs <- NULL
nll_yaoa_nolearning_0cost$subjIDs <- NULL
nll_yaoa_noisedisc_theta_ignoreHinoise$subjIDs <- NULL

nll_yaoa_modelcomp_zerocost_top3 <- rbind(nll_yaoa_default_0cost, nll_yaoa_noisedisc_0cost_theta, nll_yaoa_noisedisc_theta_ignoreHinoise)



nll_yaoa_modelcomp_5models <- rbind(nll_yaoa_hilonoisedisc_0cost_theta,
                                    nll_yaoa_noisedisc_0cost_theta,
                                    nll_yaoa_default_0cost,
                                    nll_yaoa_nolearning_0cost,
                                    nll_yaoa_noisedisc_theta_ignoreHinoise)

library(scales)
myColors <- hue_pal()(11) #extract hex color codes for a plot with five elements in ggplot2 
names(myColors) <- unique(nll_yaoa_modelcomp_5models$model)
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")[1:11] # colorblind-friendly

gp_modelcomp_elbo <- ggplot(data = df_elbo_comp_zerocost_top3, aes(x=age, y=ELBO, color=model, fill=model, group=model)) +    
  stat_summary(fun = identity, geom = "bar", position="dodge") + 
  #labs(title = 'YA')+ 
  #,subtitle = '(*p<.05, **p<.01, ***p<.001)') +
  scale_fill_manual(values = myColors) +
  scale_color_manual(values = myColors) +  
  ylab("ELBO") + xlab('Age group' ) +
  #annotate("text", x = 1, y = 10500, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='default']) ), size=6) +  
  #annotate("text", x = 2, y = 10800, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='nolearning']) ), size=6) +    
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_elbo)
imageFile <- file.path(imageDirectory,"model_comparison_ELBO_YAOA_zerocost_top3_col.png")
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

# Comparison between models:

gp_modelcomp_nll <- ggplot(data = nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=nll_1staction_120_mean, color=model, fill=model, group=model)) +  
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(values = myColors) +
  scale_color_manual(values = myColors) +  
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
imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_top3_col.png")
ggsave(imageFile)


gp_modelcomp_nll_lonoise <- ggplot(data = nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=nll_1staction_lonoise_120_mean, color=model, fill=model, group=model)) +        
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
imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_top3_lonoise.png")
ggsave(imageFile)

aggregate(nll_yaoa_modelcomp_zerocost_top3$BIC_120_mean, list(nll_yaoa_modelcomp_zerocost_top3$model, nll_yaoa_modelcomp_zerocost_top3$age), FUN=mean, na.rm=TRUE) 

#gp_modelcomp_nll_hinoise <- ggplot(data = nll_yaoa_modelcomp_5models, aes(x=age, y=nll_1staction_hinoise_120_mean, color=model, fill=model, group=model)) +
gp_modelcomp_nll_hinoise <- ggplot(data = nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=nll_1staction_hinoise_120_mean, color=model, fill=model, group=model)) +      
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(values = myColors) +
  scale_color_manual(values = myColors) +  
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
imageFile <- file.path(imageDirectory,"model_comparison_NLL_zerocost_YAOA_top3_hinoise.png")
ggsave(imageFile)

anova_nll_models_top3 <- aov_ez(id="ID", dv="nll_1staction_120_mean", nll_yaoa_modelcomp_zerocost_top3, type="III", 
                                                         within=c("model"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_nll_models_top3)
emmeans(anova_nll_models_top3, specs = pairwise ~ model|age)
  petasq(anova_nll_models_top3, 'age')
petasq(anova_nll_models_top3, 'model')
petasq(anova_nll_models_top3, 'age:model')


anova_nll_models <- aov_ez(id="ID", dv="nll_1staction_120_mean", nll_yaoa_modelcomp_zerocost_top3, type="III", 
                           within=c("model"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_nll_models)
emmeans(anova_nll_models, specs = pairwise ~ model|age)
petasq(anova_nll_models, 'age')
petasq(anova_nll_models, 'model')
petasq(anova_nll_models, 'age:model')


gp_modelcomp_bic <- ggplot(data =  nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=BIC_120_mean, color=model, fill=model, group=model)) +  
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +
  scale_color_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +  
  annotate("text", x = 1.0, y = 152, label = '***', size=6) +  
  geom_segment(aes(x=0.78, y=150, xend=1.22, yend=150), color='black', size=1) + 
  annotate("text", x = 2.0, y = 142, label = '**', size=6) +  
  geom_segment(aes(x=1.78, y=140, xend=2.22, yend=140), color='black', size=1) +   
  ylab("BIC") + xlab('Age group' ) +
  #annotate("text", x = 1, y = 10500, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='default']) ), size=6) +  
  #annotate("text", x = 2, y = 10800, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='nolearning']) ), size=6) +    
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_bic)
imageFile <- file.path(imageDirectory,"model_comparison_BIC_zerocost_YAOA_col_top3.png")
ggsave(imageFile)

# Output mean values:
aggregate(nll_yaoa_modelcomp_5models$BIC_120_mean, list(nll_yaoa_modelcomp_5models$model, nll_yaoa_modelcomp_5models$age), FUN=mean, na.rm=TRUE) 



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

anova_bic_noise_models_top3 <- aov_ez(id="ID", dv="BIC_noise_120_mean", nll_yaoa_modelcomp_zerocost_top3_noise, type="III", 
                                        within=c("model", "noise"), between = c("age"), print.formula=TRUE, include_aov=TRUE) #, observed=c("AgeGroup"))
summary(anova_bic_noise_models_top3)
emmeans(anova_bic_noise_models_top3, specs = pairwise ~ model|noise|age)
emmeans(anova_bic_noise_models_top3, specs = pairwise ~ model|age)
emmeans(anova_bic_noise_models_top3, specs = pairwise ~ model|noise)

model_names <- unique(nll_yaoa_modelcomp_zerocost_top3_noise$model)
#nll_yaoa_modelcomp_zerocost_top3_noise$bayes_factor <- NULL
# The Bayes factor is the ratio of the model evidences (=probabilities of the data given the model).
# NLL is the negative log-likelihood -> exp(-nll) gives the raw probabilities/model evidences.
# As the ratios of proailities can be very large or very small, it is convienient to look at log(Bayes factor).
setDT(nll_yaoa_modelcomp_zerocost_top3_noise)[model==model_names[1], log_bayes_factor := log((exp(-subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[2])$nll_1staction_noise_120_mean)
                                                                                      / exp(-subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1])$nll_1staction_noise_120_mean)))]

nll_yaoa_modelcomp_zerocost_top3_noise$bayes_factor_logLik <- NULL
setDT(nll_yaoa_modelcomp_zerocost_top3_noise)[model==model_names[1], bayes_factor_logLik := (subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[1])$nll_1staction_noise_120_mean
                                                                                      - subset(nll_yaoa_modelcomp_zerocost_top3_noise, model==model_names[2])$nll_1staction_noise_120_mean)]


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

t.test(subset(nll_yaoa_modelcomp_zerocost_top3_noise, (model==model_names[1])*(age=='YA')*(noise=='high')==1)$log_bayes_factor)
t.test(subset(nll_yaoa_modelcomp_zerocost_top3_noise, (model==model_names[1])*(age=='YA')*(noise=='low')==1)$log_bayes_factor)
t.test(subset(nll_yaoa_modelcomp_zerocost_top3_noise, (model==model_names[1])*(age=='OA')*(noise=='high')==1)$log_bayes_factor)
t.test(subset(nll_yaoa_modelcomp_zerocost_top3_noise, (model==model_names[1])*(age=='OA')*(noise=='low')==1)$log_bayes_factor)

aggregate(nll_yaoa_modelcomp_zerocost_top3_noise$log_bayes_factor, list(nll_yaoa_modelcomp_zerocost_top3_noise$noise, nll_yaoa_modelcomp_zerocost_top3_noise$age), FUN=mean, na.rm=TRUE) 

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
         x="model", y="nll_1staction_120_mean",
         color="age", id="ID", palette="npg")

#ggpaired(nll_yaoa_modelcomp_zerocost_choice2, 
#ggpaired(nll_yaoa_modelcomp_zerocost_top3,
#ggpaired(subset(nll_yaoa_modelcomp_zerocost_top3, age=='YA'),                  
ggpaired(subset(nll_yaoa_modelcomp_zerocost_top3, age=='OA'),          
         x="model", y="nll_1staction_hinoise_120_mean",
         color="age", id="ID", palette="npg")


gp_modelcomp_bic_hinoise <- ggplot(data =  nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=BIC_hinoise_120_mean, color=model, fill=model, group=model)) +                             
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +
  scale_color_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +  
  annotate("text", x = 1.0, y = 82, label = '**', size=6) +  
  geom_segment(aes(x=0.78, y=80, xend=1.22, yend=80), color='black', size=1) + 
  annotate("text", x = 2.0, y = 82, label = '***', size=6) +  
  geom_segment(aes(x=1.78, y=80, xend=2.22, yend=80), color='black', size=1) +     
  ylab("BIC") + xlab('Age group' ) +
  labs(title = 'High noise') +  
  #annotate("text", x = 1, y = 10500, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='default']) ), size=6) +  
  #annotate("text", x = 2, y = 10800, label = as.character( round(df_elbo_comp$ELBO[df_elbo_comp$model=='nolearning']) ), size=6) +    
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x = element_text(face="bold", size=14),
        axis.text.y = element_text(face="bold", size=14),
        title=element_text(face = "bold", size = 16)) + # ,legend.position = 'none'
  theme(legend.text = element_text(size = 20)) 
plot(gp_modelcomp_bic_hinoise)
#imageFile <- file.path(imageDirectory,"model_comparison_BIC_hinoise_zerocost_YAOA_col_5models.png")
imageFile <- file.path(imageDirectory,"model_comparison_BIC_hinoise_zerocost_YAOA_col_top3.png")
ggsave(imageFile)

#gp_modelcomp_bic_lonoise <- ggplot(data =  nll_yaoa_modelcomp_5models, aes(x=age, y=BIC_lonoise_120_mean, color=model, fill=model, group=model)) +
gp_modelcomp_bic_lonoise <- ggplot(data =  nll_yaoa_modelcomp_zerocost_top3, aes(x=age, y=BIC_lonoise_120_mean, color=model, fill=model, group=model)) +                             
  stat_summary(fun = mean, geom = "bar", position="dodge") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2, color='black') +   
  scale_fill_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +
  scale_color_manual(labels=c('Default \n','Uncertainty \n discounting'), values = myColors) +  
  annotate("text", x = 1.0, y = 82, label = '**', size=6) +  
  geom_segment(aes(x=0.78, y=80, xend=1.22, yend=80), color='black', size=1) + 
  annotate("text", x = 2.0, y = 83, label = 'n.s.', size=6) +  
  geom_segment(aes(x=1.78, y=80, xend=2.22, yend=80), color='black', size=1) +     
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
imageFile <- file.path(imageDirectory,"model_comparison_BIC_lonoise_zerocost_YAOA_col_top3.png")
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

