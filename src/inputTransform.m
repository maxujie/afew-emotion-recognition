function dst = inputTransform(src, mean_value, output_size)

if size(src, 3) == 1
    src = repmat(src, 1, 1, 3);
end

src = imresize(src, [output_size, output_size]);

% for i = 1:3
%     src(:, :, i) = (src(:, :, i) - min(min(src(:, :, i)))) * 255 / max(max(src(:, :, i)));
% end

src = single(src);

mean_value = imresize(mean_value, [output_size, output_size]);

dst = src(:, :, [3, 2, 1]) - mean_value;
dst = permute(dst, [2, 1, 3]); % permute width and height
end

