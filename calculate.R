library(httr)
library(jsonlite)


res = GET("https://data.ontario.ca/api/3/action/datastore_search?resource_id=ed270bb8-340b-41f9-a7c6-e8ef587e6d11&limit=890")
data = fromJSON(rawToChar(res$content))
cov_data=data$result$records

cov_data$Date <- as.Date(cov_data$`Reported Date`)


start_date = as.Date("2021-05-11")
end_date = as.Date(start_date-6)

#df<-cov_data[cov_data$Date >= end_date & cov_data$Date <= start_date]
df<-subset(cov_data, (Date >= end_date & Date <= start_date))

population=14570000
pop_per=population/100000
df$new_cases<-df$`Total tests completed in the last day`*df$`Percent positive tests in last day`/100
new= sum(df$new_cases)

indicator1=new/pop_per
indicator2=mean(df$`Percent positive tests in last day`)

if (indicator1 <= 9){
  print("BLUE")
} else if (indicator1 > 9 & indicator1 <= 49){
  print("YELLOW")
} else if (indicator1 > 49 & indicator1 <= 99){
  print("ORANGE")
} else if (indicator1 > 99){
  print("RED")
}

if (indicator2 <= 4){
  print("BLUE")
} else if (indicator2 > 4 & indicator2 <= 7.9){
  print("YELLOW")
} else if (indicator2 > 7.9 & indicator2 <= 9.9){
  print("ORANGE")
} else if (indicator2 > 9.9){
  print("RED")
}