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

Gravity.Acceleration.X.Mean.Avg = Average of mean gravity acceleration in X direction

Gravity.Acceleration.Y.Mean.Avg = Average of mean gravity acceleration in Y direction

Gravity.Acceleration.Z.Mean.Avg = Average of mean gravity acceleration in Z direction

Gravity.Acceleration.X.Stdev.Avg = Average of gravity acceleration standard deviation in X direction

Gravity.Acceleration.Y.Stdev.Avg = Average of gravity acceleration standard deviation in Y direction

Gravity.Acceleration.Z.Stdev.Avg = Average of gravity acceleration standard deviation in Z direction

Body.Acceleration.Jerk.X.Mean.Avg = Average of mean body acceleration jerk in X direction

Body.Acceleration.Jerk.Y.Mean.Avg = Average of mean body acceleration jerk in Y direction

Body.Acceleration.Jerk.Z.Mean.Avg = Average of mean body acceleration jerk in Z direction

Body.Acceleration.Jerk.X.Stdev.Avg = Average of body acceleration jerk standard deviation in X direction

Body.Acceleration.Jerk.Y.Stdev.Avg = Average of body acceleration jerk standard deviation in Y direction

Body.Acceleration.Jerk.Z.Stdev.Avg = Average of body acceleration jerk standard deviation in Z direction

Body.Gyroscope.X.Mean.Avg = Average of mean body gyroscope in X direction

Body.Gyroscope.Y.Mean.Avg = Average of mean body gyroscope in Y direction

Body.Gyroscope.Z.Mean.Avg = Average of mean body gyroscope in Z direction

Body.Gyroscope.X.Stdev.Avg = Average of body gyroscope standard deviation in X direction

Body.Gyroscope.Y.Stdev.Avg = Average of body gyroscope standard deviation in Y direction

Body.Gyroscope.Z.Stdev.Avg = Average of body gyroscope standard deviation in Z direction

Body.Gyroscope.Jerk.X.Mean.Avg = Average of mean body gyroscope jerk in X direction

Body.Gyroscope.Jerk.Y.Mean.Avg = Average of mean body gyroscope jerk in Y direction

Body.Gyroscope.Jerk.Z.Mean.Avg = Average of mean body gyroscope jerk in Z direction

Body.Gyroscope.Jerk.X.Stdev.Avg = Average of body gyroscope jerk standard deviation in X direction

Body.Gyroscope.Jerk.Y.Stdev.Avg = Average of body gyroscope jerk standard deviation in Y direction

Body.Gyroscope.Jerk.Z.Stdev.Avg = Average of body gyroscope jerk standard deviation in Z direction

Body.Acceleration.Magnitude.Mean.Avg = Average of mean body acceleration magnitude

Body.Acceleration.Magnitude.Stdev.Avg = Average of body acceleration magnitude standard deviation

Gravity.Acceleration.Magnitude.Mean.Avg = Average of mean gravity acceleration magnitude

Gravity.Acceleration.Magnitude.Stdev.Avg = Average of gravity acceleration magnitude standard deviation

Body.Acceleration.Jerk.Magnitude.Mean.Avg = Average of mean body acceleration jerk magnitude

Body.Acceleration.Jerk.Magnitude.Stdev.Avg = Average of body acceleration jerk magnitude standard deviation

Body.Gyroscope.Magnitude.Mean.Avg = Average of mean body gyroscope magnitude 

Body.Gyroscope.Magnitude.Stdev.Avg = Average of body gyroscope magnitude standard deviation

Body.Gyroscope.Jerk.Magnitude.Mean.Avg = Average of mean body gyroscope jerk magnitude

Body.Gyroscope.Jerk.Magnitude.Stdev.Avg = Average of body gyroscope jerk magnitude standard deviation

Freq.Body.Acceleration.X.Mean.Avg = Average of mean frequency body acceleration in X direction

Freq.Body.Acceleration.Y.Mean.Avg = Average of mean frequency body acceleration in Y direction

Freq.Body.Acceleration.Z.Mean.Avg = Average of mean frequency body acceleration in Z direction

Freq.Body.Acceleration.X.Stdev.Avg = Average of frequency body acceleration standard deviation in X direction

Freq.Body.Acceleration.Y.Stdev.Avg = Average of frequency body acceleration standard deviation in Y direction

Freq.Body.Acceleration.Z.Stdev.Avg = Average of frequency body acceleration standard deviation in Z direction

Freq.Body.Acceleration.Jerk.X.Mean.Avg = Average of mean frequency body acceleration jerk in X direction

Freq.Body.Acceleration.Jerk.Y.Mean.Avg = Average of mean frequency body acceleration jerk in Y direction

Freq.Body.Acceleration.Jerk.Z.Mean.Avg = Average of mean frequency body acceleration jerk in Z direction

Freq.Body.Acceleration.Jerk.X.Stdev.Avg = Average of frequency body acceleration jerk standard deviation in X direction

Freq.Body.Acceleration.Jerk.Y.Stdev.Avg = Average of frequency body acceleration jerk standard deviation in Y direction

Freq.Body.Acceleration.Jerk.Z.Stdev.Avg = Average of frequency body acceleration jerk standard deviation in Z direction

Freq.Body.Gyroscope.X.Mean.Avg = Average of mean frequency body gyroscope in X direction

Freq.Body.Gyroscope.Y.Mean.Avg = Average of mean frequency body gyroscope in Y direction

Freq.Body.Gyroscope.Z.Mean.Avg = Average of mean frequency body gyroscope in Z direction

Freq.Body.Gyroscope.X.Stdev.Avg = Average of frequency body gyroscope standard deviation in X direction

Freq.Body.Gyroscope.Y.Stdev.Avg = Average of frequency body gyroscope standard deviation in Y direction

Freq.Body.Gyroscope.Z.Stdev.Avg = Average of frequency body gyroscope standard deviation in Z direction

Freq.Body.Acceleration.Magnitude.Mean.Avg = Average of mean frequency body acceleration magnitude

Freq.Body.Acceleration.Magnitude.Stdev.Avg = Average of frequency body acceleration magnitude standard deviation

Freq.Body.Acceleration.Jerk.Magnitude.Mean.Avg = Average of mean frequency body acceleration jerk magnitude

Freq.Body.Acceleration.Jerk.Magnitude.Stdev.Avg = Average of frequency body acceleration jerk magnitude standard deviation

Freq.Body.Gyroscope.Magnitude.Mean.Avg = Average of mean frequency body gyroscope magnitude

Freq.Body.Gyroscope.Magnitude.Stdev.Avg = Average of frequency body gyroscope magnitude standard deviation

Freq.Body.Gyroscope.Jerk.Magnitude.Mean.Avg = Average of mean frequency body gyroscope jerk magnitude

Freq.Body.Gyroscope.Jerk.Magnitude.Stdev.Avg = Average of frequency body gyroscope jerk magnitude standard deviation