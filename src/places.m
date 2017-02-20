function [places_feature] = places(img, places_net, mean_value)
img = inputTransform(img, mean_value, 224);

out = places_net.forward({img});

places_feature = out{1};
end
