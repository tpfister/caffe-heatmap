#!/bin/bash
#
# Caffe training script
# Tomas Pfister 2015

if [ "$2" = "" ]; then
	echo "$0 net_name gpu_id [snap_iter] [finetune:0/1]"
	exit
fi
net=$1
gpu_id=$2
snap_iter=$3
finetune=$4
snap_dir="/data/tp/nets/$net/snapshots/"
snapfile="heatmap_train";

mkdir -p $snap_dir
if [ "$finetune" = "1" ]; then cmd="weights"; ext="caffemodel"; else cmd="snapshot"; ext="solverstate"; fi
if [ "$snap_iter" != "" ] &&  [ "$snap_iter" != "-1" ]; then snap_str="-$cmd $snap_dir/${snapfile}_iter_$snap_iter.$ext"; fi

./build/tools/caffe train $snap_str \
-gpu $gpu_id -solver models/$net/solver.prototxt 2>&1 | tee -a $snap_dir/train_0.log
