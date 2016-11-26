function [faces, frames] = faceDetector(video)
% face detector
faces = {};
frames = [];

% Matlab face detector
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
