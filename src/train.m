close all; clear; clc;

%% 读入数据

train_list_str = ''; % 训练列表

file_strs = importdata(train_list_str);


feature_size = 100;  % 假如
features = zeros(feature_size, size(file_strs, 1)); % 给训练数据预先分配空间

for i = 1:size(file_strs, 1)
    % 读取文件
    [file_path, file_name, file_ext] = fileparts(file_str);

    load(fullfile(file_path, [file_name, '.mat']));

    features(:, i) = featureExtract(video, audio);
end

%% 训练

% 用 features 在这里搞一些事情

%% 保存模型

% ?