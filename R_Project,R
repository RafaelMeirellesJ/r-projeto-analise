install.packages('tidyverse')
library(tidyverse)
install.packages('lubridate')
library(lubridate)

df <- read.csv('C:\\Users\\rafae\\OneDrive\\Documentos\\GameRelease\\GR.csv')

df$release <- as.Date(df$release, format='%b %d %Y')
print(df$release)

df_sorted <- df[order(df$release),]

df_cut <- head(df_sorted, 10000)

df$positive_reviews <- gsub(',', '', df$positive_reviews)

df$negative_reviews <- gsub(',', '', df$negative_reviews)

df$positive_reviews <- as.integer(df$positive_reviews)
df$negative_reviews <- as.integer(df$negative_reviews)

print(sapply(df, class))

df$total_reviews <- df$positive_reviews + df$negative_reviews

print(df)

df_cut$peak_players <- as.numeric(df_cut$peak_players, errors='coerce')
df_cut$positive_reviews <- as.numeric(df_cut$positive_reviews, errors='coerce')
df_cut$negative_reviews <- as.numeric(df_cut$negative_reviews, errors='coerce')
df_cut$total_reviews <- as.numeric(df_cut$total_reviews, errors='coerce')
df_cut$rating <- as.numeric(df_cut$rating, errors='coerce')

df_cut <- df_cut[order(df_cut$release),]

ggplot(df_cut, aes(x=release, y=peak_players)) + 
  geom_line() + 
  ggtitle('Peak Players Over Time') + 
  xlab('Release Date') + 
  ylab('Peak Players')

columns <- c('peak_players', 'positive_reviews', 'negative_reviews', 'total_reviews', 'rating')
for (col in columns) {
  ggplot(df_cut, aes(x=col)) + 
    geom_histogram(aes(y=..count..), binwidth=20, color='black', fill='white') + 
    ggtitle(paste('Distribution of', col)) + 
    xlab(col) + 
    ylab('Count')
}
