#missing values

missing_value_count <- nrow(activity_raw) - nrow(activity_no_na)

#grap all rows with NA and join with the mean steps by interval summary table
activity_na_only <- subset(activity_raw, is.na(activity_raw$steps))
patch <- left_join(activity_na_only, interval_summary)
patch$steps<-patch$mean_steps

#get rid of the column with NAs
patch$mean_steps <- NULL

#stick the filled in data on the bottom and sort
patched <- arrange(rbind(activity_no_na, patch), date)



steps_grouped_by_day_patched <- group_by(patched, date)
daily_summary_patched <- summarise(steps_grouped_by_day_patched, total_steps = sum(steps))

daily_mean_patched <- mean(daily_summary_patched$total_steps)
daily_median_patched <- median(daily_summary_patched$total_steps)


#patched$day_of_week <- weekdays(as.Date(patched$date))
#patched$d <- ifelse(patched$day_of_week =="Saturday" | patched$day_of_week =="Sunday", TRUE, FALSE)


#patched <- mutate(patched, weekday = ifelse(day_of_week == "Saturday" | day_of_week == "Sunday", "weekend", "weekday"))
#patched$weekday <- ifelse(patched$day_of_week == "Saturday" || patched$day_of_week == "Sunday", "weekend", "weekday")


patched$weekday <- ifelse(weekdays(as.Date(patched$date)) == "Saturday" | weekdays(as.Date(patched$date)) == "Sunday", "weekend", "weekday")

patched_grouped_by_weekend_interval <- group_by(patched, weekday, interval)

final_set <-summarize(patched_grouped_by_weekend_interval, mean_steps = mean(steps))

