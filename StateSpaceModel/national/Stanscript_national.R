

library(rvest); library(dplyr); library(ggplot2); library(rstan); library(reshape2); library(stringr); library(lubridate)

pp <- read.csv("../../data/polls_long.csv", fileEncoding = "UTF-8", stringsAsFactors = FALSE)
pp <- pp[which(pp$omraade=="Hele landet" & pp$valg=="Stortingsvalg"),]


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

#Mean of a) House \and c) Party
pp$MoE_imp <- pp$MoE
for(i in 1:nrow(pp)){
  pp$MoE_imp[i] <- ifelse(is.na(pp$MoE[i])==TRUE,
                      mean(pp$MoE[which(pp$hus==pp$hus[i] & pp$parti==pp$parti[i])], na.rm=TRUE),
                      pp$MoE[i])
}

#Still 10 NAs, so the rest: Mean of a) Fylke and b) Party
for(i in 1:nrow(pp)){
  pp$MoE_imp[i] <- ifelse(is.na(pp$MoE_imp[i])==TRUE,
                          mean(pp$MoE[which(pp$fylke==pp$fylke[i] & pp$parti==pp$parti[i])], na.rm=TRUE),
                          pp$MoE_imp[i])
}

#
pp$sigma <- pp$MoE_imp/4


#define date
pp$date <- as.Date(pp$Dato)
pp_big <- pp
pp <- pp_big[which(pp_big$date > as.Date("2013-09-09")), ]





#####     norge        #####
#norge Ap
poll_norge_ap <- pp[which(pp$parti=="Ap"),c("date","prosent", "MoE","sigma","N")]
polls_norge_ap <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                          to= as.Date("2017-09-11"), 
                                          by = "day")), poll_norge_ap) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_ap <- polls_norge_ap %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_ap[is.na(Y_norge_ap)] <- -9

sigma_norge_ap <- polls_norge_ap %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_ap[is.na(sigma_norge_ap)] <- -9


#norge H
poll_norge_h <- pp[which(pp$parti=="Høyre"),c("date","prosent", "MoE","sigma","N")]
polls_norge_h <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_norge_h) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_h <- polls_norge_h %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_h[is.na(Y_norge_h)] <- -9

sigma_norge_h <- polls_norge_h %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_h[is.na(sigma_norge_h)] <- -9

#norge Frp
poll_norge_frp <- pp[which(pp$parti=="Frp"),c("date","prosent", "MoE","sigma","N")]
polls_norge_frp <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_norge_frp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_frp <- polls_norge_frp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_frp[is.na(Y_norge_frp)] <- -9

sigma_norge_frp <- polls_norge_frp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_frp[is.na(sigma_norge_frp)] <- -9


#norge SV
poll_norge_sv <- pp[which(pp$parti=="SV"),c("date","prosent", "MoE","sigma","N")]
polls_norge_sv <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_norge_sv) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_sv <- polls_norge_sv %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_sv[is.na(Y_norge_sv)] <- -9

sigma_norge_sv <- polls_norge_sv %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_sv[is.na(sigma_norge_sv)] <- -9

#norge SP
poll_norge_sp <- pp[which(pp$parti=="Sp"),c("date","prosent", "MoE","sigma","N")]
polls_norge_sp <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_norge_sp) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_sp <- polls_norge_sp %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_sp[is.na(Y_norge_sp)] <- -9

sigma_norge_sp <- polls_norge_sp %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_sp[is.na(sigma_norge_sp)] <- -9

#norge krf
poll_norge_krf <- pp[which(pp$parti=="KrF"),c("date","prosent", "MoE","sigma","N")]
polls_norge_krf <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                 to= as.Date("2017-09-11"), 
                                                 by = "day")), poll_norge_krf) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_krf <- polls_norge_krf %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_krf[is.na(Y_norge_krf)] <- -9

sigma_norge_krf <- polls_norge_krf %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_krf[is.na(sigma_norge_krf)] <- -9

#norge V
poll_norge_v <- pp[which(pp$parti=="Venstre"),c("date","prosent", "MoE","sigma","N")]
polls_norge_v <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_norge_v) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_v <- polls_norge_v %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_v[is.na(Y_norge_v)] <- -9

sigma_norge_v <- polls_norge_v %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_v[is.na(sigma_norge_v)] <- -9

#norge mdg
poll_norge_mdg <- pp[which(pp$parti=="MDG"),c("date","prosent", "MoE","sigma","N")]
polls_norge_mdg <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_norge_mdg) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_mdg <- polls_norge_mdg %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_mdg[is.na(Y_norge_mdg)] <- -9

sigma_norge_mdg <- polls_norge_mdg %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_mdg[is.na(sigma_norge_mdg)] <- -9


#norge R
poll_norge_r <- pp[which(pp$parti=="Rødt"),c("date","prosent", "MoE","sigma","N")]
polls_norge_r <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                  to= as.Date("2017-09-11"), 
                                                  by = "day")), poll_norge_r) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_r <- polls_norge_r %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_r[is.na(Y_norge_r)] <- -9

sigma_norge_r <- polls_norge_r %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_r[is.na(sigma_norge_r)] <- -9


#norge andre
poll_norge_a <- pp[which(pp$parti=="Andre"),c("date","prosent", "MoE","sigma","N")]
polls_norge_a <- left_join(data_frame(date = seq(from = as.Date("2013-09-10"),
                                                to= as.Date("2017-09-11"), 
                                                by = "day")), poll_norge_a) %>% 
  group_by(date) %>%
  mutate(N = 1:n())

Y_norge_a <- polls_norge_a %>% dcast(date ~ N, value.var = "prosent") %>% 
  dplyr::select(-date) %>% 
  as.data.frame %>% as.matrix
Y_norge_a[is.na(Y_norge_a)] <- -9

sigma_norge_a <- polls_norge_a %>% dcast(date ~ N, value.var = "sigma")%>% 
  dplyr::select(-date)%>% 
  as.data.frame %>% as.matrix
sigma_norge_a[is.na(sigma_norge_a)] <- -9



##### STAN    #####
norge_model <- stan("../national/state_space_polls_norge_hg.stan",
                   iter=1e3,
                   chains=1,
                   data = list(T = nrow(Y_norge_ap), 
                               polls = ncol(Y_norge_ap),
                               
                               
                               Y_norge_ap     = Y_norge_ap, 
                               sigma_norge_ap = sigma_norge_ap,
                               initial_prior_norge_ap = 30.8,
                               
                               Y_norge_h     = Y_norge_h, 
                               sigma_norge_h = sigma_norge_h,
                               initial_prior_norge_h = 26.8,
                               
                               Y_norge_frp     = Y_norge_frp, 
                               sigma_norge_frp = sigma_norge_frp,
                               initial_prior_norge_frp = 16.3,
                               
                               Y_norge_sv     = Y_norge_sv, 
                               sigma_norge_sv = sigma_norge_sv,
                               initial_prior_norge_sv = 4.1,
                               
                               Y_norge_sp     = Y_norge_sp, 
                               sigma_norge_sp = sigma_norge_sp,
                               initial_prior_norge_sp = 5.5,
                               
                               Y_norge_krf     = Y_norge_krf, 
                               sigma_norge_krf = sigma_norge_krf,
                               initial_prior_norge_krf = 5.6,
                               
                               Y_norge_v     = Y_norge_v, 
                               sigma_norge_v = sigma_norge_v,
                               initial_prior_norge_v = 5.2,
                               
                               Y_norge_mdg     = Y_norge_mdg, 
                               sigma_norge_mdg = sigma_norge_mdg,
                               initial_prior_norge_mdg = 2.8,
                               
                               Y_norge_r     = Y_norge_r, 
                               sigma_norge_r = sigma_norge_r,
                               initial_prior_norge_r = 1.1,
                               
                               Y_norge_a     = Y_norge_a, 
                               sigma_norge_a = sigma_norge_a,
                               initial_prior_norge_a = 1.8
                               
                               ))


munames <- gsub("Y_", "mu_", grep("Y_", ls(), value=TRUE))
musum <- data.frame(summary(norge_model, pars = munames)$summary)
musum[grep("ap", rownames(musum))[1463],]


munames <- paste0("mu_norge_",c("ap","h", "frp", "sv", "sp", "krf", "v", "mdg", "r", "andre"))
musum$id <- paste0(gsub("[^a-zA-Z_]+","", rownames(musum)), rep(unique(paste0(polls_norge_ap$date)), length(munames)))
musum$id <- gsub("_a2017", "_andre2017", musum$id)

electionday <- musum[grep("2017-09-11", musum$id),]
musum$fylke<- gsub("mu_([a-zA-Z]+)_.*", "\\1", musum$id)

fylketrender <- as.list(rep(NA, length(unique(musum$fylke))))
fylketrender <- split( musum , f = musum$fylke )
names(fylketrender) <- unique(musum$fylke)

save(fylketrender, file="fylketrender.rdata")
save(electionday, file="electionday.rdata")


electiondayiterations <- extract(norge_model, pars=munames)
electiondayits <- as.list(rep(NA, length(electiondayiterations)))
extractelecday <- function(x){
  vec <- x[,ncol(x)]
}


electiondayits <- lapply(electiondayiterations, function(x) extractelecday(x))
electiondayits <- do.call("cbind", electiondayits)
colnames(electiondayits) <- names(electiondayiterations)
save(electiondayits, file="electiondayiterations.rdata")

save(norge_model, file="stanresult_200iterations.rdata")


