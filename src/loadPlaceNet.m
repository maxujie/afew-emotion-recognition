function [places_net, mean_value] = loadPlacesNet
proto = 'model/googlenet_places205/deploy_places205.prototxt';
model = 'model/googlenet_places205/googlelet_places205_train_iter_2400000.caffemodel';
mean_file = 'model/googlenet_places205/imagenet_mean.binaryproto';

mean_value = caffe.io.read_mean(mean_file);
places_net = caffe.Net(proto, model, 'test');

end
