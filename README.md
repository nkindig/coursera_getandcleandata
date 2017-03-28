# run_analysis.R

This script assumes that the relevant datasets are already in your working directory.
First it will pull in required columns from the different datasets based on the
descriptions originally provided. After some minor renamings, the test and training
datasets are combined together. All variables are given descriptive names. At this point
the script groups by the subject and activity, then takes the mean of every variable.

# Output Variables

Body.Acceleration.X.Mean.Avg = Average of mean body acceleration in X direction
Body.Acceleration.Y.Mean.Avg = Average of mean body acceleration in Y direction
Body.Acceleration.Z.Mean.Avg = Average of mean body acceleration in Z direction
Body.Acceleration.X.Stdev.Avg = Average of body acceleration standard deviation in X direction
Body.Acceleration.Y.Stdev.Avg = Average of body acceleration standard deviation in Y direction
Body.Acceleration.Z.Stdev.Avg = Average of body acceleration standard deviation in Z direction
Gravity.Acceleration.X.Mean.Avg = mean(Gravity.Acceleration.X.Mean),
Gravity.Acceleration.Y.Mean.Avg = mean(Gravity.Acceleration.Y.Mean),
Gravity.Acceleration.Z.Mean.Avg = mean(Gravity.Acceleration.Z.Mean),
Gravity.Acceleration.X.Stdev.Avg = mean(Gravity.Acceleration.X.Stdev),
Gravity.Acceleration.Y.Stdev.Avg = mean(Gravity.Acceleration.Y.Stdev),
Gravity.Acceleration.Z.Stdev.Avg = mean(Gravity.Acceleration.Z.Stdev),
Body.Acceleration.Jerk.X.Mean.Avg = mean(Body.Acceleration.Jerk.X.Mean),
Body.Acceleration.Jerk.Y.Mean.Avg = mean(Body.Acceleration.Jerk.Y.Mean),
Body.Acceleration.Jerk.Z.Mean.Avg = mean(Body.Acceleration.Jerk.Z.Mean),
Body.Acceleration.Jerk.X.Stdev.Avg = mean(Body.Acceleration.Jerk.X.Stdev),
Body.Acceleration.Jerk.Y.Stdev.Avg = mean(Body.Acceleration.Jerk.Y.Stdev),
Body.Acceleration.Jerk.Z.Stdev.Avg = mean(Body.Acceleration.Jerk.Z.Stdev),
Body.Gyroscope.X.Mean.Avg = mean(Body.Gyroscope.X.Mean),
Body.Gyroscope.Y.Mean.Avg = mean(Body.Gyroscope.Y.Mean),
Body.Gyroscope.Z.Mean.Avg = mean(Body.Gyroscope.Z.Mean),
Body.Gyroscope.X.Stdev.Avg = mean(Body.Gyroscope.X.Stdev),
Body.Gyroscope.Y.Stdev.Avg = mean(Body.Gyroscope.Y.Stdev),
Body.Gyroscope.Z.Stdev.Avg = mean(Body.Gyroscope.Z.Stdev),
Body.Gyroscope.Jerk.X.Mean.Avg = mean(Body.Gyroscope.Jerk.X.Mean),
Body.Gyroscope.Jerk.Y.Mean.Avg = mean(Body.Gyroscope.Jerk.Y.Mean),
Body.Gyroscope.Jerk.Z.Mean.Avg = mean(Body.Gyroscope.Jerk.Z.Mean),
Body.Gyroscope.Jerk.X.Stdev.Avg = mean(Body.Gyroscope.Jerk.X.Stdev),
Body.Gyroscope.Jerk.Y.Stdev.Avg = mean(Body.Gyroscope.Jerk.Y.Stdev),
Body.Gyroscope.Jerk.Z.Stdev.Avg = mean(Body.Gyroscope.Jerk.Z.Stdev),
Body.Acceleration.Magnitude.Mean.Avg = mean(Body.Acceleration.Magnitude.Mean),
Body.Acceleration.Magnitude.Stdev.Avg = mean(Body.Acceleration.Magnitude.Stdev),
Gravity.Acceleration.Magnitude.Mean.Avg = mean(Gravity.Acceleration.Magnitude.Mean),
Gravity.Acceleration.Magnitude.Stdev.Avg = mean(Gravity.Acceleration.Magnitude.Stdev),
Body.Acceleration.Jerk.Magnitude.Mean.Avg = mean(Body.Acceleration.Jerk.Magnitude.Mean),
Body.Acceleration.Jerk.Magnitude.Stdev.Avg = mean(Body.Acceleration.Jerk.Magnitude.Stdev),
Body.Gyroscope.Magnitude.Mean.Avg = mean(Body.Gyroscope.Magnitude.Mean),
Body.Gyroscope.Magnitude.Stdev.Avg = mean(Body.Gyroscope.Magnitude.Stdev),
Body.Gyroscope.Jerk.Magnitude.Mean.Avg = mean(Body.Gyroscope.Jerk.Magnitude.Mean),
Body.Gyroscope.Jerk.Magnitude.Stdev.Avg = mean(Body.Gyroscope.Jerk.Magnitude.Stdev),
Freq.Body.Acceleration.X.Mean.Avg = mean(Freq.Body.Acceleration.X.Mean),
Freq.Body.Acceleration.Y.Mean.Avg = mean(Freq.Body.Acceleration.Y.Mean),
Freq.Body.Acceleration.Z.Mean.Avg = mean(Freq.Body.Acceleration.Z.Mean),
Freq.Body.Acceleration.X.Stdev.Avg = mean(Freq.Body.Acceleration.X.Stdev),
Freq.Body.Acceleration.Y.Stdev.Avg = mean(Freq.Body.Acceleration.Y.Stdev),
Freq.Body.Acceleration.Z.Stdev.Avg = mean(Freq.Body.Acceleration.Z.Stdev),
Freq.Body.Acceleration.Jerk.X.Mean.Avg = mean(Freq.Body.Acceleration.Jerk.X.Mean),
Freq.Body.Acceleration.Jerk.Y.Mean.Avg = mean(Freq.Body.Acceleration.Jerk.Y.Mean),
Freq.Body.Acceleration.Jerk.Z.Mean.Avg = mean(Freq.Body.Acceleration.Jerk.Z.Mean),
Freq.Body.Acceleration.Jerk.X.Stdev.Avg = mean(Freq.Body.Acceleration.Jerk.X.Stdev),
Freq.Body.Acceleration.Jerk.Y.Stdev.Avg = mean(Freq.Body.Acceleration.Jerk.Y.Stdev),
Freq.Body.Acceleration.Jerk.Z.Stdev.Avg = mean(Freq.Body.Acceleration.Jerk.Z.Stdev),
Freq.Body.Gyroscope.X.Mean.Avg = mean(Freq.Body.Gyroscope.X.Mean),
Freq.Body.Gyroscope.Y.Mean.Avg = mean(Freq.Body.Gyroscope.Y.Mean),
Freq.Body.Gyroscope.Z.Mean.Avg = mean(Freq.Body.Gyroscope.Z.Mean),
Freq.Body.Gyroscope.X.Stdev.Avg = mean(Freq.Body.Gyroscope.X.Stdev),
Freq.Body.Gyroscope.Y.Stdev.Avg = mean(Freq.Body.Gyroscope.Y.Stdev),
Freq.Body.Gyroscope.Z.Stdev.Avg = mean(Freq.Body.Gyroscope.Z.Stdev),
Freq.Body.Acceleration.Magnitude.Mean.Avg = mean(Freq.Body.Acceleration.Magnitude.Mean),
Freq.Body.Acceleration.Magnitude.Stdev.Avg = mean(Freq.Body.Acceleration.Magnitude.Stdev),
Freq.Body.Acceleration.Jerk.Magnitude.Mean.Avg = mean(Freq.Body.Acceleration.Jerk.Magnitude.Mean),
Freq.Body.Acceleration.Jerk.Magnitude.Stdev.Avg = mean(Freq.Body.Acceleration.Jerk.Magnitude.Stdev),
Freq.Body.Gyroscope.Magnitude.Mean.Avg = mean(Freq.Body.Gyroscope.Magnitude.Mean),
Freq.Body.Gyroscope.Magnitude.Stdev.Avg = mean(Freq.Body.Gyroscope.Magnitude.Stdev),
Freq.Body.Gyroscope.Jerk.Magnitude.Mean.Avg = mean(Freq.Body.Gyroscope.Jerk.Magnitude.Mean),
Freq.Body.Gyroscope.Jerk.Magnitude.Stdev.Avg = mean(Freq.Body.Gyroscope.Jerk.Magnitude.Stdev)