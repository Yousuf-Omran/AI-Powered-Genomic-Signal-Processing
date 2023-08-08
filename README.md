# AI-Powered-Genomic-Signal-Processing
proposing effective automated approaches in machine/deep learning based on genomic signal processing (GSP) techniques to detect COVID-19 -used as a case study-, among other human coronavirus (H-CoV) diseases (binary classification).
## Steps of the project:
  
1. Call the 'human coronavirus' dataset from the (.fasta) file.
2. Perform a filtration in data by removing ambiguous nucleotides referred to as 'N'.
  Perform an Equalization in the lengths of the samples by cutting samples according to the smallest one.
  Split the data into 85% training and validation, and 15% testing data.
  Apply the 'EIIP' Numerical representation to the DNA bases.
the previous 5 steps are in common with ML and DL studies.
  ML-study:
     Apply 'STFT' signal processing technique to enhance the data quality:
     Apply the 't-test' statistical feature selection method to obtain the most significant features in data.
     Use the models 'KNN' (with k=3,5,7), 'LSVM', 'GSVM', 'DT', and 'Random Forest' (with n=11,51,101), with data to fit and then predict the labels.
     Evaluate the processing steps performance by statistical metrics 'accuracy', 'precision', 'recall', 'specificity', and 'F1-score'.
  DL-study:
     Segment each sample with a window length of 256 to enlarge the data samples to be in the shape of (119068 x 256) and apply feature extraction techniques efficiently. 
     Apply the 'FFT' method in 1D-CNN, and the 'CWT' method to convert the signal into an image and deal with it in 2D-CNN.
     Build the model architecture in a 1D-CNN study, and VGG-16-based and EfficientNet-b0-based models in a 2D-CNN study.
     Use a grid search method for hyperparameters tuning and selecting the optimal hyperparameters for training.
     Fit, predict, plot the ROC curve, and evaluate the performance of all models constructed. 
     
     
     
    
