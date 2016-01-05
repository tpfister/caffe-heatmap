# Caffe-heatmap

This is a fork of Caffe that enables training of heatmap regressor ConvNets for the general problem of regressing (x,y) positions in images.


## Pretrained models
- [Fusion model trained on FLIC](http://tomas.pfister.fi/models/caffe-heatmap-flic.caffemodel)
- [Fusion model trained on ChaLearn](http://tomas.pfister.fi/models/caffe-heatmap-chalearn.caffemodel)

## Pre-cropped images and training labels for FLIC
- [Training](http://tomas.pfister.fi/flic_train_cropped_multfact282.tgz)
- [Testing](http://tomas.pfister.fi/flic_test_cropped_multfact282.tgz)
- Note these files require multfact=282 in both training and testing data layers

## Testing instructions

matlab/pose/demo.m provides example code for running the FLIC model on a video


## Training instructions

To start training: 
- Prepare your input images
- Create two label files, one for training and another for testing, in the format:

  train/FILE.jpg 123,144,165,123,66,22 372.296,720,1,480,0.53333 0

  This is a space-delimited file where 
  - the first arg is the path to your image
  - the second arg is a comma-delimited list of (x,y) coordinates you wish to regress (the coordinates in the train/FILE.jpg image space)
  - the third arg is a comma-delimited list of crops & scaling factors of the input image (in order x_left,x_right,y_left,y_right,scaling_fact). Note: These crop & scaling factors are only used to crop the mean image. You can set these to 0 if you aren't using a mean image (for mean subtraction). 
  - the fourth arg is a coordinate 'cluster' (from which you have the option to evenly sample images in training). You can set this to 0.

  Example pre-cropped images and label files for FLIC are provided above.

- Modify file paths in models/heatmap-flic-fusion/train_val.txt 
- Start training: sh train_heatmap.sh heatmap-flic-fusion 1


### Supported augmentations
- Random crop, resize, mirror and rotation

### Heatmap params
- visualise: show visualisations for crops, rotations etc (recommended for testing)
- source: label file
- root_img_dir: directory with images (recommend you store images on ramdisk)
- meanfile: proto file containing the mean image(s) to be subtracted (optional)
- cropsize: size of random crop (randomly cropped from the original image)
- outsize: size that crops are resized to
- multfact: label coordinates in the ground truth text file are multiplied by this (default 1)
- sample_per_cluster: sample evenly across clusters
- random_crop: do random crop (if false, do center crop)
- label_height/width: width of regressed heatmap (must match net config)
- segmentation: segment images on the fly (assumes images are in a segs/ directory)
- angle_max: max rotation angle for training augmentation

### Pose estimation-specific parameters
- flip_joint_labels: when horizontally flipping images for augmentation, if this is set to true the code also swaps left<->right labels (this is important e.g. for observer-centric pose estimation). This assumes that the left,right joint labelsare listed consecutively (e.g. wrist_left,wrist_right,elbow_left,elbow_right)
- dont_flip_first: This option allows you to turn off label mirroring for the first label. E.g. for labels head,wrist_right,wrist_left,elbow_right,elbow_left,shoulder_right,shoulder_left, the first joint is head and should not be swapped with wrist_right.


### Notes
- Ensure that the cropsize is set so that the crop normally covers most of the positions in the image that you wish to regress. E.g. for FLIC we prepared 256x256 cropped input images (cropped as a bounding box around the provided torso point) and used these as input images.


## Paper
Please cite our [ICCV'15 paper](http://www.robots.ox.ac.uk/~vgg/publications/2015/Pfister15a/pfister15a.pdf) in your publications if this code helps your research:

      @InProceedings{Pfister15a,
        author       = "Pfister, T. and Charles, J. and Zisserman, A.",
        title        = "Flowing ConvNets for Human Pose Estimation in Videos",
        booktitle    = "IEEE International Conference on Computer Vision",
        year         = "2015",
      }



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
