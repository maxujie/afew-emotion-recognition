# Emotion Recognition On AFEW Dataset

Project for Course _Introduction to Auditory-visual Information System_ in Tsinghua University.

## EmotiW

EmotiW 也就是这个比赛的名字。

- 比赛主页(2016) <https://sites.google.com/site/emotiw2016/challenge-details>
  - 注意页面下方的参考资料，有前两年的 baseline paper，也就是出题时设置的及格线
- 可以去看看 2015 年的比赛结果

## Face Detection

（如果时间允许的话）对视频的每一帧做人脸检测，确定画面中人脸的位置和倾角。

## Facial Emotion Recognition

从视频中取出 n 个人脸，用情感分类器识别人脸的情感，得到一个（可能是）7*n 维的 softmax 概率向量。

暂定用 VGG 模型在 FER-2013 数据集上做一次 finetune ，可能需要再用 SFEW 的数据做一次 finetune。

## Speech Emotion Recognition

尝试用 OpenSMILE 和（或） Yaafe 或其他库提取音频的特征。

可能需要对音频进行分段，然后分别对每一段提取特征。

## Classifier

用以上得到的特征（大约 100 维？）train 一个 SVM 或者 PLS 分类器。由于 MATLAB 貌似已经有现成的函数了，所以直接用 MATLAB 应该就可以。

需要注意的是特征的维度可能有点高，在直接做 SVM 或者 PLS 的性能不好的情况下，可能需要用 LSA 先做降维。

## Schedule (Old)

| Time | Stage |
|:---: | :---: |
| 10.22~10.30 | 初步调研，阅读往年 paper，找各模块的相关比赛和 model |
| 10.31~11.12 | 测试找到的模块的效果、熟悉 Caffe + Matlab 的使用、设计整体系统结构（特征提取+分类器的组织方式）、设计 Data Augmentation 的方式 |
| 11.13~11.20 | 设计分类器部分的结构（全连接 / CNN / RNN / 或者用非神经网络方法？），编写训练和测试的 Matlab 代码和 Caffe Prototxt ，在自己的机器上进行训练，比较不同分类器的效果 |
| 11.21~11.25 | 训练正式模型 |
| 11.26~11.30 | 收工，写实验报告 |

## 此仓库的使用方式

- 论文调研阶段，找到的参考资料可以开一个 [Issue](https://github.com/maxujie/afew-emotion-recognition/issues) ，附带一两句介绍，用于记录和交流
- 此后会在此仓库中进行开发
