function  ret = fun_process(filestr)
    [filePath, fileName, fileExt] = fileparts(filestr);
    
    %% load decoded audio and video frames from .mat file.
    load(fullfile(filePath, [fileName, '.mat']));
    
    disp(filestr);
    
    %% load model
    disp('load model');
    addpath('~/Caffe/caffe-master/matlab');
    caffe.set_mode_gpu();
    [age_net, age_mean_value] = loadAgeNet;
    [emotion_net, emotion_mean_value] = loadEmotionNet;
    [places_net, places_mean_value] = loadPlaceNet;
    load('model/ldamodel.mat');
    load('model/pcaresult.mat');
    
    %% face detection
    disp('face detection');
    [faces, ~] = faceDetector(video);
    
    %% video feature
    disp('video feature');
    [emotion_feature, faces] = emotionFeature(faces, emotion_net, emotion_mean_value);
    age_feature = ageFeature(faces, age_net, age_mean_value);
    place_feature = placeFeature(video, places_net, places_mean_value);
    
    video_feature = [emotion_feature, age_feature, place_feature];
    
    %% audio feature
    disp('audio feature');
    audio_feature = extract_audio_features(audio);
    
    %% dimension reduce
    disp('dimension reduce');
    video_feature = video_feature - repmat(mu_video, size(video_feature, 1), 1);
    video_feature = video_feature * v_video;
    
    audio_feature = audio_feature - repmat(mu_audio, size(audio_feature, 1), 1);
    audio_feature = audio_feature * v_audio;
    
    
    %% classification
    disp('classification');
    [~, video_score, ~] = predict(model_video, video_feature);
    [~, audio_score, ~] = predict(model_audio, audio_feature);


    score = 1 * video_score + 0.75 * audio_score;
    [~, pred] = max(score, [], 2);

    ret_set =   {'Angry', 'Disgust', 'Fear', 'Happy', 'Neutral', 'Sad', 'Surprise'};
    
    ret =   ret_set{pred};

end