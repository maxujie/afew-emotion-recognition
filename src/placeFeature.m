function place_feature = placeFeature(video, place_net, place_mean_value)
features = zeros(length(video.nrFramesTotal), 205);
for i = 1:5:length(video.nrFramesTotal)
   img = video.frames(i).cdata;
   features(i, :) = places(img, place_net, place_mean_value); 
end


if isempty(features)
    place_feature = zeros(1, 410);
    return
end

place_feature = [mean(features, 1), max(features, [], 1)];
end