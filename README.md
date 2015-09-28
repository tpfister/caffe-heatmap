# Caffe-heatmap

This is a fork of Caffe that enables training of heatmap regressor ConvNets for the general problem of regressing (x,y) positions in images.

To start training: 
- Prepare your input images as images
- Create two label files, one for training and another for testing, in the format:

  train/FILE.jpg 123,144,165,123,66,22 0

  This is a space-delimited file where 
  - the first arg is the path to your image
  - the second arg is a comma-delimited list of (x,y) coordinates you wish to regress
  - the third arg is a coordinate 'cluster' (from which you have the option to evenly sample images in training). You can set this to 0.

- Modify file paths in models/heatmap-flic-fusion/train_val.txt 
- Start training: sh train_heatmap.sh heatmap-flic-fusion 1


## Supported augmentations:
- Random crop, resize, mirror and rotation

## Heatmap params:
- visualise: show visualisations for crops, rotations etc (recommended for testing)
- source: label file
- root_img_dir: directory with images (recommend you store images on ramdisk)
- cropsize: size of random crop
- outside: size that crops are resized to
- sample_per_cluster: sample evenly across clusters
- random_crop: do random crop (if false, do center crop)
- label_height/width: width of regressed heatmap (must match net config)
- segmentation: segment images on the fly (assumes images are in a segs/ directory)
- dont_flip_first: when mirroring images for augmentation, this option allows you to turn off label mirroring (e.g. if the first joint is a head)
- angle_max: max rotation angle for training augmentation




# Caffe

Caffe is a deep learning framework made with expression, speed, and modularity in mind.
It is developed by the Berkeley Vision and Learning Center ([BVLC](http://bvlc.eecs.berkeley.edu)) and community contributors.

Check out the [project site](http://caffe.berkeleyvision.org) for all the details like

- [DIY Deep Learning for Vision with Caffe](https://docs.google.com/presentation/d/1UeKXVgRvvxg9OUdh_UiC5G71UMscNPlvArsWER41PsU/edit#slide=id.p)
- [Tutorial Documentation](http://caffe.berkeleyvision.org/tutorial/)
- [BVLC reference models](http://caffe.berkeleyvision.org/model_zoo.html) and the [community model zoo](https://github.com/BVLC/caffe/wiki/Model-Zoo)
- [Installation instructions](http://caffe.berkeleyvision.org/installation.html)

and step-by-step examples.

[![Join the chat at https://gitter.im/BVLC/caffe](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/BVLC/caffe?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Please join the [caffe-users group](https://groups.google.com/forum/#!forum/caffe-users) or [gitter chat](https://gitter.im/BVLC/caffe) to ask questions and talk about methods and models.
Framework development discussions and thorough bug reports are collected on [Issues](https://github.com/BVLC/caffe/issues).

Happy brewing!

## License and Citation

Caffe is released under the [BSD 2-Clause license](https://github.com/BVLC/caffe/blob/master/LICENSE).
The BVLC reference models are released for unrestricted use.

Please cite Caffe in your publications if it helps your research:

    @article{jia2014caffe,
      Author = {Jia, Yangqing and Shelhamer, Evan and Donahue, Jeff and Karayev, Sergey and Long, Jonathan and Girshick, Ross and Guadarrama, Sergio and Darrell, Trevor},
      Journal = {arXiv preprint arXiv:1408.5093},
      Title = {Caffe: Convolutional Architecture for Fast Feature Embedding},
      Year = {2014}
    }
