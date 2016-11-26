function feature = faceEmotion(faces)
% extract face emotion feature using caffe
feature = zeros(7*length(faces), 1);

% load model
weights = 'model/vgg_emotion.caffemodel';
proto = 'model/deploy_vgg.prototxt';
meanfile = 'model/mean.binaryproto';

caffe.set_mode_cpu();
mean_value = caffe.io.read_mean(meanfile);
net = caffe.Net(proto, weights, 'test');

input_size = 224;  % VGG
mean_value = imresize(mean_value, [input_size, input_size]);

% caffe forward
for i = 1:length(faces)
    img = imresize(faces{i}, [input_size, input_size]);
    net_input = inputTransform(img, mean_value);
    net_output = net.forward({net_input});
    feature((7*i-6):(7*i)) = net_output{1};
end
