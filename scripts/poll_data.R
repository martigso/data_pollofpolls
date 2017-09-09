rm(list = ls())

library(rvest);library(dplyr);library(ggplot2)
library(pbmcapply);library(reshape2)

maling_files <- list.files("./scrape/www.pollofpolls.no/", pattern = "?cmd=Stortinget&fylke=", full.names = TRUE)

fylker <- function(x){
  
  raw <- read_html(x, encoding = "utf-8")
  
  df <- data.frame((raw %>% html_nodes("table"))[3] %>% html_table())
  
  links <- (raw %>% html_nodes("table"))[3] %>% html_nodes("a") %>% html_attr("href")
  df$maling_files_link <- unique(links[which(grepl("gallupid", links))])
  
  df$fylke <- gsub("Stortingsvalg: ", "", (raw %>% html_nodes("h1") %>% html_text())[2])
  
  return(df)
}


polls_wide <- lapply(maling_files[which(grepl("\\=([0-9]{1,2})$", maling_files))][-1], fylker)

polls_wide <- bind_rows(polls_wide)

read_maling_files <- function(x){
  raw <- read_html(paste0("./scrape/www.pollofpolls.no//index.html", x), encoding = "utf-8")
  
  df <- data.frame(matrix(nrow = 1, ncol = 2, dimnames = list(1, c("N", "id"))))
  df$N <- (raw %>% html_table())[[2]][4, 2]
  df$id <- x
  return(df)
}

respondents <- pbmclapply(polls_wide$maling_files, read_maling_files, mc.cores = detectCores()-1)

respondents <- bind_rows(respondents)

polls_wide <- merge(x = polls_wide, y = respondents, by.x = "maling_files_link", by.y = "id", all.x = TRUE)
rm(respondents, maling_files)

polls_long <- melt(polls_wide, measure.vars =c("Ap", "Høyre", "Frp", "SV", "Sp", "KrF", "Venstre", "MDG", "Rødt", "Andre"), variable.name = "parti", value.name = "prosent")
rm(polls_wide)

polls_long$N <- as.integer(polls_long$N)

polls_long$mandat <- as.integer(gsub("\\(|\\)", "", stringr::str_extract_all(polls_long$prosent, "\\([0-9]+\\)", simplify = TRUE)))
polls_long$prosent <- as.numeric(stringr::str_trim(gsub("\\,", ".", gsub("\\([0-9]+\\)", "", polls_long$prosent))))
polls_long$stemmer <- round((polls_long$N / 100) * polls_long$prosent, digits = 0)
polls_long$Dato <- as.Date(polls_long$Dato, format = "%d/%m-%Y")
polls_long <- polls_long %>% group_by(maling_files_link, fylke) %>% mutate(total_mandat_fylke = sum(mandat))

write.csv(polls_long, file = "./data/polls_long.csv")

