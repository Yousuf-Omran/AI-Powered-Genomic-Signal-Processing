# AI-Powered Genomic Signal Processing
## Project aim:
proposing effective automated approaches in machine/deep learning based on genomic signal processing (GSP) techniques to detect COVID-19 -used as a case study-, among other human coronavirus (H-CoV) diseases  by using a binary classification.
## Project steps:
 - Call the 'human coronavirus' dataset from the (.fasta) files (1156 samples).
 - Filter the data by removing ambiguous nucleotides referred to as 'N'.
 - Match the lengths of the samples in size by cutting them according to the smallest length (26068 bases).
 - Split the data into 85% training and validation data, and 15% testing data.
 - Apply the 'EIIP' Numerical representation to the DNA bases.
##### The 5 previous steps are in common with ML and DL studies.
 - ML-study:
    - Apply 'STFT' signal processing technique to enhance the data quality:
    - Apply the 't-test' statistical feature selection method to obtain the most significant features in data.
    - Use the models 'KNN' (with k=3,5,7), 'LSVM', 'GSVM', 'DT', and 'Random Forest' (with n=11,51,101), with data to fit and then predict the labels.
    - Evaluate the performance of processing steps by statistical metrics 'accuracy', 'precision', 'recall', 'specificity', and 'F1-score'.
 - DL-studies (1D-CNN and 2D-CNN):
    - Segment each sample with a window length of 256 to enlarge the data samples to be in the shape of (119068 x 256) and to apply feature extraction techniques efficiently. 
    - Apply the 'FFT' method in 1D-CNN, and the 'CWT' method to convert the signal into an image and deal with it in 2D-CNN.
    - Build the model architecture in a 1D-CNN study, and VGG-16-based and EfficientNet-b0-based models in a 2D-CNN study.
    - Use a grid search method for hyperparameters tuning and selecting the optimal hyperparameters for training.
    - Fit, predict, plot the ROC curve, and evaluate the performance of all models constructed.
## Results:
The results showed that the 'KNN' and 'Random Forest' algorithms, trained on STFT data, achieved the best accuracy of 99.57%. Additionally, the 1D-CNN and 2D-CNN models trained on numeric and FFT data achieved 100% accuracy but 1D-CNN takes the vantage with a less processing time computation of 8.4 min.
## Conclusion:
These studies demonstrate that such approaches can accurately classify COVID-19 and other coronaviruses, highlighting their robustness and reliability in handling such data. 
