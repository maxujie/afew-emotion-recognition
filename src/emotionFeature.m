function [emotion_feature, faces] = emotionFeature(faces, emotion_net, emotion_mean_value)
features = zeros(length(faces), 7);
is_face = true(length(faces), 1);
for i = 1:length(faces)
   f = emotion(faces{i}, emotion_net, emotion_mean_value); 
   features(i, :) = emotion(faces{i}, emotion_net, emotion_mean_value); 
   if max(features(i, :)) < 0.45
       is_face(i) = false;
   end
end

faces = faces(is_face);
features = features(is_face, :);

if isempty(features)
    emotion_feature = zeros(1, 14);
    return
end

emotion_feature = [mean(features, 1), max(features, [], 1)];
end

