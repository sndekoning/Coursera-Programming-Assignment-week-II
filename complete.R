complete <- function(directory, id = 1:332){
    
    ## Lists all ".csv" files within a directory specified in argument "directory", and creates 
    ## a dataframe for monitor id for argument "id"
    all_files <- list.files(directory, pattern = ".csv", full.names = TRUE)
        dat <- data.frame()
    for(i in id){
        dat <- rbind(dat, read.csv(all_files[i]))
    }
    
    ## Creates a number vector for the total available data-entries
        data_available <- complete.cases(dat)
        nobs <- sum(data_available)
    
    
    
    ## Creates a dataframe of available data-entries per monitor ID.
    complete_cases_DF <- data.frame(id, nobs)
    complete_cases_DF
}