% Reformat output heatmap: rotate & permute color channels
function [joints, heatmapResized] = processHeatmap(heatmap, opt)
numJoints = opt.numJoints;
heatmapResized = imresize(heatmap, [opt.dims(2) opt.dims(1)]) - 1;
heatmapResized = permute(heatmapResized, [2 1 3]);
joints = heatmapToJoints(heatmapResized, numJoints);
end