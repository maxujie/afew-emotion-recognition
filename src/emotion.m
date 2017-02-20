function [emotion_feature] = emotion(img, emotion_net, mean_value)
img = inputTransform(img, mean_value, 227);
out = emotion_net.forward({img});
emotion_feature = out{1};
end
