
library(lattice)

png(filename = "exploratory/hist.png",width = 480, height = 480)

hist(daily_summary$total_steps)
dev.off()

png(filename = "exploratory/hist_pretty1.png",width = 480, height = 480)


hist(daily_summary$total_steps, breaks = 10, ylab = "Count", xlab = "Total Steps Taken Per Day", main = "Steps Taken Per Day Histogram")
dev.off()

png(filename = "exploratory/hist_ppretty2.png",width = 480, height = 480)

hist(daily_summary$total_steps, breaks = 20, ylab = "Count", xlab = "Total Steps Taken Per Day", main = "Steps Taken Per Day Histogram")

dev.off()

png(filename = "exploratory/ts.png",width = 480, height = 480)
plot(interval_summary$mean_steps, type = "l")

dev.off()


png(filename = "exploratory/ts_pretty.png",width = 480, height = 480)
plot(interval_summary$mean_steps, type = "l", xlab  = "Five Minute Interval", ylab = "Average Number of Steps", main = "Average Steps Taken Across Days by Interval")

dev.off()

png(filename = "exploratory/hist2.png",width = 480, height = 480)

hist(daily_summary_patched$total_steps, breaks = 10, ylab = "Count", xlab = "Total Steps Taken Per Day", main = "Steps Taken Per Day Histogram With Filled in Data")

dev.off()


png(filename = "exploratory/panel1.png",width = 480, height = 480)

with(patched, xyplot(steps ~ interval | factor(weekday)))

dev.off()
      

png(filename = "exploratory/panel2.png",width = 480, height = 480)

with(patched, xyplot(steps ~ interval | factor(weekday), type = "l", layout = c(1,2)))

dev.off()


png(filename = "exploratory/panel3.png",width = 480, height = 480)

with(final_set, xyplot(mean_steps ~ interval | factor(weekday), type = "l", layout = c(1,2), xlab = "Interval", ylab = "Mean Number of Steps"))

dev.off()


