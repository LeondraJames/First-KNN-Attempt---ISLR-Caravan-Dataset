# First-KNN-Attempt---ISLR-Caravan-Dataset
This is my first attempt at a K Nearest Neighbors (KNN) model, where I attempt to classify the purchase of caravan insurance in the Caravan data set (ISLR package). 


The Dataset:
The data contains 5822 real customer records. Each record consists of 86 variables, containing sociodemographic data (variables 1-43) and product ownership (variables 44-86). The sociodemographic data is derived from zip codes. All customers living in areas with the same zip code have the same sociodemographic attributes. Variable 86 (Purchase) indicates whether the customer purchased a caravan insurance policy. Further information on the individual variables can be obtained at http://www.liacs.nl/~putten/library/cc2000/data.html


Steps Include:
- Normalizing features
- Partitioning train and test sets for both the feature and response variable datasets
- Training the model
- Optimizing the k value and plotting the elbow chart
- Calculating the optimal k value's knn model mislcassification error and accuracy rates (94% accuracy, 5.8% misclassification rate)
