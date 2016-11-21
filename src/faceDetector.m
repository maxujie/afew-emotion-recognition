function [faces, frames] = faceDetector(video)
% 输入视频，输出人脸（已经对准后的一小块图片）及所在的帧序号（？）
faces = {};
frames = [];

% 一个使用 Matlab 自带人脸检测的例子
face_detector = vision.CascadeObjectDetector();
for i = 1:video.nrFramesTotal
    img = video.frames(i).cdata;
    bbox  = step(face_detector, img);
    for j = 1:size(bbox, 1)
        faces{end+1} = img(bbox(j, 2):(bbox(j, 2)+bbox(j, 3)), (bbox(j, 1):(bbox(j, 1)+bbox(j, 3))));
        frames(end+1) = i;
    end
end

end
