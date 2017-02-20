function [age_net, mean_value] = loadAgeNet

age_proto = 'model/agegender/deploy_age.prototxt';
age_model = 'model/agegender/age_net.caffemodel';
% gender_proto = 'model/agegender/deploy_gender.prototxt';
% gender_model = 'model/agegender/gender_net.caffemodel';
mean_file = 'model/agegender/mean.binaryproto';

mean_value = caffe.io.read_mean(mean_file);
age_net = caffe.Net(age_proto, age_model, 'test');
% gender_net = caffe.Net(gender_proto, gender_model, 'test');
end

