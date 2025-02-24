#install.packages("rjson")
#install.packages("RJSONIO")
library(rjson)
library(RJSONIO)
FilePath <- "../Individual Assignment/yelp_training_set_user.json"
user_json <- fromJSON(file = FilePath)

user_json$votes
user_json$user_id

