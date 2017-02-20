function [faces, frames] = faceDetector(video)
% face detector

faces = {};
frames = [];

mean_points = [40, 54; 100, 54; 70, 75; 40, 80; 100, 80];


system('rm ./data/Test_frames_data/*');
system('rm ./data/Test_frames_data_ali/*');


for i = 1:2:video.nrFramesTotal
    img = video.frames(i).cdata;
    imwrite(img, sprintf('data/Test_frames_data/%03d.png', i));
end

command = ['LD_LIBRARY_PATH=/usr/local/lib \' ...
    './face_detect_align ./data/Test_frames_data'];

[status, output] = system(command);

strMatch_detect = strfind(output, 'detect');
strMatch_height = strfind(output, 'height');
strMatch_ori = strfind(output, 'ori');

for j = 1:length(strMatch_detect),
    tmpj = strMatch_detect(j);
    tmpr = output(tmpj-10:tmpj-8);
    num_img = str2num(tmpr);
    img = video.frames(num_img).cdata;
    
    id_left = strMatch_height(j) + 10;
    id_right = strMatch_ori(j) - 2;
    points = output(id_left:id_right);
    points = str2num(points);
    points = reshape(points, 2, 5);
    points = points';
    points(4:5, 2) = points(4:5, 2) + 10;
    faces{end+1} = faceAffine(img, points, mean_points);
    frames{end+1} = num_img;
end

if isempty(frames)
   face_detector = vision.CascadeObjectDetector();
    for i = 1:2:video.nrFramesTotal
        img = video.frames(i).cdata;
        bbox  = step(face_detector, img);
        for j = 1:size(bbox, 1)
            faces{end+1} = img(bbox(j, 2):(bbox(j, 2)+bbox(j, 3)), (bbox(j, 1):(bbox(j, 1)+bbox(j, 3))));
            frames(end+1) = i;
        end
    end
end

system('rm ./data/Test_frames_data/*');
system('rm ./data/Test_frames_data_ali/*');
