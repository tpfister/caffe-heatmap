% Wrapper to run network on multiple images
function joints = applyNet(files, opt)
opt.numFiles = numel(files);

fprintf('config:\n\n');
disp(opt)
fprintf('\n');

% Initialise caffe
net = initCaffe(opt); 

% Apply network separately to each image
joints = zeros(2, opt.numJoints, opt.numFiles, 'single');
for ind = 1:opt.numFiles
	imFile = files{ind};
	fprintf('file: %s\n', imFile);
	joints(:, :, ind) = applyNetImage([opt.inputDir imFile], net, opt);
	if opt.visualise; waitforbuttonpress; end
end

end