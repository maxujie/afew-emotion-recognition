close all; clear; clc;

file_str = ''; % �����ļ�·��

% ��ȡ�ļ�
[file_path, file_name, file_ext] = fileparts(file_str);
load(fullfile(file_path, [file_name, '.mat']));

% ����֮��Ӧ�û���һ�� video ��һ�� audio ����
video;
audio;

feature = featureExtract(video, audio);

label = plsClassifier(feature);

label_set = {'Angry', 'Disgust', 'Fear', 'Happy', 'Neutral', 'Sad', 'Surprise'};
label_str = label_set(label);