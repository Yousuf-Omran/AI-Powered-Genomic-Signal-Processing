%% loading the data
data=readtable("D:\project\Databsae\COVID-19\Database.xlsx");
x=length(data.Name);
label=[ones(x/2,1);zeros(x/2,1)];
names=data.Name;
%% filtering data
for i=1:x
    [header,sequence]= fastaread(names{i});
    filter_seq= regexprep(sequence,'N','');
    L(1,i) = length(filter_seq);
    Min = min(L);
    Max= max(L);
end
%% numMapping (EEIP)
for b=1:x
    [header,sequence]=fastaread(names{b});
    filtered_sequence=regexprep(sequence,'N','');
    feature_Seq(b,1:Min)=filtered_sequence(1:Min);
    feature_Num(b,1:Min)=numMappingEIIP(feature_Seq(b,1:Min));
end
%% convert the sequence array to an Excel sheet to handle with in Python
%writematrix(feature_Seq,'filtered_data.xlsx')

%% signal2image
window_length = 256;
scales = 1:256;
N = 256;
parent_folder = 'C:\Users\O.R.G\OneDrive - Helwan university(Engineering (Helwan))\Desktop\test';

covid_matrix = feature_Num(11:20,:);
other_matrix = feature_Num(589:598,:);

% Process the COVID signals
covid_folder = fullfile(parent_folder, 'covid');
if ~exist(covid_folder, 'dir')
    mkdir(covid_folder);
end
for s = 1:size(covid_matrix, 1)
    signal_folder = fullfile(covid_folder, sprintf('covid_%d', s));
    if ~exist(signal_folder, 'dir')
        mkdir(signal_folder);
    end
    
    signal = covid_matrix(s,:);
    num_windows = floor(length(signal) / window_length);
    signal_windows = buffer(signal(1:num_windows*window_length), window_length, 0, 'nodelay');

    for w = 1:num_windows
        % Remove the DC component from the window
        window = signal_windows(:,w) - mean(signal_windows(:,w));
        cwt_coeffs = abs(cwt(window, scales, 'morl'));
        cwt_coeffs_scaled = mat2gray(cwt_coeffs);
        cwt_coeffs_rgb = ind2rgb(gray2ind(cwt_coeffs_scaled, round(N)), jet(255));
        filename = sprintf('covid_%d_cwt_image_window_%d.png', s, w);
        imwrite(cwt_coeffs_rgb, fullfile(signal_folder, filename));
    end
end
%% 
window_length = 256;
scales = 1:256;
N = 256;
parent_folder = 'C:\Users\O.R.G\OneDrive - Helwan university(Engineering (Helwan))\Desktop\test';
other_matrix = feature_Num(579:589,:);
% Process the other coronaviruses signals
other_folder = fullfile(parent_folder, 'other_coronaviruses');
if ~exist(other_folder, 'dir')
    mkdir(other_folder);
end
for s = 1:size(other_matrix, 1)
    signal_folder = fullfile(other_folder, sprintf('other_%d', s));
    if ~exist(signal_folder, 'dir')
        mkdir(signal_folder);
    end
    
    signal = other_matrix(s,:);
    num_windows = floor(length(signal) / window_length);
    signal_windows = buffer(signal(1:num_windows*window_length), window_length, 0, 'nodelay');

    for w = 1:num_windows
        % Remove the DC component from the window
        window = signal_windows(:,w) - mean(signal_windows(:,w));
        cwt_coeffs = abs(cwt(window, scales, 'morl'));
        cwt_coeffs_scaled = mat2gray(cwt_coeffs);
        cwt_coeffs_rgb = ind2rgb(gray2ind(cwt_coeffs_scaled, round(N)), jet(255));
        filename = sprintf('other_%d_cwt_image_window_%d.png', s, w);
        imwrite(cwt_coeffs_rgb, fullfile(signal_folder, filename));
    end
end

%% function of numMapping
function [numSeq]  = numMappingEIIP( sq )
    len = length(sq);  
    numSeq = zeros(1,len,'double');
    for K = 1:len
       t = sq(K);
       if(t=='A')
           numSeq(K) = 0.1260;
       elseif(t=='C')
           numSeq(K) = 0.1340;
       elseif(t=='G')
           numSeq(K) = 0.0806; 
       elseif(t=='T')
           numSeq(K) = 0.1335;
       end           
   end   
end