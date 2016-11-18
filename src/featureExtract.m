function feature = featureExtract(video, audio)

%% Face Detection

[faces_all, frames] = faceDetector(video);

%% 用某种方法选取固定数量的人脸

face_num = 10;
faces = faces_all{1:face_num};

%% 提取人脸情感特征

face_feature_size = 7;
face_emotion_feature = zeros(face_feature_size, face_num);

for i = 1:face_num
    face_emotion_feature(:, i) = faceEmotion(faces{i});
end

%% 提取声音特征

audio_feature = audioFeature(audio);

%% 然后把它们拼起来
feature = [face_emotion_feature(:); audio_feature];

end

