function age_feature = ageFeature(faces, age_net, age_mean_value)
features = zeros(length(faces), 8);
for i = 1:length(faces)
   features(i, :) = ageGender(faces{i}, age_net, age_mean_value); 
end

if isempty(features)
    age_feature = zeros(1, 16);
    return
end

age_feature = [mean(features, 1), max(features, [], 1)];
end
