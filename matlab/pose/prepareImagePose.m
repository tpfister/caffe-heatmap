% Prepare input image for caffe: change to single & permute color channels
function imgOut = prepareImagePose(img, opt)
img = single(img);
imgOut = permute(img, [2 1 3]);
end 
