pollutantmean <- function(directory, pollutant, id = 1:332){
    
    ## Lists all ".csv" files within a directory specified in argument "directory", and creates 
    ## a dataframe for monitor id for argument "id"
        all_files <- list.files(directory, pattern = ".csv", full.names = TRUE)
    dat <- data.frame()
    for(i in id){
        dat <- rbind(dat, read.csv(all_files[i]))
    }
    
    ## Removes missing entries
    
    clean_dat <- na.omit(dat)
    
    ## Gives the mean of the pollutant specified of the monitors specified
    
    mean(clean_dat[, pollutant])
}