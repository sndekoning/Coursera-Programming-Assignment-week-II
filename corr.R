corr <- function(directory, threshold = 0) { 

    all_files <- list.files(directory, pattern = ".csv", full.names = TRUE)
    corr_list <- c()
    i <- 1
    
    while(i <= length(all_files)) {
        complete_cases <- complete(directory, i)
        
        if (complete_cases$nobs > threshold) {
            dat <- read.csv(all_files[i])
            corr_list <- c(corr_list, cor(dat$sulfate, dat$nitrate, use = "complete.obs"))
        }
        i <- i + 1
    }
    corr_list
}