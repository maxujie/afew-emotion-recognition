function [emotion_net, mean_value] = loadVggEmotionNet

proto = 'model/alexnet_emotion/deploy.prototxt';
model = 'model/alexnet_emotion/FER_AlexNet.caffemodel';
mean_file = 'model/googlenet_places205/imagenet_mean.binaryproto';

mean_value = caffe.io.read_mean(mean_file);
emotion_net = caffe.Net(proto, model, 'test');
end
