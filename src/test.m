close all; clear; clc;

file_str = ''; % 数据文件路径

% 读取文件
[file_path, file_name, file_ext] = fileparts(file_str);
load(fullfile(file_path, [file_name, '.mat']));

% 加载之后应该会有一个 video 和一个 audio 变量
video;
audio;

feature = featureExtract(video, audio);

label = plsClassifier(feature);

label_set = {'Angry', 'Disgust', 'Fear', 'Happy', 'Neutral', 'Sad', 'Surprise'};
label_str = label_set(label);