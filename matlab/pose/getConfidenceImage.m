% Visualise heatmap
function pdf_img = getConfidenceImage(dist, segcpimg_crop, clr)
num_points = size(dist, 3);
dist = double(dist);

[m, n, ~] = size(segcpimg_crop);
bbox = [1 1 n m];
clrs = lines(num_points);
clrs(3,:) = [0 0 0];
clrs(8,:) = [1 0 0];
clrs(9,:) = [0 1 0];

colours = [0,0,1;
0,1,0;
1,0,0;
1,1,0;
0,1,1;
1,0,1;
0,0,0];
clrs = colours;

if nargin > 2
  clrs = repmat(clr,[9 1]);
end
background = double(~edge(rgb2gray(uint8(segcpimg_crop)), 'canny'));
pdf_img = 0.2 * repmat(background, [1 1 3]) + 0.8*ones(bbox(4), bbox(3),3);

% Normalise the distributions for visualisation
for c = num_points:-1:1
  alpha = repmat(dist(:,:,c) / max(max(dist(:, :, c))), [1 1 3]);
  single_joint_pdf = repmat(permute(clrs(c,:), [1 3 2]), size(dist,1), size(dist,2));
  pdf_img = alpha .* single_joint_pdf + (1-alpha) .* pdf_img;
end

end