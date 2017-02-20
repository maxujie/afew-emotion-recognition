function age_feature = ageGender(img, age_net, mean_value)

img = inputTransform(img, mean_value, 227);

age_out = age_net.forward({img});

age_feature = age_out{1};
end
