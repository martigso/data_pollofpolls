rm(list = ls())

library(rvest);library(dplyr);library(ggplot2)
library(pbmcapply);library(reshape2)

############################
####### Nasjonalt ##########
############################

maling_files <- list.files("./scrape/www.pollofpolls.no/", pattern = "?cmd=Maling&serieid=", full.names = TRUE)

nasjonalt <- function(x){
  
  raw <- read_html(x, encoding = "utf-8")
  
  df <- data.frame((raw %>% html_nodes("table"))[1] %>% html_table())
  
  links <- (raw %>% html_nodes("table"))[1] %>% html_nodes("a") %>% html_attr("href")
  df$maling_files_link <- c(NA, unique(links[which(grepl("gallupid", links))]))
  
  return(df)
}

read_maling_files <- function(x){
  
  if(is.na(x) == TRUE){
    df <- data.frame(N = NA, id = NA, omraade = NA, valg = NA)
  } else {
    
    raw <- read_html(paste0("./scrape/www.pollofpolls.no//index.html", x), encoding = "utf-8")
    
    df <- data.frame(matrix(nrow = 1, ncol = 2, dimnames = list(1, c("N", "id"))))
    df$N <- (raw %>% html_table())[[2]][4, 2]
    df$id <- x
    df$omraade <- (raw %>% html_table())[[2]][2, 2]
    df$valg <- (raw %>% html_table())[[2]][1, 2]
    
    if(grepl("[0-9]", df$valg) == TRUE){
      df <- data.frame(matrix(nrow = 1, ncol = 2, dimnames = list(1, c("N", "id"))))
      df$N <- (raw %>% html_table())[[1]][4, 2]
      df$id <- x
      df$omraade <- (raw %>% html_table())[[1]][2, 2]
      df$valg <- (raw %>% html_table())[[1]][1, 2]
    }
    
  }
  return(df)
}

polls_wide <- pbmclapply(maling_files, nasjonalt, mc.cores = detectCores()-1)

polls_wide <- bind_rows(polls_wide)

polls_wide <- polls_wide[which(grepl("Valg", polls_wide$Måling) == FALSE), ]

respondents <- pbmclapply(polls_wide$maling_files, read_maling_files, mc.cores = detectCores()-1)
respondents <- bind_rows(respondents)

polls_wide <- merge(x = polls_wide, y = respondents, by.x = "maling_files_link", by.y = "id", all.x = TRUE)

rm(respondents, maling_files)

polls_long <- melt(polls_wide, measure.vars =c("Ap", "Høyre", "Frp", "SV", "Sp", "KrF", "Venstre", "MDG", "Rødt", "Andre"), variable.name = "parti", value.name = "prosent")
# rm(polls_wide)

polls_long$N <- as.integer(polls_long$N)

polls_long$mandat <- as.integer(gsub("\\(|\\)", "", stringr::str_extract_all(polls_long$prosent, "\\([0-9]+\\)", simplify = TRUE)))
polls_long$prosent <- as.numeric(stringr::str_trim(gsub("\\,", ".", gsub("\\([0-9]+\\)", "", polls_long$prosent))))
polls_long$stemmer <- round((polls_long$N / 100) * polls_long$prosent, digits = 0)
polls_long$Dato <- as.Date(unlist(stringr::str_extract_all(polls_long$Måling, "[0-9]+\\/[0-9]+\\-[0-9]+")), format = "%d/%m-%Y")

polls_long <- polls_long %>% group_by(maling_files_link, omraade) %>% mutate(total_mandat_fylke = sum(mandat, na.rm = TRUE))


head(polls_long[which(polls_long$maling_files_link == "?cmd=Maling&gallupid=1001"), ], 20)

write.csv(polls_long, file = "./data/polls_long.csv", row.names = FALSE)

