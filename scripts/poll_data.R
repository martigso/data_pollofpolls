rm(list = ls())

library(rvest);library(dplyr);library(ggplot2)
library(pbmcapply);library(reshape2)

maling <- list.files("./scrape/www.pollofpolls.no/", pattern = "?cmd=Stortinget&fylke=", full.names = TRUE)

fylker <- function(x){
  
  raw <- read_html(x, encoding = "utf-8")
  
  df <- data.frame((raw %>% html_nodes("table"))[3] %>% html_table())
  
  links <- (raw %>% html_nodes("table"))[3] %>% html_nodes("a") %>% html_attr("href")
  df$maling_link <- unique(links[which(grepl("gallupid", links))])
  
  df$fylke <- gsub("Stortingsvalg: ", "", (raw %>% html_nodes("h1") %>% html_text())[2])
  
  return(df)
}


fylker(maling[28])

sort(maling)

test <- lapply(maling[which(grepl("\\=([0-9]{1,2})$", maling))][-1], fylker)

test <- bind_rows(test)

read_maling <- function(x){
  raw <- read_html(paste0("./scrape/www.pollofpolls.no//index.html", x), encoding = "utf-8")
  
  df <- data.frame(matrix(nrow = 1, ncol = 2, dimnames = list(1, c("N", "id"))))
  df$N <- (raw %>% html_table())[[2]][4, 2]
  df$id <- x
  return(df)
}

hei <- pbmclapply(test$maling, read_maling, mc.cores = detectCores()-1)

hei <- bind_rows(hei)

test <- merge(x = test, y = hei, by.x = "maling_link", by.y = "id", all.x = TRUE)
head(test)
test2 <- melt(test, measure.vars =c("Ap", "Høyre", "Frp", "SV", "Sp", "KrF", "Venstre", "MDG", "Rødt", "Andre"), variable.name = "parti", value.name = "prosent")
test2$N <- as.integer(test2$N)

test2$mandat <- as.integer(gsub("\\(|\\)", "", stringr::str_extract_all(test2$prosent, "\\([0-9]+\\)", simplify = TRUE)))
test2$prosent <- as.numeric(stringr::str_trim(gsub("\\,", ".", gsub("\\([0-9]+\\)", "", test2$prosent))))
test2$stemmer <- round((test2$N / 100) * test2$prosent, digits = 0)


test2$Dato <- as.Date(test2$Dato, format = "%d/%m-%Y")






