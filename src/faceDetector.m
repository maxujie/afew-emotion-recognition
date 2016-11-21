function [faces, frames] = faceDetector(video)
% ������Ƶ������������Ѿ���׼���һС��ͼƬ�������ڵ�֡��ţ�����
faces = {};
frames = [];

% һ��ʹ�� Matlab �Դ�������������
face_detector = vision.CascadeObjectDetector();
for i = 1:video.nrFramesTotal
    img = video.frames(i).cdata;
    bbox  = step(face_detector, img);
    for j = 1:size(bbox, 1)
        faces{end+1} = img(bbox(1, 2):(bbox(1, 2)+bbox(1, 3)), (bbox(1, 1):(bbox(1, 1)+bbox(1, 4))));
        frames(end+1) = i;
    end
end

end
