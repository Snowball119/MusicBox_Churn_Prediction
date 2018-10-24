# MusicBox Churn Rate Prediction and Recommender System

Accurately predicting churn is critical to long-term business success. This project analyzed the the data from anonymous MusicBox and predicted whether an user will churn after a short period (i.e. 30 days) to perform possible campaigns and tactics to retain those customers who are more likely to churn.

Firstly, pre-processed the data, uncovered and created predictive features from it. Then applied classification algorithms to train the models, evaluated the performance and analyzed their discrepancies. By tuning these models, we made best prediction by random forest model and got test data prediction accuracy at 90.2%.



## 1.Prerequisites

What you need is Pyspark and Jupyternotebook.

1.Download and install Anaconda.

2.Download Apache Spark.

3.Install java on your laptop

4.Use terminal and type

` tar -zxvf spark-1.6.0-bin-hadoop2.6.tgz ` 

`ls -a`

`nano.bach_profile`



## Data preprocessing

1. Download data from AWS S3 to local file. Rename log data for further data process.

2. Uppack and clean files for download, play, and search log.

3. Remove bot and apply downsampling by user id. Generate event file that records each user's behavior. Download dataset includes features like uer id, device and song id.

   Play dataset includes information regarding device, play time and song length.

   Search dataset has origin features user id, device and search date.



##  Label Defination

The timespan of whole dataset is from 2017-03-30 to 2017-05-12.

Use 2017-03-30 to 2017-04-28 totally 30 days as feature window, and use the last part as label window.

If one user is active between feature window and still have a log in label window, then the label = 0, not churned.

If one user is active in feature window, but wasn't tracked in the label window, then the label = 1, which means the user is churn.

This project is a binary classification problem.



## Feature Engineering

Features of the following aspect were generated:

1.Frequency. Frequency in last 1, 3, 7, 14, 30 days of 3 event were generated.

2.Recency. Number of days from last event to the end of feature window.

3.Ratio between different time periods of play, download, search behavior.

4.Profile features include device type, whether a song is finished, the percentage of a song is finished. 







## Model Training

In file 5, scikit-learn is used to train the model.  Spark ML lib is used as well in file6.









## Summary and Conclusion

If include frequecny features only, and with model keep the same. AUC is 0.89.

After adding recency, and profile features









