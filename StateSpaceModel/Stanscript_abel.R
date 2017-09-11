

library(rvest); library(dplyr); library(ggplot2); library(rstan); library(reshape2); library(stringr); library(lubridate)
options(mc.cores = parallel::detectCores())

pp <- read.csv("polls_long.csv", fileEncoding = "UTF-8", stringsAsFactors = FALSE)


#### Fix polls with 0 votes for "Andre" #####
zeropolls <- unique(pp$maling_files_link[which(pp$prosent==0)])
zeropollsdat <- pp[pp$maling_files_link %in% zeropolls, ]
pp <- pp[!pp$maling_files_link %in% zeropolls, ]

zeropollsdat$N <- zeropollsdat$N + 1
zeropollsdat[which(zeropollsdat$prosent==0),"stemmer"] <- 1
zeropollsdat$prosent2 <- zeropollsdat$stemmer/zeropollsdat$N * 100
zeropollsdat$prosent <- ifelse(is.na(zeropollsdat$prosent2)==FALSE, zeropollsdat$prosent2, zeropollsdat$prosent)
zeropollsdat$prosent2 <- NULL
zeropollsdat$prosent[which(zeropollsdat$prosent==0)] <- mean(zeropollsdat$prosent[which(zeropollsdat$stemmer==1)])
pp <- rbind(pp, zeropollsdat)


rm(zeropollsdat, zeropolls)

#####   Get different errors      

pp$binomial_error <- sqrt((1/pp$N)*(pp$stemmer/pp$N)*(1-(pp$stemmer/pp$N)))*100
pp$prop <- pp$stemmer/pp$N
pp$MoE <- (1.96*sqrt( (pp$prop*(1-pp$prop)) / pp$N ))*100
pp$hus <- gsub("(.+?)(/.*)", "\\1", pp$Måling)

pp$sigma2 <- NA
for(i in 1:nrow(pp)){
  pp$sigma2[i] <- ifelse(is.na(pp$N[i])==FALSE, sd(c(rep(1, pp$stemmer[i]), rep(0, pp$N[i]-pp$stemmer[i]))), NA)
}

#Impute MoE

#Mean of a) House b) Fylke and c) Party
pp$MoE_imp <- pp$MoE
for(i in 1:nrow(pp)){
  pp$MoE_imp[i] <- ifelse(is.na(pp$MoE[i])==TRUE,
                      mean(pp$MoE[which(pp$hus==pp$hus[i] & pp$fylke==pp$fylke[i] & pp$parti==pp$parti[i])], na.rm=TRUE),
                      pp$MoE[i])
}

#Still 10 NAs, so the rest: Mean of a) Fylke and b) Party
for(i in 1:nrow(pp)){
  pp$MoE_imp[i] <- ifelse(is.na(pp$MoE_imp[i])==TRUE,
                          mean(pp$MoE[which(pp$fylke==pp$fylke[i] & pp$parti==pp$parti[i])], na.rm=TRUE),
                          pp$MoE_imp[i])
}

pp$sigma <- pp$MoE_imp/4

#Lower letters in fylke
pp$fylke <- tolower(pp$fylke)

#define date
pp$date <- as.Date(pp$Dato)
pp_big <- pp
pp <- pp_big[which(pp_big$date>as.Date("2017-01-01")),]





#####     OSLO        #####
#Oslo Ap
poll_oslo_ap <- pp[which(pp$fylke=="oslo" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                          to= as.Date("2017-09-11"), 
                                          by = "day")), poll_oslo_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_ap <- polls_oslo_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_ap[is.na(Y_oslo_ap)] <- -9

sigma_oslo_ap <- polls_oslo_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_ap[is.na(sigma_oslo_ap)] <- -9


#Oslo H
poll_oslo_h <- pp[which(pp$fylke=="oslo" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_oslo_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_h <- polls_oslo_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_h[is.na(Y_oslo_h)] <- -9

sigma_oslo_h <- polls_oslo_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_h[is.na(sigma_oslo_h)] <- -9

#Oslo Frp
poll_oslo_frp <- pp[which(pp$fylke=="oslo" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_oslo_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_frp <- polls_oslo_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_frp[is.na(Y_oslo_frp)] <- -9

sigma_oslo_frp <- polls_oslo_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_frp[is.na(sigma_oslo_frp)] <- -9


#Oslo SV
poll_oslo_sv <- pp[which(pp$fylke=="oslo" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_oslo_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_sv <- polls_oslo_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_sv[is.na(Y_oslo_sv)] <- -9

sigma_oslo_sv <- polls_oslo_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_sv[is.na(sigma_oslo_sv)] <- -9

#Oslo SP
poll_oslo_sp <- pp[which(pp$fylke=="oslo" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_oslo_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_sp <- polls_oslo_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_sp[is.na(Y_oslo_sp)] <- -9

sigma_oslo_sp <- polls_oslo_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_sp[is.na(sigma_oslo_sp)] <- -9

#Oslo krf
poll_oslo_krf <- pp[which(pp$fylke=="oslo" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_krf <- left_join(data_frame(date = seq(from =as.Date("2017-01-01"),
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_oslo_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_krf <- polls_oslo_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_krf[is.na(Y_oslo_krf)] <- -9

sigma_oslo_krf <- polls_oslo_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_krf[is.na(sigma_oslo_krf)] <- -9

#Oslo V
poll_oslo_v <- pp[which(pp$fylke=="oslo" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_oslo_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_v <- polls_oslo_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_v[is.na(Y_oslo_v)] <- -9

sigma_oslo_v <- polls_oslo_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_v[is.na(sigma_oslo_v)] <- -9

#Oslo mdg
poll_oslo_mdg <- pp[which(pp$fylke=="oslo" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_oslo_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_mdg <- polls_oslo_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_mdg[is.na(Y_oslo_mdg)] <- -9

sigma_oslo_mdg <- polls_oslo_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_mdg[is.na(sigma_oslo_mdg)] <- -9


#Oslo R
poll_oslo_r <- pp[which(pp$fylke=="oslo" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_r <- left_join(data_frame(date = seq(from =as.Date("2017-01-01"),
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_oslo_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_r <- polls_oslo_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_r[is.na(Y_oslo_r)] <- -9

sigma_oslo_r <- polls_oslo_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_r[is.na(sigma_oslo_r)] <- -9


#Oslo andre
poll_oslo_a <- pp[which(pp$fylke=="oslo" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_oslo_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_oslo_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oslo_a <- polls_oslo_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oslo_a[is.na(Y_oslo_a)] <- -9

sigma_oslo_a <- polls_oslo_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oslo_a[is.na(sigma_oslo_a)] <- -9


#####     finnmark        #####
#finnmark Ap
poll_finnmark_ap <- pp[which(pp$fylke=="finnmark" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_finnmark_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_ap <- polls_finnmark_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_ap[is.na(Y_finnmark_ap)] <- -9

sigma_finnmark_ap <- polls_finnmark_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_ap[is.na(sigma_finnmark_ap)] <- -9


#finnmark H
poll_finnmark_h <- pp[which(pp$fylke=="finnmark" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_finnmark_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_h <- polls_finnmark_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_h[is.na(Y_finnmark_h)] <- -9

sigma_finnmark_h <- polls_finnmark_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_h[is.na(sigma_finnmark_h)] <- -9

#finnmark Frp
poll_finnmark_frp <- pp[which(pp$fylke=="finnmark" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_finnmark_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_frp <- polls_finnmark_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_frp[is.na(Y_finnmark_frp)] <- -9

sigma_finnmark_frp <- polls_finnmark_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_frp[is.na(sigma_finnmark_frp)] <- -9


#finnmark SV
poll_finnmark_sv <- pp[which(pp$fylke=="finnmark" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_finnmark_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_sv <- polls_finnmark_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_sv[is.na(Y_finnmark_sv)] <- -9

sigma_finnmark_sv <- polls_finnmark_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_sv[is.na(sigma_finnmark_sv)] <- -9

#finnmark SP
poll_finnmark_sp <- pp[which(pp$fylke=="finnmark" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_finnmark_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_sp <- polls_finnmark_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_sp[is.na(Y_finnmark_sp)] <- -9

sigma_finnmark_sp <- polls_finnmark_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_sp[is.na(sigma_finnmark_sp)] <- -9

#finnmark krf
poll_finnmark_krf <- pp[which(pp$fylke=="finnmark" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_finnmark_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_krf <- polls_finnmark_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_krf[is.na(Y_finnmark_krf)] <- -9

sigma_finnmark_krf <- polls_finnmark_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_krf[is.na(sigma_finnmark_krf)] <- -9

#finnmark V
poll_finnmark_v <- pp[which(pp$fylke=="finnmark" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_finnmark_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_v <- polls_finnmark_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_v[is.na(Y_finnmark_v)] <- -9

sigma_finnmark_v <- polls_finnmark_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_v[is.na(sigma_finnmark_v)] <- -9

#finnmark mdg
poll_finnmark_mdg <- pp[which(pp$fylke=="finnmark" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_finnmark_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_mdg <- polls_finnmark_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_mdg[is.na(Y_finnmark_mdg)] <- -9

sigma_finnmark_mdg <- polls_finnmark_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_mdg[is.na(sigma_finnmark_mdg)] <- -9


#finnmark R
poll_finnmark_r <- pp[which(pp$fylke=="finnmark" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_finnmark_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_r <- polls_finnmark_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_r[is.na(Y_finnmark_r)] <- -9

sigma_finnmark_r <- polls_finnmark_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_r[is.na(sigma_finnmark_r)] <- -9


#finnmark andre
poll_finnmark_a <- pp[which(pp$fylke=="finnmark" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_finnmark_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_finnmark_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_finnmark_a <- polls_finnmark_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_finnmark_a[is.na(Y_finnmark_a)] <- -9

sigma_finnmark_a <- polls_finnmark_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_finnmark_a[is.na(sigma_finnmark_a)] <- -9

#####     nordland        #####
#nordland Ap
poll_nordland_ap <- pp[which(pp$fylke=="nordland" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_nordland_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_ap <- polls_nordland_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_ap[is.na(Y_nordland_ap)] <- -9

sigma_nordland_ap <- polls_nordland_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_ap[is.na(sigma_nordland_ap)] <- -9


#nordland H
poll_nordland_h <- pp[which(pp$fylke=="nordland" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_h <- left_join(data_frame(date = seq(from =as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_nordland_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_h <- polls_nordland_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_h[is.na(Y_nordland_h)] <- -9

sigma_nordland_h <- polls_nordland_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_h[is.na(sigma_nordland_h)] <- -9

#nordland Frp
poll_nordland_frp <- pp[which(pp$fylke=="nordland" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_nordland_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_frp <- polls_nordland_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_frp[is.na(Y_nordland_frp)] <- -9

sigma_nordland_frp <- polls_nordland_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_frp[is.na(sigma_nordland_frp)] <- -9


#nordland SV
poll_nordland_sv <- pp[which(pp$fylke=="nordland" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_sv <- left_join(data_frame(date = seq(from =as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_nordland_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_sv <- polls_nordland_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_sv[is.na(Y_nordland_sv)] <- -9

sigma_nordland_sv <- polls_nordland_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_sv[is.na(sigma_nordland_sv)] <- -9

#nordland SP
poll_nordland_sp <- pp[which(pp$fylke=="nordland" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_sp <- left_join(data_frame(date = seq(from =as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_nordland_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_sp <- polls_nordland_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_sp[is.na(Y_nordland_sp)] <- -9

sigma_nordland_sp <- polls_nordland_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_sp[is.na(sigma_nordland_sp)] <- -9

#nordland krf
poll_nordland_krf <- pp[which(pp$fylke=="nordland" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_nordland_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_krf <- polls_nordland_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_krf[is.na(Y_nordland_krf)] <- -9

sigma_nordland_krf <- polls_nordland_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_krf[is.na(sigma_nordland_krf)] <- -9

#nordland V
poll_nordland_v <- pp[which(pp$fylke=="nordland" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_nordland_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_v <- polls_nordland_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_v[is.na(Y_nordland_v)] <- -9

sigma_nordland_v <- polls_nordland_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_v[is.na(sigma_nordland_v)] <- -9

#nordland mdg
poll_nordland_mdg <- pp[which(pp$fylke=="nordland" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_nordland_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_mdg <- polls_nordland_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_mdg[is.na(Y_nordland_mdg)] <- -9

sigma_nordland_mdg <- polls_nordland_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_mdg[is.na(sigma_nordland_mdg)] <- -9


#nordland R
poll_nordland_r <- pp[which(pp$fylke=="nordland" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_nordland_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_r <- polls_nordland_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_r[is.na(Y_nordland_r)] <- -9

sigma_nordland_r <- polls_nordland_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_r[is.na(sigma_nordland_r)] <- -9


#nordland andre
poll_nordland_a <- pp[which(pp$fylke=="nordland" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_nordland_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_nordland_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordland_a <- polls_nordland_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordland_a[is.na(Y_nordland_a)] <- -9

sigma_nordland_a <- polls_nordland_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordland_a[is.na(sigma_nordland_a)] <- -9


#####     troms        #####
#troms Ap
poll_troms_ap <- pp[which(pp$fylke=="troms" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_troms_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_troms_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_ap <- polls_troms_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_ap[is.na(Y_troms_ap)] <- -9

sigma_troms_ap <- polls_troms_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_ap[is.na(sigma_troms_ap)] <- -9


#troms H
poll_troms_h <- pp[which(pp$fylke=="troms" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_troms_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_troms_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_h <- polls_troms_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_h[is.na(Y_troms_h)] <- -9

sigma_troms_h <- polls_troms_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_h[is.na(sigma_troms_h)] <- -9

#troms Frp
poll_troms_frp <- pp[which(pp$fylke=="troms" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_troms_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_troms_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_frp <- polls_troms_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_frp[is.na(Y_troms_frp)] <- -9

sigma_troms_frp <- polls_troms_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_frp[is.na(sigma_troms_frp)] <- -9


#troms SV
poll_troms_sv <- pp[which(pp$fylke=="troms" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_troms_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_troms_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_sv <- polls_troms_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_sv[is.na(Y_troms_sv)] <- -9

sigma_troms_sv <- polls_troms_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_sv[is.na(sigma_troms_sv)] <- -9

#troms SP
poll_troms_sp <- pp[which(pp$fylke=="troms" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_troms_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_troms_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_sp <- polls_troms_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_sp[is.na(Y_troms_sp)] <- -9

sigma_troms_sp <- polls_troms_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_sp[is.na(sigma_troms_sp)] <- -9

#troms krf
poll_troms_krf <- pp[which(pp$fylke=="troms" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_troms_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_troms_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_krf <- polls_troms_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_krf[is.na(Y_troms_krf)] <- -9

sigma_troms_krf <- polls_troms_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_krf[is.na(sigma_troms_krf)] <- -9

#troms V
poll_troms_v <- pp[which(pp$fylke=="troms" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_troms_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_troms_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_v <- polls_troms_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_v[is.na(Y_troms_v)] <- -9

sigma_troms_v <- polls_troms_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_v[is.na(sigma_troms_v)] <- -9

#troms mdg
poll_troms_mdg <- pp[which(pp$fylke=="troms" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_troms_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_troms_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_mdg <- polls_troms_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_mdg[is.na(Y_troms_mdg)] <- -9

sigma_troms_mdg <- polls_troms_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_mdg[is.na(sigma_troms_mdg)] <- -9


#troms R
poll_troms_r <- pp[which(pp$fylke=="troms" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_troms_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_troms_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_r <- polls_troms_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_r[is.na(Y_troms_r)] <- -9

sigma_troms_r <- polls_troms_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_r[is.na(sigma_troms_r)] <- -9


#troms andre
poll_troms_a <- pp[which(pp$fylke=="troms" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_troms_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_troms_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_troms_a <- polls_troms_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_troms_a[is.na(Y_troms_a)] <- -9

sigma_troms_a <- polls_troms_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_troms_a[is.na(sigma_troms_a)] <- -9

#####     telemark        #####
#telemark Ap
poll_telemark_ap <- pp[which(pp$fylke=="telemark" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_telemark_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_ap <- polls_telemark_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_ap[is.na(Y_telemark_ap)] <- -9

sigma_telemark_ap <- polls_telemark_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_ap[is.na(sigma_telemark_ap)] <- -9


#telemark H
poll_telemark_h <- pp[which(pp$fylke=="telemark" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_telemark_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_h <- polls_telemark_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_h[is.na(Y_telemark_h)] <- -9

sigma_telemark_h <- polls_telemark_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_h[is.na(sigma_telemark_h)] <- -9

#telemark Frp
poll_telemark_frp <- pp[which(pp$fylke=="telemark" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_telemark_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_frp <- polls_telemark_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_frp[is.na(Y_telemark_frp)] <- -9

sigma_telemark_frp <- polls_telemark_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_frp[is.na(sigma_telemark_frp)] <- -9


#telemark SV
poll_telemark_sv <- pp[which(pp$fylke=="telemark" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_telemark_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_sv <- polls_telemark_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_sv[is.na(Y_telemark_sv)] <- -9

sigma_telemark_sv <- polls_telemark_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_sv[is.na(sigma_telemark_sv)] <- -9

#telemark SP
poll_telemark_sp <- pp[which(pp$fylke=="telemark" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_telemark_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_sp <- polls_telemark_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_sp[is.na(Y_telemark_sp)] <- -9

sigma_telemark_sp <- polls_telemark_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_sp[is.na(sigma_telemark_sp)] <- -9

#telemark krf
poll_telemark_krf <- pp[which(pp$fylke=="telemark" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_telemark_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_krf <- polls_telemark_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_krf[is.na(Y_telemark_krf)] <- -9

sigma_telemark_krf <- polls_telemark_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_krf[is.na(sigma_telemark_krf)] <- -9

#telemark V
poll_telemark_v <- pp[which(pp$fylke=="telemark" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_telemark_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_v <- polls_telemark_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_v[is.na(Y_telemark_v)] <- -9

sigma_telemark_v <- polls_telemark_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_v[is.na(sigma_telemark_v)] <- -9

#telemark mdg
poll_telemark_mdg <- pp[which(pp$fylke=="telemark" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_telemark_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_mdg <- polls_telemark_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_mdg[is.na(Y_telemark_mdg)] <- -9

sigma_telemark_mdg <- polls_telemark_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_mdg[is.na(sigma_telemark_mdg)] <- -9


#telemark R
poll_telemark_r <- pp[which(pp$fylke=="telemark" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_telemark_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_r <- polls_telemark_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_r[is.na(Y_telemark_r)] <- -9

sigma_telemark_r <- polls_telemark_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_r[is.na(sigma_telemark_r)] <- -9


#telemark andre
poll_telemark_a <- pp[which(pp$fylke=="telemark" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_telemark_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_telemark_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_telemark_a <- polls_telemark_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_telemark_a[is.na(Y_telemark_a)] <- -9

sigma_telemark_a <- polls_telemark_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_telemark_a[is.na(sigma_telemark_a)] <- -9


#####     oppland        #####
#oppland Ap
poll_oppland_ap <- pp[which(pp$fylke=="oppland" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_oppland_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_ap <- polls_oppland_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_ap[is.na(Y_oppland_ap)] <- -9

sigma_oppland_ap <- polls_oppland_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_ap[is.na(sigma_oppland_ap)] <- -9


#oppland H
poll_oppland_h <- pp[which(pp$fylke=="oppland" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_oppland_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_h <- polls_oppland_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_h[is.na(Y_oppland_h)] <- -9

sigma_oppland_h <- polls_oppland_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_h[is.na(sigma_oppland_h)] <- -9

#oppland Frp
poll_oppland_frp <- pp[which(pp$fylke=="oppland" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_oppland_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_frp <- polls_oppland_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_frp[is.na(Y_oppland_frp)] <- -9

sigma_oppland_frp <- polls_oppland_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_frp[is.na(sigma_oppland_frp)] <- -9


#oppland SV
poll_oppland_sv <- pp[which(pp$fylke=="oppland" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_oppland_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_sv <- polls_oppland_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_sv[is.na(Y_oppland_sv)] <- -9

sigma_oppland_sv <- polls_oppland_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_sv[is.na(sigma_oppland_sv)] <- -9

#oppland SP
poll_oppland_sp <- pp[which(pp$fylke=="oppland" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_oppland_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_sp <- polls_oppland_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_sp[is.na(Y_oppland_sp)] <- -9

sigma_oppland_sp <- polls_oppland_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_sp[is.na(sigma_oppland_sp)] <- -9

#oppland krf
poll_oppland_krf <- pp[which(pp$fylke=="oppland" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_oppland_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_krf <- polls_oppland_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_krf[is.na(Y_oppland_krf)] <- -9

sigma_oppland_krf <- polls_oppland_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_krf[is.na(sigma_oppland_krf)] <- -9

#oppland V
poll_oppland_v <- pp[which(pp$fylke=="oppland" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_oppland_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_v <- polls_oppland_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_v[is.na(Y_oppland_v)] <- -9

sigma_oppland_v <- polls_oppland_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_v[is.na(sigma_oppland_v)] <- -9

#oppland mdg
poll_oppland_mdg <- pp[which(pp$fylke=="oppland" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_oppland_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_mdg <- polls_oppland_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_mdg[is.na(Y_oppland_mdg)] <- -9

sigma_oppland_mdg <- polls_oppland_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_mdg[is.na(sigma_oppland_mdg)] <- -9


#oppland R
poll_oppland_r <- pp[which(pp$fylke=="oppland" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_oppland_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_r <- polls_oppland_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_r[is.na(Y_oppland_r)] <- -9

sigma_oppland_r <- polls_oppland_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_r[is.na(sigma_oppland_r)] <- -9


#oppland andre
poll_oppland_a <- pp[which(pp$fylke=="oppland" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_oppland_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_oppland_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_oppland_a <- polls_oppland_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_oppland_a[is.na(Y_oppland_a)] <- -9

sigma_oppland_a <- polls_oppland_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_oppland_a[is.na(sigma_oppland_a)] <- -9



#####     buskerud        #####
#buskerud Ap
poll_buskerud_ap <- pp[which(pp$fylke=="buskerud" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_buskerud_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_ap <- polls_buskerud_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_ap[is.na(Y_buskerud_ap)] <- -9

sigma_buskerud_ap <- polls_buskerud_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_ap[is.na(sigma_buskerud_ap)] <- -9


#buskerud H
poll_buskerud_h <- pp[which(pp$fylke=="buskerud" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_buskerud_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_h <- polls_buskerud_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_h[is.na(Y_buskerud_h)] <- -9

sigma_buskerud_h <- polls_buskerud_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_h[is.na(sigma_buskerud_h)] <- -9

#buskerud Frp
poll_buskerud_frp <- pp[which(pp$fylke=="buskerud" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_buskerud_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_frp <- polls_buskerud_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_frp[is.na(Y_buskerud_frp)] <- -9

sigma_buskerud_frp <- polls_buskerud_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_frp[is.na(sigma_buskerud_frp)] <- -9


#buskerud SV
poll_buskerud_sv <- pp[which(pp$fylke=="buskerud" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_buskerud_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_sv <- polls_buskerud_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_sv[is.na(Y_buskerud_sv)] <- -9

sigma_buskerud_sv <- polls_buskerud_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_sv[is.na(sigma_buskerud_sv)] <- -9

#buskerud SP
poll_buskerud_sp <- pp[which(pp$fylke=="buskerud" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_buskerud_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_sp <- polls_buskerud_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_sp[is.na(Y_buskerud_sp)] <- -9

sigma_buskerud_sp <- polls_buskerud_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_sp[is.na(sigma_buskerud_sp)] <- -9

#buskerud krf
poll_buskerud_krf <- pp[which(pp$fylke=="buskerud" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_buskerud_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_krf <- polls_buskerud_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_krf[is.na(Y_buskerud_krf)] <- -9

sigma_buskerud_krf <- polls_buskerud_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_krf[is.na(sigma_buskerud_krf)] <- -9

#buskerud V
poll_buskerud_v <- pp[which(pp$fylke=="buskerud" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_buskerud_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_v <- polls_buskerud_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_v[is.na(Y_buskerud_v)] <- -9

sigma_buskerud_v <- polls_buskerud_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_v[is.na(sigma_buskerud_v)] <- -9

#buskerud mdg
poll_buskerud_mdg <- pp[which(pp$fylke=="buskerud" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_buskerud_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_mdg <- polls_buskerud_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_mdg[is.na(Y_buskerud_mdg)] <- -9

sigma_buskerud_mdg <- polls_buskerud_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_mdg[is.na(sigma_buskerud_mdg)] <- -9


#buskerud R
poll_buskerud_r <- pp[which(pp$fylke=="buskerud" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_buskerud_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_r <- polls_buskerud_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_r[is.na(Y_buskerud_r)] <- -9

sigma_buskerud_r <- polls_buskerud_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_r[is.na(sigma_buskerud_r)] <- -9


#buskerud andre
poll_buskerud_a <- pp[which(pp$fylke=="buskerud" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_buskerud_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_buskerud_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_buskerud_a <- polls_buskerud_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_buskerud_a[is.na(Y_buskerud_a)] <- -9

sigma_buskerud_a <- polls_buskerud_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_buskerud_a[is.na(sigma_buskerud_a)] <- -9

#####     hordaland        #####
#hordaland Ap
poll_hordaland_ap <- pp[which(pp$fylke=="hordaland" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_hordaland_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_ap <- polls_hordaland_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_ap[is.na(Y_hordaland_ap)] <- -9

sigma_hordaland_ap <- polls_hordaland_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_ap[is.na(sigma_hordaland_ap)] <- -9


#hordaland H
poll_hordaland_h <- pp[which(pp$fylke=="hordaland" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_hordaland_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_h <- polls_hordaland_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_h[is.na(Y_hordaland_h)] <- -9

sigma_hordaland_h <- polls_hordaland_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_h[is.na(sigma_hordaland_h)] <- -9

#hordaland Frp
poll_hordaland_frp <- pp[which(pp$fylke=="hordaland" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_hordaland_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_frp <- polls_hordaland_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_frp[is.na(Y_hordaland_frp)] <- -9

sigma_hordaland_frp <- polls_hordaland_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_frp[is.na(sigma_hordaland_frp)] <- -9


#hordaland SV
poll_hordaland_sv <- pp[which(pp$fylke=="hordaland" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_hordaland_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_sv <- polls_hordaland_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_sv[is.na(Y_hordaland_sv)] <- -9

sigma_hordaland_sv <- polls_hordaland_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_sv[is.na(sigma_hordaland_sv)] <- -9

#hordaland SP
poll_hordaland_sp <- pp[which(pp$fylke=="hordaland" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_hordaland_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_sp <- polls_hordaland_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_sp[is.na(Y_hordaland_sp)] <- -9

sigma_hordaland_sp <- polls_hordaland_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_sp[is.na(sigma_hordaland_sp)] <- -9

#hordaland krf
poll_hordaland_krf <- pp[which(pp$fylke=="hordaland" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_hordaland_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_krf <- polls_hordaland_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_krf[is.na(Y_hordaland_krf)] <- -9

sigma_hordaland_krf <- polls_hordaland_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_krf[is.na(sigma_hordaland_krf)] <- -9

#hordaland V
poll_hordaland_v <- pp[which(pp$fylke=="hordaland" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_hordaland_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_v <- polls_hordaland_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_v[is.na(Y_hordaland_v)] <- -9

sigma_hordaland_v <- polls_hordaland_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_v[is.na(sigma_hordaland_v)] <- -9

#hordaland mdg
poll_hordaland_mdg <- pp[which(pp$fylke=="hordaland" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_hordaland_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_mdg <- polls_hordaland_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_mdg[is.na(Y_hordaland_mdg)] <- -9

sigma_hordaland_mdg <- polls_hordaland_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_mdg[is.na(sigma_hordaland_mdg)] <- -9


#hordaland R
poll_hordaland_r <- pp[which(pp$fylke=="hordaland" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_hordaland_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_r <- polls_hordaland_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_r[is.na(Y_hordaland_r)] <- -9

sigma_hordaland_r <- polls_hordaland_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_r[is.na(sigma_hordaland_r)] <- -9


#hordaland andre
poll_hordaland_a <- pp[which(pp$fylke=="hordaland" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_hordaland_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_hordaland_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hordaland_a <- polls_hordaland_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hordaland_a[is.na(Y_hordaland_a)] <- -9

sigma_hordaland_a <- polls_hordaland_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hordaland_a[is.na(sigma_hordaland_a)] <- -9




#####     sogn        #####
#sogn Ap
poll_sogn_ap <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_sogn_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_ap <- polls_sogn_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_ap[is.na(Y_sogn_ap)] <- -9

sigma_sogn_ap <- polls_sogn_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_ap[is.na(sigma_sogn_ap)] <- -9


#sogn H
poll_sogn_h <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_sogn_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_h <- polls_sogn_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_h[is.na(Y_sogn_h)] <- -9

sigma_sogn_h <- polls_sogn_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_h[is.na(sigma_sogn_h)] <- -9

#sogn Frp
poll_sogn_frp <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_sogn_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_frp <- polls_sogn_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_frp[is.na(Y_sogn_frp)] <- -9

sigma_sogn_frp <- polls_sogn_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_frp[is.na(sigma_sogn_frp)] <- -9


#sogn SV
poll_sogn_sv <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_sogn_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_sv <- polls_sogn_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_sv[is.na(Y_sogn_sv)] <- -9

sigma_sogn_sv <- polls_sogn_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_sv[is.na(sigma_sogn_sv)] <- -9

#sogn SP
poll_sogn_sp <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_sogn_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_sp <- polls_sogn_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_sp[is.na(Y_sogn_sp)] <- -9

sigma_sogn_sp <- polls_sogn_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_sp[is.na(sigma_sogn_sp)] <- -9

#sogn krf
poll_sogn_krf <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_sogn_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_krf <- polls_sogn_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_krf[is.na(Y_sogn_krf)] <- -9

sigma_sogn_krf <- polls_sogn_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_krf[is.na(sigma_sogn_krf)] <- -9

#sogn V
poll_sogn_v <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_sogn_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_v <- polls_sogn_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_v[is.na(Y_sogn_v)] <- -9

sigma_sogn_v <- polls_sogn_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_v[is.na(sigma_sogn_v)] <- -9

#sogn mdg
poll_sogn_mdg <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_sogn_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_mdg <- polls_sogn_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_mdg[is.na(Y_sogn_mdg)] <- -9

sigma_sogn_mdg <- polls_sogn_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_mdg[is.na(sigma_sogn_mdg)] <- -9


#sogn R
poll_sogn_r <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_sogn_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_r <- polls_sogn_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_r[is.na(Y_sogn_r)] <- -9

sigma_sogn_r <- polls_sogn_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_r[is.na(sigma_sogn_r)] <- -9


#sogn andre
poll_sogn_a <- pp[which(pp$fylke=="sogn og fjordane" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_sogn_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_sogn_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sogn_a <- polls_sogn_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sogn_a[is.na(Y_sogn_a)] <- -9

sigma_sogn_a <- polls_sogn_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sogn_a[is.na(sigma_sogn_a)] <- -9

#####     austagder        #####
#austagder Ap
poll_austagder_ap <- pp[which(pp$fylke=="aust-agder" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_austagder_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_ap <- polls_austagder_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_ap[is.na(Y_austagder_ap)] <- -9

sigma_austagder_ap <- polls_austagder_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_ap[is.na(sigma_austagder_ap)] <- -9


#austagder H
poll_austagder_h <- pp[which(pp$fylke=="aust-agder" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_austagder_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_h <- polls_austagder_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_h[is.na(Y_austagder_h)] <- -9

sigma_austagder_h <- polls_austagder_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_h[is.na(sigma_austagder_h)] <- -9

#austagder Frp
poll_austagder_frp <- pp[which(pp$fylke=="aust-agder" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_austagder_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_frp <- polls_austagder_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_frp[is.na(Y_austagder_frp)] <- -9

sigma_austagder_frp <- polls_austagder_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_frp[is.na(sigma_austagder_frp)] <- -9


#austagder SV
poll_austagder_sv <- pp[which(pp$fylke=="aust-agder" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_austagder_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_sv <- polls_austagder_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_sv[is.na(Y_austagder_sv)] <- -9

sigma_austagder_sv <- polls_austagder_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_sv[is.na(sigma_austagder_sv)] <- -9

#austagder SP
poll_austagder_sp <- pp[which(pp$fylke=="aust-agder" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_austagder_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_sp <- polls_austagder_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_sp[is.na(Y_austagder_sp)] <- -9

sigma_austagder_sp <- polls_austagder_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_sp[is.na(sigma_austagder_sp)] <- -9

#austagder krf
poll_austagder_krf <- pp[which(pp$fylke=="aust-agder" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_austagder_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_krf <- polls_austagder_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_krf[is.na(Y_austagder_krf)] <- -9

sigma_austagder_krf <- polls_austagder_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_krf[is.na(sigma_austagder_krf)] <- -9

#austagder V
poll_austagder_v <- pp[which(pp$fylke=="aust-agder" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_austagder_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_v <- polls_austagder_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_v[is.na(Y_austagder_v)] <- -9

sigma_austagder_v <- polls_austagder_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_v[is.na(sigma_austagder_v)] <- -9

#austagder mdg
poll_austagder_mdg <- pp[which(pp$fylke=="aust-agder" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_austagder_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_mdg <- polls_austagder_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_mdg[is.na(Y_austagder_mdg)] <- -9

sigma_austagder_mdg <- polls_austagder_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_mdg[is.na(sigma_austagder_mdg)] <- -9


#austagder R
poll_austagder_r <- pp[which(pp$fylke=="aust-agder" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_austagder_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_r <- polls_austagder_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_r[is.na(Y_austagder_r)] <- -9

sigma_austagder_r <- polls_austagder_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_r[is.na(sigma_austagder_r)] <- -9


#austagder andre
poll_austagder_a <- pp[which(pp$fylke=="aust-agder" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_austagder_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_austagder_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_austagder_a <- polls_austagder_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_austagder_a[is.na(Y_austagder_a)] <- -9

sigma_austagder_a <- polls_austagder_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_austagder_a[is.na(sigma_austagder_a)] <- -9

#####     vestagder        #####
#vestagder Ap
poll_vestagder_ap <- pp[which(pp$fylke=="vest-agder" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_vestagder_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_ap <- polls_vestagder_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_ap[is.na(Y_vestagder_ap)] <- -9

sigma_vestagder_ap <- polls_vestagder_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_ap[is.na(sigma_vestagder_ap)] <- -9


#vestagder H
poll_vestagder_h <- pp[which(pp$fylke=="vest-agder" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_vestagder_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_h <- polls_vestagder_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_h[is.na(Y_vestagder_h)] <- -9

sigma_vestagder_h <- polls_vestagder_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_h[is.na(sigma_vestagder_h)] <- -9

#vestagder Frp
poll_vestagder_frp <- pp[which(pp$fylke=="vest-agder" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_vestagder_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_frp <- polls_vestagder_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_frp[is.na(Y_vestagder_frp)] <- -9

sigma_vestagder_frp <- polls_vestagder_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_frp[is.na(sigma_vestagder_frp)] <- -9


#vestagder SV
poll_vestagder_sv <- pp[which(pp$fylke=="vest-agder" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_vestagder_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_sv <- polls_vestagder_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_sv[is.na(Y_vestagder_sv)] <- -9

sigma_vestagder_sv <- polls_vestagder_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_sv[is.na(sigma_vestagder_sv)] <- -9

#vestagder SP
poll_vestagder_sp <- pp[which(pp$fylke=="vest-agder" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_vestagder_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_sp <- polls_vestagder_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_sp[is.na(Y_vestagder_sp)] <- -9

sigma_vestagder_sp <- polls_vestagder_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_sp[is.na(sigma_vestagder_sp)] <- -9

#vestagder krf
poll_vestagder_krf <- pp[which(pp$fylke=="vest-agder" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_vestagder_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_krf <- polls_vestagder_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_krf[is.na(Y_vestagder_krf)] <- -9

sigma_vestagder_krf <- polls_vestagder_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_krf[is.na(sigma_vestagder_krf)] <- -9

#vestagder V
poll_vestagder_v <- pp[which(pp$fylke=="vest-agder" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_vestagder_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_v <- polls_vestagder_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_v[is.na(Y_vestagder_v)] <- -9

sigma_vestagder_v <- polls_vestagder_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_v[is.na(sigma_vestagder_v)] <- -9

#vestagder mdg
poll_vestagder_mdg <- pp[which(pp$fylke=="vest-agder" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                       to= as.Date("2017-09-11"), 
                                                       by = "day")), poll_vestagder_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_mdg <- polls_vestagder_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_mdg[is.na(Y_vestagder_mdg)] <- -9

sigma_vestagder_mdg <- polls_vestagder_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_mdg[is.na(sigma_vestagder_mdg)] <- -9


#vestagder R
poll_vestagder_r <- pp[which(pp$fylke=="vest-agder" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_vestagder_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_r <- polls_vestagder_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_r[is.na(Y_vestagder_r)] <- -9

sigma_vestagder_r <- polls_vestagder_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_r[is.na(sigma_vestagder_r)] <- -9


#vestagder andre
poll_vestagder_a <- pp[which(pp$fylke=="vest-agder" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_vestagder_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_vestagder_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestagder_a <- polls_vestagder_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestagder_a[is.na(Y_vestagder_a)] <- -9

sigma_vestagder_a <- polls_vestagder_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestagder_a[is.na(sigma_vestagder_a)] <- -9



#####     rogaland        #####
#rogaland Ap
poll_rogaland_ap <- pp[which(pp$fylke=="rogaland" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_rogaland_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_ap <- polls_rogaland_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_ap[is.na(Y_rogaland_ap)] <- -9

sigma_rogaland_ap <- polls_rogaland_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_ap[is.na(sigma_rogaland_ap)] <- -9


#rogaland H
poll_rogaland_h <- pp[which(pp$fylke=="rogaland" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_rogaland_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_h <- polls_rogaland_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_h[is.na(Y_rogaland_h)] <- -9

sigma_rogaland_h <- polls_rogaland_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_h[is.na(sigma_rogaland_h)] <- -9

#rogaland Frp
poll_rogaland_frp <- pp[which(pp$fylke=="rogaland" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_rogaland_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_frp <- polls_rogaland_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_frp[is.na(Y_rogaland_frp)] <- -9

sigma_rogaland_frp <- polls_rogaland_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_frp[is.na(sigma_rogaland_frp)] <- -9


#rogaland SV
poll_rogaland_sv <- pp[which(pp$fylke=="rogaland" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_rogaland_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_sv <- polls_rogaland_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_sv[is.na(Y_rogaland_sv)] <- -9

sigma_rogaland_sv <- polls_rogaland_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_sv[is.na(sigma_rogaland_sv)] <- -9

#rogaland SP
poll_rogaland_sp <- pp[which(pp$fylke=="rogaland" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_rogaland_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_sp <- polls_rogaland_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_sp[is.na(Y_rogaland_sp)] <- -9

sigma_rogaland_sp <- polls_rogaland_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_sp[is.na(sigma_rogaland_sp)] <- -9

#rogaland krf
poll_rogaland_krf <- pp[which(pp$fylke=="rogaland" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_rogaland_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_krf <- polls_rogaland_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_krf[is.na(Y_rogaland_krf)] <- -9

sigma_rogaland_krf <- polls_rogaland_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_krf[is.na(sigma_rogaland_krf)] <- -9

#rogaland V
poll_rogaland_v <- pp[which(pp$fylke=="rogaland" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_rogaland_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_v <- polls_rogaland_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_v[is.na(Y_rogaland_v)] <- -9

sigma_rogaland_v <- polls_rogaland_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_v[is.na(sigma_rogaland_v)] <- -9

#rogaland mdg
poll_rogaland_mdg <- pp[which(pp$fylke=="rogaland" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_rogaland_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_mdg <- polls_rogaland_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_mdg[is.na(Y_rogaland_mdg)] <- -9

sigma_rogaland_mdg <- polls_rogaland_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_mdg[is.na(sigma_rogaland_mdg)] <- -9


#rogaland R
poll_rogaland_r <- pp[which(pp$fylke=="rogaland" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_rogaland_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_r <- polls_rogaland_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_r[is.na(Y_rogaland_r)] <- -9

sigma_rogaland_r <- polls_rogaland_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_r[is.na(sigma_rogaland_r)] <- -9


#rogaland andre
poll_rogaland_a <- pp[which(pp$fylke=="rogaland" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_rogaland_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_rogaland_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_rogaland_a <- polls_rogaland_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_rogaland_a[is.na(Y_rogaland_a)] <- -9

sigma_rogaland_a <- polls_rogaland_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_rogaland_a[is.na(sigma_rogaland_a)] <- -9

#####     nordtrondelag        #####
#nordtrondelag Ap
poll_nordtrondelag_ap <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                          to= as.Date("2017-09-11"), 
                                                          by = "day")), poll_nordtrondelag_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_ap <- polls_nordtrondelag_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_ap[is.na(Y_nordtrondelag_ap)] <- -9

sigma_nordtrondelag_ap <- polls_nordtrondelag_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_ap[is.na(sigma_nordtrondelag_ap)] <- -9


#nordtrondelag H
poll_nordtrondelag_h <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                         to= as.Date("2017-09-11"), 
                                                         by = "day")), poll_nordtrondelag_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_h <- polls_nordtrondelag_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_h[is.na(Y_nordtrondelag_h)] <- -9

sigma_nordtrondelag_h <- polls_nordtrondelag_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_h[is.na(sigma_nordtrondelag_h)] <- -9

#nordtrondelag Frp
poll_nordtrondelag_frp <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                           to= as.Date("2017-09-11"), 
                                                           by = "day")), poll_nordtrondelag_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_frp <- polls_nordtrondelag_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_frp[is.na(Y_nordtrondelag_frp)] <- -9

sigma_nordtrondelag_frp <- polls_nordtrondelag_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_frp[is.na(sigma_nordtrondelag_frp)] <- -9


#nordtrondelag SV
poll_nordtrondelag_sv <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                          to= as.Date("2017-09-11"), 
                                                          by = "day")), poll_nordtrondelag_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_sv <- polls_nordtrondelag_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_sv[is.na(Y_nordtrondelag_sv)] <- -9

sigma_nordtrondelag_sv <- polls_nordtrondelag_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_sv[is.na(sigma_nordtrondelag_sv)] <- -9

#nordtrondelag SP
poll_nordtrondelag_sp <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                          to= as.Date("2017-09-11"), 
                                                          by = "day")), poll_nordtrondelag_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_sp <- polls_nordtrondelag_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_sp[is.na(Y_nordtrondelag_sp)] <- -9

sigma_nordtrondelag_sp <- polls_nordtrondelag_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_sp[is.na(sigma_nordtrondelag_sp)] <- -9

#nordtrondelag krf
poll_nordtrondelag_krf <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                           to= as.Date("2017-09-11"), 
                                                           by = "day")), poll_nordtrondelag_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_krf <- polls_nordtrondelag_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_krf[is.na(Y_nordtrondelag_krf)] <- -9

sigma_nordtrondelag_krf <- polls_nordtrondelag_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_krf[is.na(sigma_nordtrondelag_krf)] <- -9

#nordtrondelag V
poll_nordtrondelag_v <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                         to= as.Date("2017-09-11"), 
                                                         by = "day")), poll_nordtrondelag_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_v <- polls_nordtrondelag_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_v[is.na(Y_nordtrondelag_v)] <- -9

sigma_nordtrondelag_v <- polls_nordtrondelag_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_v[is.na(sigma_nordtrondelag_v)] <- -9

#nordtrondelag mdg
poll_nordtrondelag_mdg <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                           to= as.Date("2017-09-11"), 
                                                           by = "day")), poll_nordtrondelag_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_mdg <- polls_nordtrondelag_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_mdg[is.na(Y_nordtrondelag_mdg)] <- -9

sigma_nordtrondelag_mdg <- polls_nordtrondelag_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_mdg[is.na(sigma_nordtrondelag_mdg)] <- -9


#nordtrondelag R
poll_nordtrondelag_r <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                         to= as.Date("2017-09-11"), 
                                                         by = "day")), poll_nordtrondelag_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_r <- polls_nordtrondelag_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_r[is.na(Y_nordtrondelag_r)] <- -9

sigma_nordtrondelag_r <- polls_nordtrondelag_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_r[is.na(sigma_nordtrondelag_r)] <- -9


#nordtrondelag andre
poll_nordtrondelag_a <- pp[which(pp$fylke=="nord-trøndelag" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_nordtrondelag_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                         to= as.Date("2017-09-11"), 
                                                         by = "day")), poll_nordtrondelag_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_nordtrondelag_a <- polls_nordtrondelag_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_nordtrondelag_a[is.na(Y_nordtrondelag_a)] <- -9

sigma_nordtrondelag_a <- polls_nordtrondelag_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_nordtrondelag_a[is.na(sigma_nordtrondelag_a)] <- -9


#####     hedmark        #####
#hedmark Ap
poll_hedmark_ap <- pp[which(pp$fylke=="hedmark" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_hedmark_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_ap <- polls_hedmark_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_ap[is.na(Y_hedmark_ap)] <- -9

sigma_hedmark_ap <- polls_hedmark_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_ap[is.na(sigma_hedmark_ap)] <- -9


#hedmark H
poll_hedmark_h <- pp[which(pp$fylke=="hedmark" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_hedmark_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_h <- polls_hedmark_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_h[is.na(Y_hedmark_h)] <- -9

sigma_hedmark_h <- polls_hedmark_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_h[is.na(sigma_hedmark_h)] <- -9

#hedmark Frp
poll_hedmark_frp <- pp[which(pp$fylke=="hedmark" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_hedmark_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_frp <- polls_hedmark_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_frp[is.na(Y_hedmark_frp)] <- -9

sigma_hedmark_frp <- polls_hedmark_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_frp[is.na(sigma_hedmark_frp)] <- -9


#hedmark SV
poll_hedmark_sv <- pp[which(pp$fylke=="hedmark" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_hedmark_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_sv <- polls_hedmark_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_sv[is.na(Y_hedmark_sv)] <- -9

sigma_hedmark_sv <- polls_hedmark_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_sv[is.na(sigma_hedmark_sv)] <- -9

#hedmark SP
poll_hedmark_sp <- pp[which(pp$fylke=="hedmark" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_hedmark_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_sp <- polls_hedmark_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_sp[is.na(Y_hedmark_sp)] <- -9

sigma_hedmark_sp <- polls_hedmark_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_sp[is.na(sigma_hedmark_sp)] <- -9

#hedmark krf
poll_hedmark_krf <- pp[which(pp$fylke=="hedmark" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_hedmark_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_krf <- polls_hedmark_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_krf[is.na(Y_hedmark_krf)] <- -9

sigma_hedmark_krf <- polls_hedmark_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_krf[is.na(sigma_hedmark_krf)] <- -9

#hedmark V
poll_hedmark_v <- pp[which(pp$fylke=="hedmark" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_hedmark_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_v <- polls_hedmark_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_v[is.na(Y_hedmark_v)] <- -9

sigma_hedmark_v <- polls_hedmark_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_v[is.na(sigma_hedmark_v)] <- -9

#hedmark mdg
poll_hedmark_mdg <- pp[which(pp$fylke=="hedmark" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_hedmark_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_mdg <- polls_hedmark_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_mdg[is.na(Y_hedmark_mdg)] <- -9

sigma_hedmark_mdg <- polls_hedmark_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_mdg[is.na(sigma_hedmark_mdg)] <- -9


#hedmark R
poll_hedmark_r <- pp[which(pp$fylke=="hedmark" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_hedmark_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_r <- polls_hedmark_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_r[is.na(Y_hedmark_r)] <- -9

sigma_hedmark_r <- polls_hedmark_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_r[is.na(sigma_hedmark_r)] <- -9


#hedmark andre
poll_hedmark_a <- pp[which(pp$fylke=="hedmark" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_hedmark_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_hedmark_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_hedmark_a <- polls_hedmark_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_hedmark_a[is.na(Y_hedmark_a)] <- -9

sigma_hedmark_a <- polls_hedmark_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_hedmark_a[is.na(sigma_hedmark_a)] <- -9





#####     ostfold        #####
#ostfold Ap
poll_ostfold_ap <- pp[which(pp$fylke=="østfold" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_ostfold_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_ap <- polls_ostfold_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_ap[is.na(Y_ostfold_ap)] <- -9

sigma_ostfold_ap <- polls_ostfold_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_ap[is.na(sigma_ostfold_ap)] <- -9


#ostfold H
poll_ostfold_h <- pp[which(pp$fylke=="østfold" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_ostfold_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_h <- polls_ostfold_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_h[is.na(Y_ostfold_h)] <- -9

sigma_ostfold_h <- polls_ostfold_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_h[is.na(sigma_ostfold_h)] <- -9

#ostfold Frp
poll_ostfold_frp <- pp[which(pp$fylke=="østfold" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_ostfold_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_frp <- polls_ostfold_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_frp[is.na(Y_ostfold_frp)] <- -9

sigma_ostfold_frp <- polls_ostfold_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_frp[is.na(sigma_ostfold_frp)] <- -9


#ostfold SV
poll_ostfold_sv <- pp[which(pp$fylke=="østfold" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_ostfold_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_sv <- polls_ostfold_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_sv[is.na(Y_ostfold_sv)] <- -9

sigma_ostfold_sv <- polls_ostfold_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_sv[is.na(sigma_ostfold_sv)] <- -9

#ostfold SP
poll_ostfold_sp <- pp[which(pp$fylke=="østfold" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_ostfold_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_sp <- polls_ostfold_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_sp[is.na(Y_ostfold_sp)] <- -9

sigma_ostfold_sp <- polls_ostfold_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_sp[is.na(sigma_ostfold_sp)] <- -9

#ostfold krf
poll_ostfold_krf <- pp[which(pp$fylke=="østfold" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_ostfold_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_krf <- polls_ostfold_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_krf[is.na(Y_ostfold_krf)] <- -9

sigma_ostfold_krf <- polls_ostfold_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_krf[is.na(sigma_ostfold_krf)] <- -9

#ostfold V
poll_ostfold_v <- pp[which(pp$fylke=="østfold" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_ostfold_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_v <- polls_ostfold_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_v[is.na(Y_ostfold_v)] <- -9

sigma_ostfold_v <- polls_ostfold_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_v[is.na(sigma_ostfold_v)] <- -9

#ostfold mdg
poll_ostfold_mdg <- pp[which(pp$fylke=="østfold" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_ostfold_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_mdg <- polls_ostfold_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_mdg[is.na(Y_ostfold_mdg)] <- -9

sigma_ostfold_mdg <- polls_ostfold_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_mdg[is.na(sigma_ostfold_mdg)] <- -9


#ostfold R
poll_ostfold_r <- pp[which(pp$fylke=="østfold" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_ostfold_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_r <- polls_ostfold_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_r[is.na(Y_ostfold_r)] <- -9

sigma_ostfold_r <- polls_ostfold_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_r[is.na(sigma_ostfold_r)] <- -9


#ostfold andre
poll_ostfold_a <- pp[which(pp$fylke=="østfold" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_ostfold_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_ostfold_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_ostfold_a <- polls_ostfold_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_ostfold_a[is.na(Y_ostfold_a)] <- -9

sigma_ostfold_a <- polls_ostfold_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_ostfold_a[is.na(sigma_ostfold_a)] <- -9



#####     romsdal        #####
#romsdal Ap
poll_romsdal_ap <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_romsdal_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_ap <- polls_romsdal_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_ap[is.na(Y_romsdal_ap)] <- -9

sigma_romsdal_ap <- polls_romsdal_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_ap[is.na(sigma_romsdal_ap)] <- -9


#romsdal H
poll_romsdal_h <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_romsdal_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_h <- polls_romsdal_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_h[is.na(Y_romsdal_h)] <- -9

sigma_romsdal_h <- polls_romsdal_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_h[is.na(sigma_romsdal_h)] <- -9

#romsdal Frp
poll_romsdal_frp <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_romsdal_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_frp <- polls_romsdal_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_frp[is.na(Y_romsdal_frp)] <- -9

sigma_romsdal_frp <- polls_romsdal_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_frp[is.na(sigma_romsdal_frp)] <- -9


#romsdal SV
poll_romsdal_sv <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_romsdal_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_sv <- polls_romsdal_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_sv[is.na(Y_romsdal_sv)] <- -9

sigma_romsdal_sv <- polls_romsdal_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_sv[is.na(sigma_romsdal_sv)] <- -9

#romsdal SP
poll_romsdal_sp <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_romsdal_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_sp <- polls_romsdal_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_sp[is.na(Y_romsdal_sp)] <- -9

sigma_romsdal_sp <- polls_romsdal_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_sp[is.na(sigma_romsdal_sp)] <- -9

#romsdal krf
poll_romsdal_krf <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_romsdal_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_krf <- polls_romsdal_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_krf[is.na(Y_romsdal_krf)] <- -9

sigma_romsdal_krf <- polls_romsdal_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_krf[is.na(sigma_romsdal_krf)] <- -9

#romsdal V
poll_romsdal_v <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_romsdal_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_v <- polls_romsdal_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_v[is.na(Y_romsdal_v)] <- -9

sigma_romsdal_v <- polls_romsdal_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_v[is.na(sigma_romsdal_v)] <- -9

#romsdal mdg
poll_romsdal_mdg <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_romsdal_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_mdg <- polls_romsdal_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_mdg[is.na(Y_romsdal_mdg)] <- -9

sigma_romsdal_mdg <- polls_romsdal_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_mdg[is.na(sigma_romsdal_mdg)] <- -9


#romsdal R
poll_romsdal_r <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_romsdal_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_r <- polls_romsdal_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_r[is.na(Y_romsdal_r)] <- -9

sigma_romsdal_r <- polls_romsdal_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_r[is.na(sigma_romsdal_r)] <- -9


#romsdal andre
poll_romsdal_a <- pp[which(pp$fylke=="møre og romsdal" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_romsdal_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                   to= as.Date("2017-09-11"), 
                                                   by = "day")), poll_romsdal_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_romsdal_a <- polls_romsdal_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_romsdal_a[is.na(Y_romsdal_a)] <- -9

sigma_romsdal_a <- polls_romsdal_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_romsdal_a[is.na(sigma_romsdal_a)] <- -9





#####     sortrondelag        #####
#sortrondelag Ap
poll_sortrondelag_ap <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                         to= as.Date("2017-09-11"), 
                                                         by = "day")), poll_sortrondelag_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_ap <- polls_sortrondelag_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_ap[is.na(Y_sortrondelag_ap)] <- -9

sigma_sortrondelag_ap <- polls_sortrondelag_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_ap[is.na(sigma_sortrondelag_ap)] <- -9


#sortrondelag H
poll_sortrondelag_h <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                        to= as.Date("2017-09-11"), 
                                                        by = "day")), poll_sortrondelag_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_h <- polls_sortrondelag_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_h[is.na(Y_sortrondelag_h)] <- -9

sigma_sortrondelag_h <- polls_sortrondelag_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_h[is.na(sigma_sortrondelag_h)] <- -9

#sortrondelag Frp
poll_sortrondelag_frp <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                          to= as.Date("2017-09-11"), 
                                                          by = "day")), poll_sortrondelag_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_frp <- polls_sortrondelag_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_frp[is.na(Y_sortrondelag_frp)] <- -9

sigma_sortrondelag_frp <- polls_sortrondelag_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_frp[is.na(sigma_sortrondelag_frp)] <- -9


#sortrondelag SV
poll_sortrondelag_sv <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                         to= as.Date("2017-09-11"), 
                                                         by = "day")), poll_sortrondelag_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_sv <- polls_sortrondelag_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_sv[is.na(Y_sortrondelag_sv)] <- -9

sigma_sortrondelag_sv <- polls_sortrondelag_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_sv[is.na(sigma_sortrondelag_sv)] <- -9

#sortrondelag SP
poll_sortrondelag_sp <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                         to= as.Date("2017-09-11"), 
                                                         by = "day")), poll_sortrondelag_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_sp <- polls_sortrondelag_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_sp[is.na(Y_sortrondelag_sp)] <- -9

sigma_sortrondelag_sp <- polls_sortrondelag_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_sp[is.na(sigma_sortrondelag_sp)] <- -9

#sortrondelag krf
poll_sortrondelag_krf <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                          to= as.Date("2017-09-11"), 
                                                          by = "day")), poll_sortrondelag_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_krf <- polls_sortrondelag_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_krf[is.na(Y_sortrondelag_krf)] <- -9

sigma_sortrondelag_krf <- polls_sortrondelag_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_krf[is.na(sigma_sortrondelag_krf)] <- -9

#sortrondelag V
poll_sortrondelag_v <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                        to= as.Date("2017-09-11"), 
                                                        by = "day")), poll_sortrondelag_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_v <- polls_sortrondelag_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_v[is.na(Y_sortrondelag_v)] <- -9

sigma_sortrondelag_v <- polls_sortrondelag_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_v[is.na(sigma_sortrondelag_v)] <- -9

#sortrondelag mdg
poll_sortrondelag_mdg <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                          to= as.Date("2017-09-11"), 
                                                          by = "day")), poll_sortrondelag_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_mdg <- polls_sortrondelag_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_mdg[is.na(Y_sortrondelag_mdg)] <- -9

sigma_sortrondelag_mdg <- polls_sortrondelag_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_mdg[is.na(sigma_sortrondelag_mdg)] <- -9


#sortrondelag R
poll_sortrondelag_r <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                        to= as.Date("2017-09-11"), 
                                                        by = "day")), poll_sortrondelag_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_r <- polls_sortrondelag_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_r[is.na(Y_sortrondelag_r)] <- -9

sigma_sortrondelag_r <- polls_sortrondelag_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_r[is.na(sigma_sortrondelag_r)] <- -9


#sortrondelag andre
poll_sortrondelag_a <- pp[which(pp$fylke=="sør-trøndelag" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_sortrondelag_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                        to= as.Date("2017-09-11"), 
                                                        by = "day")), poll_sortrondelag_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_sortrondelag_a <- polls_sortrondelag_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_sortrondelag_a[is.na(Y_sortrondelag_a)] <- -9

sigma_sortrondelag_a <- polls_sortrondelag_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_sortrondelag_a[is.na(sigma_sortrondelag_a)] <- -9




#####     akershus        #####
#akershus Ap
poll_akershus_ap <- pp[which(pp$fylke=="akershus" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_akershus_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_ap <- polls_akershus_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_ap[is.na(Y_akershus_ap)] <- -9

sigma_akershus_ap <- polls_akershus_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_ap[is.na(sigma_akershus_ap)] <- -9


#akershus H
poll_akershus_h <- pp[which(pp$fylke=="akershus" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_akershus_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_h <- polls_akershus_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_h[is.na(Y_akershus_h)] <- -9

sigma_akershus_h <- polls_akershus_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_h[is.na(sigma_akershus_h)] <- -9

#akershus Frp
poll_akershus_frp <- pp[which(pp$fylke=="akershus" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_akershus_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_frp <- polls_akershus_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_frp[is.na(Y_akershus_frp)] <- -9

sigma_akershus_frp <- polls_akershus_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_frp[is.na(sigma_akershus_frp)] <- -9


#akershus SV
poll_akershus_sv <- pp[which(pp$fylke=="akershus" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_akershus_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_sv <- polls_akershus_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_sv[is.na(Y_akershus_sv)] <- -9

sigma_akershus_sv <- polls_akershus_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_sv[is.na(sigma_akershus_sv)] <- -9

#akershus SP
poll_akershus_sp <- pp[which(pp$fylke=="akershus" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_akershus_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_sp <- polls_akershus_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_sp[is.na(Y_akershus_sp)] <- -9

sigma_akershus_sp <- polls_akershus_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_sp[is.na(sigma_akershus_sp)] <- -9

#akershus krf
poll_akershus_krf <- pp[which(pp$fylke=="akershus" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_akershus_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_krf <- polls_akershus_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_krf[is.na(Y_akershus_krf)] <- -9

sigma_akershus_krf <- polls_akershus_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_krf[is.na(sigma_akershus_krf)] <- -9

#akershus V
poll_akershus_v <- pp[which(pp$fylke=="akershus" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_akershus_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_v <- polls_akershus_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_v[is.na(Y_akershus_v)] <- -9

sigma_akershus_v <- polls_akershus_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_v[is.na(sigma_akershus_v)] <- -9

#akershus mdg
poll_akershus_mdg <- pp[which(pp$fylke=="akershus" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"), 
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_akershus_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_mdg <- polls_akershus_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_mdg[is.na(Y_akershus_mdg)] <- -9

sigma_akershus_mdg <- polls_akershus_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_mdg[is.na(sigma_akershus_mdg)] <- -9


#akershus R
poll_akershus_r <- pp[which(pp$fylke=="akershus" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_akershus_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_r <- polls_akershus_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_r[is.na(Y_akershus_r)] <- -9

sigma_akershus_r <- polls_akershus_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_r[is.na(sigma_akershus_r)] <- -9


#akershus andre
poll_akershus_a <- pp[which(pp$fylke=="akershus" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_akershus_a <- left_join(data_frame(date = seq(from =as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_akershus_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_akershus_a <- polls_akershus_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_akershus_a[is.na(Y_akershus_a)] <- -9

sigma_akershus_a <- polls_akershus_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_akershus_a[is.na(sigma_akershus_a)] <- -9


#####     vestfold        #####
#vestfold Ap
poll_vestfold_ap <- pp[which(pp$fylke=="vestfold" & pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_ap <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_vestfold_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_ap <- polls_vestfold_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_ap[is.na(Y_vestfold_ap)] <- -9

sigma_vestfold_ap <- polls_vestfold_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_ap[is.na(sigma_vestfold_ap)] <- -9


#vestfold H
poll_vestfold_h <- pp[which(pp$fylke=="vestfold" & pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_h <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_vestfold_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_h <- polls_vestfold_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_h[is.na(Y_vestfold_h)] <- -9

sigma_vestfold_h <- polls_vestfold_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_h[is.na(sigma_vestfold_h)] <- -9

#vestfold Frp
poll_vestfold_frp <- pp[which(pp$fylke=="vestfold" & pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_frp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_vestfold_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_frp <- polls_vestfold_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_frp[is.na(Y_vestfold_frp)] <- -9

sigma_vestfold_frp <- polls_vestfold_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_frp[is.na(sigma_vestfold_frp)] <- -9


#vestfold SV
poll_vestfold_sv <- pp[which(pp$fylke=="vestfold" & pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_sv <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_vestfold_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_sv <- polls_vestfold_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_sv[is.na(Y_vestfold_sv)] <- -9

sigma_vestfold_sv <- polls_vestfold_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_sv[is.na(sigma_vestfold_sv)] <- -9

#vestfold SP
poll_vestfold_sp <- pp[which(pp$fylke=="vestfold" & pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_sp <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                     to= as.Date("2017-09-11"), 
                                                     by = "day")), poll_vestfold_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_sp <- polls_vestfold_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_sp[is.na(Y_vestfold_sp)] <- -9

sigma_vestfold_sp <- polls_vestfold_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_sp[is.na(sigma_vestfold_sp)] <- -9

#vestfold krf
poll_vestfold_krf <- pp[which(pp$fylke=="vestfold" & pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_krf <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_vestfold_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_krf <- polls_vestfold_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_krf[is.na(Y_vestfold_krf)] <- -9

sigma_vestfold_krf <- polls_vestfold_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_krf[is.na(sigma_vestfold_krf)] <- -9

#vestfold V
poll_vestfold_v <- pp[which(pp$fylke=="vestfold" & pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_v <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_vestfold_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_v <- polls_vestfold_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_v[is.na(Y_vestfold_v)] <- -9

sigma_vestfold_v <- polls_vestfold_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_v[is.na(sigma_vestfold_v)] <- -9

#vestfold mdg
poll_vestfold_mdg <- pp[which(pp$fylke=="vestfold" & pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_mdg <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                      to= as.Date("2017-09-11"), 
                                                      by = "day")), poll_vestfold_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_mdg <- polls_vestfold_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_mdg[is.na(Y_vestfold_mdg)] <- -9

sigma_vestfold_mdg <- polls_vestfold_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_mdg[is.na(sigma_vestfold_mdg)] <- -9


#vestfold R
poll_vestfold_r <- pp[which(pp$fylke=="vestfold" & pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_r <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_vestfold_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_r <- polls_vestfold_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_r[is.na(Y_vestfold_r)] <- -9

sigma_vestfold_r <- polls_vestfold_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_r[is.na(sigma_vestfold_r)] <- -9


#vestfold andre
poll_vestfold_a <- pp[which(pp$fylke=="vestfold" & pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_vestfold_a <- left_join(data_frame(date = seq(from = as.Date("2017-01-01"),
                                                    to= as.Date("2017-09-11"), 
                                                    by = "day")), poll_vestfold_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_vestfold_a <- polls_vestfold_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_vestfold_a[is.na(Y_vestfold_a)] <- -9

sigma_vestfold_a <- polls_vestfold_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_vestfold_a[is.na(sigma_vestfold_a)] <- -9



##### STAN    #####
state_space_model <- stan("state_space_polls_hg.stan", iter=1e4,
                   #chains=4,
                   data = list(T = nrow(Y_oslo_ap), 
                               
                               
                               polls = 1,
                               polls2 = 2,
                               
                               
                               Y_oslo_ap     = Y_oslo_ap, 
                               sigma_oslo_ap = sigma_oslo_ap,
                               initial_prior_oslo_ap = 36.6,
                               
                               Y_oslo_h     = Y_oslo_h, 
                               sigma_oslo_h = sigma_oslo_h,
                               initial_prior_oslo_h = 28.5,
                               
                               Y_oslo_frp     = Y_oslo_frp, 
                               sigma_oslo_frp = sigma_oslo_frp,
                               initial_prior_oslo_frp = 8.4,
                               
                               Y_oslo_sv     = Y_oslo_sv, 
                               sigma_oslo_sv = sigma_oslo_sv,
                               initial_prior_oslo_sv = 6.6,
                               
                               Y_oslo_sp     = Y_oslo_sp, 
                               sigma_oslo_sp = sigma_oslo_sp,
                               initial_prior_oslo_sp = 1.2,
                               
                               Y_oslo_krf     = Y_oslo_krf, 
                               sigma_oslo_krf = sigma_oslo_krf,
                               initial_prior_oslo_krf = 1.9,
                               
                               Y_oslo_v     = Y_oslo_v, 
                               sigma_oslo_v = sigma_oslo_v,
                               initial_prior_oslo_v = 8.0,
                               
                               Y_oslo_mdg     = Y_oslo_mdg, 
                               sigma_oslo_mdg = sigma_oslo_mdg,
                               initial_prior_oslo_mdg = 5.7,
                               
                               Y_oslo_r     = Y_oslo_r, 
                               sigma_oslo_r = sigma_oslo_r,
                               initial_prior_oslo_r = 4.2,
                               
                               Y_oslo_a     = Y_oslo_a, 
                               sigma_oslo_a = sigma_oslo_a,
                               initial_prior_oslo_a = 0.9,
                               
                               #Finnmark
                               Y_finnmark_ap     = Y_finnmark_ap, 
                               sigma_finnmark_ap = sigma_finnmark_ap,
                               initial_prior_finnmark_ap = 43.2,
                               
                               Y_finnmark_h     = Y_finnmark_h, 
                               sigma_finnmark_h = sigma_finnmark_h,
                               initial_prior_finnmark_h = 15.4,
                               
                               Y_finnmark_frp     = Y_finnmark_frp, 
                               sigma_finnmark_frp = sigma_finnmark_frp,
                               initial_prior_finnmark_frp = 15.6,
                               
                               Y_finnmark_sv     = Y_finnmark_sv, 
                               sigma_finnmark_sv = sigma_finnmark_sv,
                               initial_prior_finnmark_sv = 6.3,
                               
                               Y_finnmark_sp     = Y_finnmark_sp, 
                               sigma_finnmark_sp = sigma_finnmark_sp,
                               initial_prior_finnmark_sp = 5.1,
                               
                               Y_finnmark_krf     = Y_finnmark_krf, 
                               sigma_finnmark_krf = sigma_finnmark_krf,
                               initial_prior_finnmark_krf = 3.5,
                               
                               Y_finnmark_v     = Y_finnmark_v, 
                               sigma_finnmark_v = sigma_finnmark_v,
                               initial_prior_finnmark_v = 2.7,
                               
                               Y_finnmark_mdg     = Y_finnmark_mdg, 
                               sigma_finnmark_mdg = sigma_finnmark_mdg,
                               initial_prior_finnmark_mdg = 3.2,
                               
                               Y_finnmark_r     = Y_finnmark_r, 
                               sigma_finnmark_r = sigma_finnmark_r,
                               initial_prior_finnmark_r = 1.9,
                               
                               Y_finnmark_a     = Y_finnmark_a, 
                               sigma_finnmark_a = sigma_finnmark_a,
                               initial_prior_finnmark_a = 3.1,
                               
                               
                               #nordland
                               Y_nordland_ap     = Y_nordland_ap, 
                               sigma_nordland_ap = sigma_nordland_ap,
                               initial_prior_nordland_ap = 37.9,
                               
                               Y_nordland_h     = Y_nordland_h, 
                               sigma_nordland_h = sigma_nordland_h,
                               initial_prior_nordland_h = 16.1,
                               
                               Y_nordland_frp     = Y_nordland_frp, 
                               sigma_nordland_frp = sigma_nordland_frp,
                               initial_prior_nordland_frp = 11.1,
                               
                               Y_nordland_sv     = Y_nordland_sv, 
                               sigma_nordland_sv = sigma_nordland_sv,
                               initial_prior_nordland_sv = 6.0,
                               
                               Y_nordland_sp     = Y_nordland_sp, 
                               sigma_nordland_sp = sigma_nordland_sp,
                               initial_prior_nordland_sp = 13.4,
                               
                               Y_nordland_krf     = Y_nordland_krf, 
                               sigma_nordland_krf = sigma_nordland_krf,
                               initial_prior_nordland_krf = 4.9,
                               
                               Y_nordland_v     = Y_nordland_v, 
                               sigma_nordland_v = sigma_nordland_v,
                               initial_prior_nordland_v = 2.3,
                               
                               Y_nordland_mdg     = Y_nordland_mdg, 
                               sigma_nordland_mdg = sigma_nordland_mdg,
                               initial_prior_nordland_mdg = 2.6,
                               
                               Y_nordland_r     = Y_nordland_r, 
                               sigma_nordland_r = sigma_nordland_r,
                               initial_prior_nordland_r = 3.0,
                               
                               Y_nordland_a     = Y_nordland_a, 
                               sigma_nordland_a = sigma_nordland_a,
                               initial_prior_nordland_a = 2.7,
                               
                               #troms
                               Y_troms_ap     = Y_troms_ap, 
                               sigma_troms_ap = sigma_troms_ap,
                               initial_prior_troms_ap = 37.5,
                               
                               Y_troms_h     = Y_troms_h, 
                               sigma_troms_h = sigma_troms_h,
                               initial_prior_troms_h = 16.4,
                               
                               Y_troms_frp     = Y_troms_frp, 
                               sigma_troms_frp = sigma_troms_frp,
                               initial_prior_troms_frp = 13.3,
                               
                               Y_troms_sv     = Y_troms_sv, 
                               sigma_troms_sv = sigma_troms_sv,
                               initial_prior_troms_sv = 6.8,
                               
                               Y_troms_sp     = Y_troms_sp, 
                               sigma_troms_sp = sigma_troms_sp,
                               initial_prior_troms_sp = 9.5,
                               
                               Y_troms_krf     = Y_troms_krf, 
                               sigma_troms_krf = sigma_troms_krf,
                               initial_prior_troms_krf = 5.0,
                               
                               Y_troms_v     = Y_troms_v, 
                               sigma_troms_v = sigma_troms_v,
                               initial_prior_troms_v = 3.8,
                               
                               Y_troms_mdg     = Y_troms_mdg, 
                               sigma_troms_mdg = sigma_troms_mdg,
                               initial_prior_troms_mdg = 2.3,
                               
                               Y_troms_r     = Y_troms_r, 
                               sigma_troms_r = sigma_troms_r,
                               initial_prior_troms_r = 3.7,
                               
                               Y_troms_a     = Y_troms_a, 
                               sigma_troms_a = sigma_troms_a,
                               initial_prior_troms_a = 1.8,
                               
                               #telemark
                               Y_telemark_ap     = Y_telemark_ap, 
                               sigma_telemark_ap = sigma_telemark_ap,
                               initial_prior_telemark_ap = 36.7,
                               
                               Y_telemark_h     = Y_telemark_h, 
                               sigma_telemark_h = sigma_telemark_h,
                               initial_prior_telemark_h = 21.8,
                               
                               Y_telemark_frp     = Y_telemark_frp, 
                               sigma_telemark_frp = sigma_telemark_frp,
                               initial_prior_telemark_frp = 19.0,
                               
                               Y_telemark_sv     = Y_telemark_sv, 
                               sigma_telemark_sv = sigma_telemark_sv,
                               initial_prior_telemark_sv = 3.3,
                               
                               Y_telemark_sp     = Y_telemark_sp, 
                               sigma_telemark_sp = sigma_telemark_sp,
                               initial_prior_telemark_sp = 4.5,
                               
                               Y_telemark_krf     = Y_telemark_krf, 
                               sigma_telemark_krf = sigma_telemark_krf,
                               initial_prior_telemark_krf = 6.8,
                               
                               Y_telemark_v     = Y_telemark_v, 
                               sigma_telemark_v = sigma_telemark_v,
                               initial_prior_telemark_v = 3.5,
                               
                               Y_telemark_mdg     = Y_telemark_mdg, 
                               sigma_telemark_mdg = sigma_telemark_mdg,
                               initial_prior_telemark_mdg = 2.2,
                               
                               Y_telemark_r     = Y_telemark_r, 
                               sigma_telemark_r = sigma_telemark_r,
                               initial_prior_telemark_r = 0.9,
                               
                               Y_telemark_a     = Y_telemark_a, 
                               sigma_telemark_a = sigma_telemark_a,
                               initial_prior_telemark_a = 1.5,
                               
                               #oppland
                               Y_oppland_ap     = Y_oppland_ap, 
                               sigma_oppland_ap = sigma_oppland_ap,
                               initial_prior_oppland_ap = 47.2,
                               
                               Y_oppland_h     = Y_oppland_h, 
                               sigma_oppland_h = sigma_oppland_h,
                               initial_prior_oppland_h = 14.9,
                               
                               Y_oppland_frp     = Y_oppland_frp, 
                               sigma_oppland_frp = sigma_oppland_frp,
                               initial_prior_oppland_frp = 10.6,
                               
                               Y_oppland_sv     = Y_oppland_sv, 
                               sigma_oppland_sv = sigma_oppland_sv,
                               initial_prior_oppland_sv = 3.2,
                               
                               Y_oppland_sp     = Y_oppland_sp, 
                               sigma_oppland_sp = sigma_oppland_sp,
                               initial_prior_oppland_sp = 14.1,
                               
                               Y_oppland_krf     = Y_oppland_krf, 
                               sigma_oppland_krf = sigma_oppland_krf,
                               initial_prior_oppland_krf = 3.1,
                               
                               Y_oppland_v     = Y_oppland_v, 
                               sigma_oppland_v = sigma_oppland_v,
                               initial_prior_oppland_v = 2.0,
                               
                               Y_oppland_mdg     = Y_oppland_mdg, 
                               sigma_oppland_mdg = sigma_oppland_mdg,
                               initial_prior_oppland_mdg = 2.0,
                               
                               Y_oppland_r     = Y_oppland_r, 
                               sigma_oppland_r = sigma_oppland_r,
                               initial_prior_oppland_r = 1.7,
                               
                               Y_oppland_a     = Y_oppland_a, 
                               sigma_oppland_a = sigma_oppland_a,
                               initial_prior_oppland_a = 0.3,
                               
                               #buskerud
                               Y_buskerud_ap     = Y_buskerud_ap, 
                               sigma_buskerud_ap = sigma_buskerud_ap,
                               initial_prior_buskerud_ap = 31.8,
                               
                               Y_buskerud_h     = Y_buskerud_h, 
                               sigma_buskerud_h = sigma_buskerud_h,
                               initial_prior_buskerud_h = 29.0,
                               
                               Y_buskerud_frp     = Y_buskerud_frp, 
                               sigma_buskerud_frp = sigma_buskerud_frp,
                               initial_prior_buskerud_frp = 18.6,
                               
                               Y_buskerud_sv     = Y_buskerud_sv, 
                               sigma_buskerud_sv = sigma_buskerud_sv,
                               initial_prior_buskerud_sv = 2.7,
                               
                               Y_buskerud_sp     = Y_buskerud_sp, 
                               sigma_buskerud_sp = sigma_buskerud_sp,
                               initial_prior_buskerud_sp = 6.1,
                               
                               Y_buskerud_krf     = Y_buskerud_krf, 
                               sigma_buskerud_krf = sigma_buskerud_krf,
                               initial_prior_buskerud_krf = 3.2,
                               
                               Y_buskerud_v     = Y_buskerud_v, 
                               sigma_buskerud_v = sigma_buskerud_v,
                               initial_prior_buskerud_v = 4.6,
                               
                               Y_buskerud_mdg     = Y_buskerud_mdg, 
                               sigma_buskerud_mdg = sigma_buskerud_mdg,
                               initial_prior_buskerud_mdg = 2.2,
                               
                               Y_buskerud_r     = Y_buskerud_r, 
                               sigma_buskerud_r = sigma_buskerud_r,
                               initial_prior_buskerud_r = 0.6,
                               
                               Y_buskerud_a     = Y_buskerud_a, 
                               sigma_buskerud_a = sigma_buskerud_a,
                               initial_prior_buskerud_a = 1.1,
                               
                               
                               #hordaland
                               Y_hordaland_ap     = Y_hordaland_ap, 
                               sigma_hordaland_ap = sigma_hordaland_ap,
                               initial_prior_hordaland_ap = 35.5,
                               
                               Y_hordaland_h     = Y_hordaland_h, 
                               sigma_hordaland_h = sigma_hordaland_h,
                               initial_prior_hordaland_h = 25.2,
                               
                               Y_hordaland_frp     = Y_hordaland_frp, 
                               sigma_hordaland_frp = sigma_hordaland_frp,
                               initial_prior_hordaland_frp = 11.7,
                               
                               Y_hordaland_sv     = Y_hordaland_sv, 
                               sigma_hordaland_sv = sigma_hordaland_sv,
                               initial_prior_hordaland_sv = 4.3,
                               
                               Y_hordaland_sp     = Y_hordaland_sp, 
                               sigma_hordaland_sp = sigma_hordaland_sp,
                               initial_prior_hordaland_sp = 5.4,
                               
                               Y_hordaland_krf     = Y_hordaland_krf, 
                               sigma_hordaland_krf = sigma_hordaland_krf,
                               initial_prior_hordaland_krf = 7.2,
                               
                               Y_hordaland_v     = Y_hordaland_v, 
                               sigma_hordaland_v = sigma_hordaland_v,
                               initial_prior_hordaland_v = 4.8,
                               
                               Y_hordaland_mdg     = Y_hordaland_mdg, 
                               sigma_hordaland_mdg = sigma_hordaland_mdg,
                               initial_prior_hordaland_mdg = 3.0,
                               
                               Y_hordaland_r     = Y_hordaland_r, 
                               sigma_hordaland_r = sigma_hordaland_r,
                               initial_prior_hordaland_r = 0.9,
                               
                               Y_hordaland_a     = Y_hordaland_a, 
                               sigma_hordaland_a = sigma_hordaland_a,
                               initial_prior_hordaland_a = 2.0,
                               
                               #sogn
                               Y_sogn_ap     = Y_sogn_ap, 
                               sigma_sogn_ap = sigma_sogn_ap,
                               initial_prior_sogn_ap = 30.0,
                               
                               Y_sogn_h     = Y_sogn_h, 
                               sigma_sogn_h = sigma_sogn_h,
                               initial_prior_sogn_h = 17.4,
                               
                               Y_sogn_frp     = Y_sogn_frp, 
                               sigma_sogn_frp = sigma_sogn_frp,
                               initial_prior_sogn_frp = 11.2,
                               
                               Y_sogn_sv     = Y_sogn_sv, 
                               sigma_sogn_sv = sigma_sogn_sv,
                               initial_prior_sogn_sv = 3.3,
                               
                               Y_sogn_sp     = Y_sogn_sp, 
                               sigma_sogn_sp = sigma_sogn_sp,
                               initial_prior_sogn_sp = 21.1,
                               
                               Y_sogn_krf     = Y_sogn_krf, 
                               sigma_sogn_krf = sigma_sogn_krf,
                               initial_prior_sogn_krf = 7.2,
                               
                               Y_sogn_v     = Y_sogn_v, 
                               sigma_sogn_v = sigma_sogn_v,
                               initial_prior_sogn_v = 5.6,
                               
                               Y_sogn_mdg     = Y_sogn_mdg, 
                               sigma_sogn_mdg = sigma_sogn_mdg,
                               initial_prior_sogn_mdg = 1.6,
                               
                               Y_sogn_r     = Y_sogn_r, 
                               sigma_sogn_r = sigma_sogn_r,
                               initial_prior_sogn_r = 0.8,
                               
                               Y_sogn_a     = Y_sogn_a, 
                               sigma_sogn_a = sigma_sogn_a,
                               initial_prior_sogn_a = 1.5,
                               
                               #austagder
                               Y_austagder_ap     = Y_austagder_ap, 
                               sigma_austagder_ap = sigma_austagder_ap,
                               initial_prior_austagder_ap = 33.7,
                               
                               Y_austagder_h     = Y_austagder_h, 
                               sigma_austagder_h = sigma_austagder_h,
                               initial_prior_austagder_h = 22.2,
                               
                               Y_austagder_frp     = Y_austagder_frp, 
                               sigma_austagder_frp = sigma_austagder_frp,
                               initial_prior_austagder_frp = 17.2,
                               
                               Y_austagder_sv     = Y_austagder_sv, 
                               sigma_austagder_sv = sigma_austagder_sv,
                               initial_prior_austagder_sv = 3.1,
                               
                               Y_austagder_sp     = Y_austagder_sp, 
                               sigma_austagder_sp = sigma_austagder_sp,
                               initial_prior_austagder_sp = 5.2,
                               
                               Y_austagder_krf     = Y_austagder_krf, 
                               sigma_austagder_krf = sigma_austagder_krf,
                               initial_prior_austagder_krf = 8.5,
                               
                               Y_austagder_v     = Y_austagder_v, 
                               sigma_austagder_v = sigma_austagder_v,
                               initial_prior_austagder_v = 5.5,
                               
                               Y_austagder_mdg     = Y_austagder_mdg, 
                               sigma_austagder_mdg = sigma_austagder_mdg,
                               initial_prior_austagder_mdg = 2.6,
                               
                               Y_austagder_r     = Y_austagder_r, 
                               sigma_austagder_r = sigma_austagder_r,
                               initial_prior_austagder_r = 0.7,
                               
                               Y_austagder_a     = Y_austagder_a, 
                               sigma_austagder_a = sigma_austagder_a,
                               initial_prior_austagder_a = 1.1,
                               
                               
                               #vestagder
                               Y_vestagder_ap     = Y_vestagder_ap, 
                               sigma_vestagder_ap = sigma_vestagder_ap,
                               initial_prior_vestagder_ap = 26.6,
                               
                               Y_vestagder_h     = Y_vestagder_h, 
                               sigma_vestagder_h = sigma_vestagder_h,
                               initial_prior_vestagder_h = 26.3,
                               
                               Y_vestagder_frp     = Y_vestagder_frp, 
                               sigma_vestagder_frp = sigma_vestagder_frp,
                               initial_prior_vestagder_frp = 17.4,
                               
                               Y_vestagder_sv     = Y_vestagder_sv, 
                               sigma_vestagder_sv = sigma_vestagder_sv,
                               initial_prior_vestagder_sv = 3.0,
                               
                               Y_vestagder_sp     = Y_vestagder_sp, 
                               sigma_vestagder_sp = sigma_vestagder_sp,
                               initial_prior_vestagder_sp = 3.7,
                               
                               Y_vestagder_krf     = Y_vestagder_krf, 
                               sigma_vestagder_krf = sigma_vestagder_krf,
                               initial_prior_vestagder_krf = 15.1,
                               
                               Y_vestagder_v     = Y_vestagder_v, 
                               sigma_vestagder_v = sigma_vestagder_v,
                               initial_prior_vestagder_v = 3.1,
                               
                               Y_vestagder_mdg     = Y_vestagder_mdg, 
                               sigma_vestagder_mdg = sigma_vestagder_mdg,
                               initial_prior_vestagder_mdg = 2.6,
                               
                               Y_vestagder_r     = Y_vestagder_r, 
                               sigma_vestagder_r = sigma_vestagder_r,
                               initial_prior_vestagder_r = 1.1,
                               
                               Y_vestagder_a     = Y_vestagder_a, 
                               sigma_vestagder_a = sigma_vestagder_a,
                               initial_prior_vestagder_a = 0.7,
                               
                               #rogaland
                               Y_rogaland_ap     = Y_rogaland_ap, 
                               sigma_rogaland_ap = sigma_rogaland_ap,
                               initial_prior_rogaland_ap = 29.5,
                               
                               Y_rogaland_h     = Y_rogaland_h, 
                               sigma_rogaland_h = sigma_rogaland_h,
                               initial_prior_rogaland_h = 28.0,
                               
                               Y_rogaland_frp     = Y_rogaland_frp, 
                               sigma_rogaland_frp = sigma_rogaland_frp,
                               initial_prior_rogaland_frp = 15.2,
                               
                               Y_rogaland_sv     = Y_rogaland_sv, 
                               sigma_rogaland_sv = sigma_rogaland_sv,
                               initial_prior_rogaland_sv = 2.7,
                               
                               Y_rogaland_sp     = Y_rogaland_sp, 
                               sigma_rogaland_sp = sigma_rogaland_sp,
                               initial_prior_rogaland_sp = 5.7,
                               
                               Y_rogaland_krf     = Y_rogaland_krf, 
                               sigma_rogaland_krf = sigma_rogaland_krf,
                               initial_prior_rogaland_krf = 10.0,
                               
                               Y_rogaland_v     = Y_rogaland_v, 
                               sigma_rogaland_v = sigma_rogaland_v,
                               initial_prior_rogaland_v = 3.9,
                               
                               Y_rogaland_mdg     = Y_rogaland_mdg, 
                               sigma_rogaland_mdg = sigma_rogaland_mdg,
                               initial_prior_rogaland_mdg = 2.2,
                               
                               Y_rogaland_r     = Y_rogaland_r, 
                               sigma_rogaland_r = sigma_rogaland_r,
                               initial_prior_rogaland_r = 1.3,
                               
                               Y_rogaland_a     = Y_rogaland_a, 
                               sigma_rogaland_a = sigma_rogaland_a,
                               initial_prior_rogaland_a = 1.7,
                               
                               
                               
                               #nordtrondelag
                               Y_nordtrondelag_ap     = Y_nordtrondelag_ap, 
                               sigma_nordtrondelag_ap = sigma_nordtrondelag_ap,
                               initial_prior_nordtrondelag_ap = 42.4,
                               
                               Y_nordtrondelag_h     = Y_nordtrondelag_h, 
                               sigma_nordtrondelag_h = sigma_nordtrondelag_h,
                               initial_prior_nordtrondelag_h = 12.1,
                               
                               Y_nordtrondelag_frp     = Y_nordtrondelag_frp, 
                               sigma_nordtrondelag_frp = sigma_nordtrondelag_frp,
                               initial_prior_nordtrondelag_frp = 9.2,
                               
                               Y_nordtrondelag_sv     = Y_nordtrondelag_sv, 
                               sigma_nordtrondelag_sv = sigma_nordtrondelag_sv,
                               initial_prior_nordtrondelag_sv = 6.2,
                               
                               Y_nordtrondelag_sp     = Y_nordtrondelag_sp, 
                               sigma_nordtrondelag_sp = sigma_nordtrondelag_sp,
                               initial_prior_nordtrondelag_sp = 19.1,
                               
                               Y_nordtrondelag_krf     = Y_nordtrondelag_krf, 
                               sigma_nordtrondelag_krf = sigma_nordtrondelag_krf,
                               initial_prior_nordtrondelag_krf = 2.9,
                               
                               Y_nordtrondelag_v     = Y_nordtrondelag_v, 
                               sigma_nordtrondelag_v = sigma_nordtrondelag_v,
                               initial_prior_nordtrondelag_v = 6.3,
                               
                               Y_nordtrondelag_mdg     = Y_nordtrondelag_mdg, 
                               sigma_nordtrondelag_mdg = sigma_nordtrondelag_mdg,
                               initial_prior_nordtrondelag_mdg = 1.0,
                               
                               Y_nordtrondelag_r     = Y_nordtrondelag_r, 
                               sigma_nordtrondelag_r = sigma_nordtrondelag_r,
                               initial_prior_nordtrondelag_r = 0.4,
                               
                               Y_nordtrondelag_a     = Y_nordtrondelag_a, 
                               sigma_nordtrondelag_a = sigma_nordtrondelag_a,
                               initial_prior_nordtrondelag_a = 0.5,
                               
                               
                               #hedmark
                               Y_hedmark_ap     = Y_hedmark_ap, 
                               sigma_hedmark_ap = sigma_hedmark_ap,
                               initial_prior_hedmark_ap = 43.2,
                               
                               Y_hedmark_h     = Y_hedmark_h, 
                               sigma_hedmark_h = sigma_hedmark_h,
                               initial_prior_hedmark_h = 18.3,
                               
                               Y_hedmark_frp     = Y_hedmark_frp, 
                               sigma_hedmark_frp = sigma_hedmark_frp,
                               initial_prior_hedmark_frp = 13.6,
                               
                               Y_hedmark_sv     = Y_hedmark_sv, 
                               sigma_hedmark_sv = sigma_hedmark_sv,
                               initial_prior_hedmark_sv = 3.9,
                               
                               Y_hedmark_sp     = Y_hedmark_sp, 
                               sigma_hedmark_sp = sigma_hedmark_sp,
                               initial_prior_hedmark_sp = 10.2,
                               
                               Y_hedmark_krf     = Y_hedmark_krf, 
                               sigma_hedmark_krf = sigma_hedmark_krf,
                               initial_prior_hedmark_krf = 2.5,
                               
                               Y_hedmark_v     = Y_hedmark_v, 
                               sigma_hedmark_v = sigma_hedmark_v,
                               initial_prior_hedmark_v = 3.4,
                               
                               Y_hedmark_mdg     = Y_hedmark_mdg, 
                               sigma_hedmark_mdg = sigma_hedmark_mdg,
                               initial_prior_hedmark_mdg = 2.0,
                               
                               Y_hedmark_r     = Y_hedmark_r, 
                               sigma_hedmark_r = sigma_hedmark_r,
                               initial_prior_hedmark_r = 0.7,
                               
                               Y_hedmark_a     = Y_hedmark_a, 
                               sigma_hedmark_a = sigma_hedmark_a,
                               initial_prior_hedmark_a = 2.4,
                               
                               
                               #ostfold
                               Y_ostfold_ap     = Y_ostfold_ap, 
                               sigma_ostfold_ap = sigma_ostfold_ap,
                               initial_prior_ostfold_ap = 39.0,
                               
                               Y_ostfold_h     = Y_ostfold_h, 
                               sigma_ostfold_h = sigma_ostfold_h,
                               initial_prior_ostfold_h = 21.8,
                               
                               Y_ostfold_frp     = Y_ostfold_frp, 
                               sigma_ostfold_frp = sigma_ostfold_frp,
                               initial_prior_ostfold_frp = 19.0,
                               
                               Y_ostfold_sv     = Y_ostfold_sv, 
                               sigma_ostfold_sv = sigma_ostfold_sv,
                               initial_prior_ostfold_sv = 2.7,
                               
                               Y_ostfold_sp     = Y_ostfold_sp, 
                               sigma_ostfold_sp = sigma_ostfold_sp,
                               initial_prior_ostfold_sp = 4.3,
                               
                               Y_ostfold_krf     = Y_ostfold_krf, 
                               sigma_ostfold_krf = sigma_ostfold_krf,
                               initial_prior_ostfold_krf = 5.2,
                               
                               Y_ostfold_v     = Y_ostfold_v, 
                               sigma_ostfold_v = sigma_ostfold_v,
                               initial_prior_ostfold_v = 2.7,
                               
                               Y_ostfold_mdg     = Y_ostfold_mdg, 
                               sigma_ostfold_mdg = sigma_ostfold_mdg,
                               initial_prior_ostfold_mdg = 2.4,
                               
                               Y_ostfold_r     = Y_ostfold_r, 
                               sigma_ostfold_r = sigma_ostfold_r,
                               initial_prior_ostfold_r = 2.1,
                               
                               Y_ostfold_a     = Y_ostfold_a, 
                               sigma_ostfold_a = sigma_ostfold_a,
                               initial_prior_ostfold_a = 0.9,
                               
                               #romsdal
                               Y_romsdal_ap     = Y_romsdal_ap, 
                               sigma_romsdal_ap = sigma_romsdal_ap,
                               initial_prior_romsdal_ap = 33.8,
                               
                               Y_romsdal_h     = Y_romsdal_h, 
                               sigma_romsdal_h = sigma_romsdal_h,
                               initial_prior_romsdal_h = 23.7,
                               
                               Y_romsdal_frp     = Y_romsdal_frp, 
                               sigma_romsdal_frp = sigma_romsdal_frp,
                               initial_prior_romsdal_frp = 16.8,
                               
                               Y_romsdal_sv     = Y_romsdal_sv, 
                               sigma_romsdal_sv = sigma_romsdal_sv,
                               initial_prior_romsdal_sv = 2.7,
                               
                               Y_romsdal_sp     = Y_romsdal_sp, 
                               sigma_romsdal_sp = sigma_romsdal_sp,
                               initial_prior_romsdal_sp = 10.5,
                               
                               Y_romsdal_krf     = Y_romsdal_krf, 
                               sigma_romsdal_krf = sigma_romsdal_krf,
                               initial_prior_romsdal_krf = 6.5,
                               
                               Y_romsdal_v     = Y_romsdal_v, 
                               sigma_romsdal_v = sigma_romsdal_v,
                               initial_prior_romsdal_v = 2.4,
                               
                               Y_romsdal_mdg     = Y_romsdal_mdg, 
                               sigma_romsdal_mdg = sigma_romsdal_mdg,
                               initial_prior_romsdal_mdg = 0.7,
                               
                               Y_romsdal_r     = Y_romsdal_r, 
                               sigma_romsdal_r = sigma_romsdal_r,
                               initial_prior_romsdal_r = 0.0,
                               
                               Y_romsdal_a     = Y_romsdal_a, 
                               sigma_romsdal_a = sigma_romsdal_a,
                               initial_prior_romsdal_a = 2.7,
                               
                               
                               #sortrondelag
                               Y_sortrondelag_ap     = Y_sortrondelag_ap, 
                               sigma_sortrondelag_ap = sigma_sortrondelag_ap,
                               initial_prior_sortrondelag_ap = 40.9,
                               
                               Y_sortrondelag_h     = Y_sortrondelag_h, 
                               sigma_sortrondelag_h = sigma_sortrondelag_h,
                               initial_prior_sortrondelag_h = 19.7,
                               
                               Y_sortrondelag_frp     = Y_sortrondelag_frp, 
                               sigma_sortrondelag_frp = sigma_sortrondelag_frp,
                               initial_prior_sortrondelag_frp = 12.0,
                               
                               Y_sortrondelag_sv     = Y_sortrondelag_sv, 
                               sigma_sortrondelag_sv = sigma_sortrondelag_sv,
                               initial_prior_sortrondelag_sv = 6.9,
                               
                               Y_sortrondelag_sp     = Y_sortrondelag_sp, 
                               sigma_sortrondelag_sp = sigma_sortrondelag_sp,
                               initial_prior_sortrondelag_sp = 6.0,
                               
                               Y_sortrondelag_krf     = Y_sortrondelag_krf, 
                               sigma_sortrondelag_krf = sigma_sortrondelag_krf,
                               initial_prior_sortrondelag_krf = 3.3,
                               
                               Y_sortrondelag_v     = Y_sortrondelag_v, 
                               sigma_sortrondelag_v = sigma_sortrondelag_v,
                               initial_prior_sortrondelag_v = 4.3,
                               
                               Y_sortrondelag_mdg     = Y_sortrondelag_mdg, 
                               sigma_sortrondelag_mdg = sigma_sortrondelag_mdg,
                               initial_prior_sortrondelag_mdg = 3.8,
                               
                               Y_sortrondelag_r     = Y_sortrondelag_r, 
                               sigma_sortrondelag_r = sigma_sortrondelag_r,
                               initial_prior_sortrondelag_r = 1.0,
                               
                               Y_sortrondelag_a     = Y_sortrondelag_a, 
                               sigma_sortrondelag_a = sigma_sortrondelag_a,
                               initial_prior_sortrondelag_a = 2.1,
                               
                               #akershus
                               Y_akershus_ap     = Y_akershus_ap, 
                               sigma_akershus_ap = sigma_akershus_ap,
                               initial_prior_akershus_ap = 28.4,
                               
                               Y_akershus_h     = Y_akershus_h, 
                               sigma_akershus_h = sigma_akershus_h,
                               initial_prior_akershus_h = 33.9,
                               
                               Y_akershus_frp     = Y_akershus_frp, 
                               sigma_akershus_frp = sigma_akershus_frp,
                               initial_prior_akershus_frp = 17.0,
                               
                               Y_akershus_sv     = Y_akershus_sv, 
                               sigma_akershus_sv = sigma_akershus_sv,
                               initial_prior_akershus_sv = 3.5,
                               
                               Y_akershus_sp     = Y_akershus_sp, 
                               sigma_akershus_sp = sigma_akershus_sp,
                               initial_prior_akershus_sp = 2.5,
                               
                               Y_akershus_krf     = Y_akershus_krf, 
                               sigma_akershus_krf = sigma_akershus_krf,
                               initial_prior_akershus_krf = 3.2,
                               
                               Y_akershus_v     = Y_akershus_v, 
                               sigma_akershus_v = sigma_akershus_v,
                               initial_prior_akershus_v = 6.3,
                               
                               Y_akershus_mdg     = Y_akershus_mdg, 
                               sigma_akershus_mdg = sigma_akershus_mdg,
                               initial_prior_akershus_mdg = 3.1,
                               
                               Y_akershus_r     = Y_akershus_r, 
                               sigma_akershus_r = sigma_akershus_r,
                               initial_prior_akershus_r = 0.7,
                               
                               Y_akershus_a     = Y_akershus_a, 
                               sigma_akershus_a = sigma_akershus_a,
                               initial_prior_akershus_a = 1.4,
                               
                               
                               #vestfold
                               Y_vestfold_ap     = Y_vestfold_ap, 
                               sigma_vestfold_ap = sigma_vestfold_ap,
                               initial_prior_vestfold_ap = 29.6,
                               
                               Y_vestfold_h     = Y_vestfold_h, 
                               sigma_vestfold_h = sigma_vestfold_h,
                               initial_prior_vestfold_h = 30.0,
                               
                               Y_vestfold_frp     = Y_vestfold_frp, 
                               sigma_vestfold_frp = sigma_vestfold_frp,
                               initial_prior_vestfold_frp = 19.5,
                               
                               Y_vestfold_sv     = Y_vestfold_sv, 
                               sigma_vestfold_sv = sigma_vestfold_sv,
                               initial_prior_vestfold_sv = 3.8,
                               
                               Y_vestfold_sp     = Y_vestfold_sp, 
                               sigma_vestfold_sp = sigma_vestfold_sp,
                               initial_prior_vestfold_sp = 3.0,
                               
                               Y_vestfold_krf     = Y_vestfold_krf, 
                               sigma_vestfold_krf = sigma_vestfold_krf,
                               initial_prior_vestfold_krf = 4.9,
                               
                               Y_vestfold_v     = Y_vestfold_v, 
                               sigma_vestfold_v = sigma_vestfold_v,
                               initial_prior_vestfold_v = 4.5,
                               
                               Y_vestfold_mdg     = Y_vestfold_mdg, 
                               sigma_vestfold_mdg = sigma_vestfold_mdg,
                               initial_prior_vestfold_mdg = 2.5,
                               
                               Y_vestfold_r     = Y_vestfold_r, 
                               sigma_vestfold_r = sigma_vestfold_r,
                               initial_prior_vestfold_r = 0.7,
                               
                               Y_vestfold_a     = Y_vestfold_a, 
                               sigma_vestfold_a = sigma_vestfold_a,
                               initial_prior_vestfold_a = 1.4
                               ))

#
munames <- gsub("Y_", "mu_", grep("Y_", ls(), value=TRUE))
munames <- paste0("mu_oslo_",
                  c("ap","h", "frp", "sv", "sp", "krf", "v", "mdg", "r", "a"))
musum <- data.frame(summary(state_space_model, pars = munames)$summary)
munames <- paste0("mu_oslo_",c("ap","h", "frp", "sv", "sp", "krf", "v", "mdg", "r", "andre"))
musum$id <- paste0(gsub("[^a-zA-Z_]+","", rownames(musum)), rep(unique(paste0(polls_oslo_ap$date)), length(munames)))
musum$id <- gsub("_a2017", "_andre2017", musum$id)

electionday <- musum[grep("2017-09-11", musum$id),]
musum$fylke<- gsub("mu_([a-zA-Z]+)_.*", "\\1", musum$id)

fylketrender <- as.list(rep(NA, length(unique(musum$fylke))))
fylketrender <- split( musum , f = musum$fylke )
names(fylketrender) <- unique(musum$fylke)

save(fylketrender, file="fylketrender.rdata")
save(electionday, file="electionday.rdata")


#
electiondayiterations <- extract(state_space_model, pars=munames)
electiondayits <- as.list(rep(NA, length(electiondayiterations)))
extractelecday <- function(x){
  vec <- x[,ncol(x)]
}

electiondayits <- lapply(electiondayiterations, function(x) extractelecday(x))
electiondayits <- do.call("cbind", electiondayits)
colnames(electiondayits) <- names(electiondayiterations)
save(electiondayits, file="electiondayiterations.rdata")

save(state_space_model, file="stanresult.rdata")


