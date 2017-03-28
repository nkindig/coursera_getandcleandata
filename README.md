# run_analysis.R

This script assumes that the relevant datasets are already in your working directory.
First it will pull in required columns from the different datasets based on the
descriptions originally provided. After some minor renamings, the test and training
datasets are combined together. All variables are given descriptive names. At this point
the script groups by the subject and activity, then takes the mean of every variable.

