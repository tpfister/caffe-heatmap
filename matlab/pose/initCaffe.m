% Initialise Caffe
function net = initCaffe(opt)
caffe.set_mode_gpu();
gpu_id = 3;  
caffe.set_device(gpu_id);
net = caffe.Net(opt.modelDefFile, opt.modelFile, 'test');
end