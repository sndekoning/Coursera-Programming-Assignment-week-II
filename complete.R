complete <- function(directory, id = 1:332){
    
    all_files <- list.files(directory, pattern = ".csv", full.names = TRUE)
    complete_cases_df <- data.frame()
    
    for(i in id) {
        dat <- read.csv(all_files[i])
        data_available <- complete.cases(dat)
        no_na <- dat[data_available, ]
        complete_cases_df <- rbind(complete_cases_df, c(i, nrow(no_na)))
    }

    names(complete_cases_df) <- c("id", "nobs")
    complete_cases_df
}