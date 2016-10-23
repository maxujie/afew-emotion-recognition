# Emotion Recognition On AFEW Dataset

Project for Course _Introduction to Auditory-visual Information System_ in Tsinghua University.

## EmotiW

EmotiW 也就是这个比赛的名字。

- 比赛主页(2016) <https://sites.google.com/site/emotiw2016/challenge-details>
  - 注意页面下方的参考资料，有前两年的 baseline paper，也就是出题时设置的及格线
- 可以去看看 2015 年的比赛结果

## Face Detection

（待完成）

## Facial Emotion Recognition

（待完成）

## Speech Emotion Recognition

（待完成）

## Schedule

| Time | Stage |
|:---: | :---: |
| 10.22~10.30 | 初步调研，阅读往年 paper，找各模块的相关比赛和 model |
| 10.31~11.06 | 测试找到的模块的效果、熟悉 Caffe + Matlab 的使用、设计整体系统结构（特征提取+分类器的组织方式）、设计 Data Augmentation 的方式 |
| 11.07~11.20 | 设计分类器部分的网络结构（全连接 / CNN / RNN），编写训练和测试的 Matlab 和 Caffe Prototxt ，在自己的机器上进行测试训练，比较不同分类器结构的效果 |
| 11.21~11.25 | 训练正式模型 |
| 11.26~11.30 | 收工，写实验报告 |

## 此仓库的使用方式

- 论文调研阶段，找到的参考资料可以开一个 [Issue](https://github.com/maxujie/afew-emotion-recognition/issues) ，附带一两句介绍，用于记录和交流
- 此后会在此仓库中进行开发
