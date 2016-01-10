library(dplyr)


# load and process
unzip("activity.zip")
activity_raw <- read.csv("activity.csv")
activity_no_na <- na.omit(activity_raw)

#mean total number of steps per day

steps_grouped_by_day <- group_by(activity_no_na, date)
daily_summary <- summarise(steps_grouped_by_day, total_steps = sum(steps))



daily_mean <- mean(daily_summary$total_steps)
daily_median <- median(daily_summary$total_steps)


#average daily activity pattern

steps_grouped_by_interval <- group_by(activity_no_na, interval)
interval_summary <- summarise(steps_grouped_by_interval, mean_steps = mean(steps))

max_interval_steps <- max(interval_summary$mean_steps)


interval_summary_sorted <- arrange(interval_summary, desc(mean_steps))

max_interval <- interval_summary_sorted$interval[1]
