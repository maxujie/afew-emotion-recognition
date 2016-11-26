close all; clear; clc;

file_str = '../../Angry/000046280.avi';

[file_path, file_name, file_ext] = fileparts(file_str);
load(fullfile(file_path, [file_name, '.mat']));

feature = featureExtractTraining(video, audio);

figure;
hold on;
for i = 1:7
    plot(i:7:length(f), f(i:7:end));
end