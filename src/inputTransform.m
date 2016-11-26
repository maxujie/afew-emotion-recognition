function dst = inputTransform(src, mean_value)
% transform face image so that we can use caffe model to extract its emotion feature

if size(src, 3) == 3
    src = rgb2gray(src);
end

src = histeq(src);
src = repmat(src, 1, 1, 3);
src = single(src);

dst = src(:, :, [3, 2, 1]) - mean_value;
dst = permute(dst, [2, 1, 3]); % permute width and height
end
