bacteria_return_doubling_time <- function(bacteria){
  if(bacteria == "AGL1"){
    Doubling_time <- 2.63
  }
  if(bacteria == "E.coli"){
    Doubling_time <- 0.33
  }
  return(Doubling_time)
}

bacteria_find_volume <- function(Final_OD, Large_culture_size = 50, starter_culture_OD, Hours, this_bacteria) {
  Doubling_time <- bacteria_return_doubling_time(bacteria = this_bacteria)
  Volume_starter_inoculate <- Final_OD*((Large_culture_size/starter_culture_OD)/(2^(Hours/Doubling_time)))
  cat(paste0("Inoculate with ", format(Volume_starter_inoculate, digits=3), "mL,\n"))
  cat(paste0(format(100*(1-(Volume_starter_inoculate/(Large_culture_size+Volume_starter_inoculate))),
                      digits = 4),
               "% will be fresh\n"))
  #return(Volume_starter_inoculate)
}

bacteria_find_hours <- function(Final_OD, Large_culture_size = 50, starter_culture_OD, Volume_starter_inoculate, this_bacteria) {
  Doubling_time <- bacteria_return_doubling_time(bacteria = this_bacteria)
  Hours <- log((Final_OD*(Large_culture_size/(starter_culture_OD*Volume_starter_inoculate))), base = 2)*Doubling_time
  cat(paste0("Will take ", format(Hours, digits=3), " hours,\n"))
  cat(paste0(format(100*(1-(Volume_starter_inoculate/(Large_culture_size+Volume_starter_inoculate))),
                      digits = 4), "% will be fresh\n"))
  #return(Hours)
}

# # Example usage
# 
 bacteria_find_volume(Final_OD = 0.5,
                      starter_culture_OD = 1.5,
                      Hours = 24,
                      this_bacteria = "AGL1")
# 
# bacteria_find_hours(Final_OD = 0.5,
#                     starter_culture_OD = 1.5,
#                     Volume_starter_inoculate = 3,
#                     this_bacteria = "Agro")
# 
# Use on June 30, 2019 for Vir genes

# data <- cbind(c("70298col4", "70298col5", "70298col3", "70298col4", "GFPcultureA", "GFPcultureB"),
#               c("0.8216", "0.8802", "0.9129", "0.7811", "1.8174", "1.656"))
# 
# data[,2] <- as.numeric(as.character(data[,2]))
# 
# for(i in 1:nrow(data)){
#   print(paste("Sample:", data[i,1]))
#   bacteria_find_volume(Final_OD = 1.2,
#                        starter_culture_OD = as.numeric(as.character(data[i,2])),
#                        Hours = 22,
#                        this_bacteria="Agro")
#   cat("\n")
# }
