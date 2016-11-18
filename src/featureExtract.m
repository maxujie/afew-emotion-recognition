function feature = featureExtract(video, audio)

%% Face Detection

[faces_all, frames] = faceDetector(video);

%% ��ĳ�ַ���ѡȡ�̶�����������

face_num = 10;
faces = faces_all{1:face_num};

%% ��ȡ�����������

face_feature_size = 7;
face_emotion_feature = zeros(face_feature_size, face_num);

for i = 1:face_num
    face_emotion_feature(:, i) = faceEmotion(faces{i});
end

%% ��ȡ��������

audio_feature = audioFeature(audio);

%% Ȼ�������ƴ����
feature = [face_emotion_feature(:); audio_feature];

end

