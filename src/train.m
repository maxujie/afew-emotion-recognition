close all; clear; clc;

%% ��������

train_list_str = ''; % ѵ���б�

file_strs = importdata(train_list_str);


feature_size = 100;  % ����
features = zeros(feature_size, size(file_strs, 1)); % ��ѵ������Ԥ�ȷ���ռ�

for i = 1:size(file_strs, 1)
    % ��ȡ�ļ�
    [file_path, file_name, file_ext] = fileparts(file_str);

    load(fullfile(file_path, [file_name, '.mat']));

    features(:, i) = featureExtract(video, audio);
end

%% ѵ��

% �� features �������һЩ����

%% ����ģ��

% ?