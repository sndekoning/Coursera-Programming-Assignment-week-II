pollutantmean <- function(directory, pollutant, id = 1:332){

    all_files <- list.files(directory, pattern = ".csv", full.names = TRUE)
    dat <- data.frame()
    for(i in id){
        dat <- rbind(dat, read.csv(all_files[i]))
    }
    
    clean_dat <- na.omit(dat)
    mean(clean_dat[, pollutant])
}