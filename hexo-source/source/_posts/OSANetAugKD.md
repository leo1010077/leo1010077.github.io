---
title: "KDBNA使用Knowledge Distillation強化NetAug訓練輕量化模型"
date: 2023-05-11 20:46:25
tags:
  - "生醫"
  - "模型輕量化"
  - "碩論"
index_img: /img/OSANetAug/NetAugKD.png
---

# 使用Knowledge Distillation強化NetAug訓練輕量化模型

## 摘要

### 前言

在結合OSA的相關實驗中我們使用了加速棒來使整套系統運作在一個穩定的狀態不會出現過熱當機或是其他危險狀況，但是加速棒的運作流程中需要將模型進行量化等一系列操作，不僅不方便操作對模型的準確度還是有一定的損害。因此我們希望透過直接訓練一個輕量化的模型直接使用在樹莓派上。

### 簡介

在本實驗中我們結合NetAug<sup id="fnref:1" class="footnote-ref"><a href="#fn:1" rel="footnote"><span class="hint--top hint--rounded" aria-label="Network Augmentation for Tiny Deep Learning : https://arxiv.org/abs/2110.08890">[1]</span></a></sup>和KD<sup id="fnref:2" class="footnote-ref"><a href="#fn:2" rel="footnote"><span class="hint--top hint--rounded" aria-label="Paying More Attention to Attention: Improving the Performance of Convolutional Neural Networks via Attention Transfer : https://arxiv.org/abs/1612.03928">[2]</span></a></sup>兩種方法，透過KD強化NetAug訓練一個輕量化的模型最終實現模型參數量在1 / 40的情況下模型的準確度保持了一樣的水準。

## 提出方法

### NetAug

![NetAug](/img/OSANetAug/NetAug2.png)

上圖是NetAug的做法。NetAug全名是Network Augmentation，是透過訓練一個增強模型來加強base model的訓練方法。在宣告模型時我們會宣告一個比base model大的Aug model其中的base model只是Aug model的一部分，在訓練時我們會同時訓練base model和隨機開啟權重的aug model(一定包含base model)，將這兩個loss相加後再更新模型的權重。我們認為這個方式是透過同時訓練大模型的同時將小模型訓練得更好。

### NetAugKD

![KDBNA Flowchart](/img/OSANetAug/NetAugKD2.png)

上圖是我們結合NetAug和KD的做法。KD的teacher model是預訓練好的完整的resnet18、student model是NetAug的max model。我們透過KD的方式將Teacher model的學到的特徵教給Student Model，而student model會再透過NetAug的方式交給NetAug的base model。我們認為這樣的學習方式可以改善NetAug訓練過程中NetAug model中Aug出來的部分準確度不佳導致NetAug的訓練方式反過來拖累base model的訓練。

### 實驗結果

![KDBNA Result](/img/OSANetAug/NetAugKD_Result_no.png)

上圖是我們的實驗結果，藍色底是teacher model，綠色底是我們提出的方法。從上圖可以看到透過結合KD和NetAug的方法我們的模型F1達到了0.838，不只比分別使用NetAug和KD高也比做為teacher model的完整resnet18高，但我們的模型參數量僅有0.28M。

![KDBNA FPS Result](/img/OSANetAug/NetAugKD_ResultFPS_no.png)

上圖是我們的輕量化模型和ResNet-18的FPS比較，可以看到在使用CPU運算的情況下我們的FPS為175.75和ResNet-18相比快了7.8倍。實驗中的一張圖片為8秒鐘的音檔轉換成的Mel-spectrogram。

## 相關連結

### 論文連結

論文網站連結 [https://hdl.handle.net/11296/82hwe7](https://hdl.handle.net/11296/82hwe7)

### 参考連結

<section class="footnotes"><div class="footnote-list"><ol><li><span id="fn:1" class="footnote-text"><span>Network Augmentation for Tiny Deep Learning : <a target="_blank" rel="noopener" href="https://arxiv.org/abs/2110.08890">https://arxiv.org/abs/2110.08890</a>
<a href="#fnref:1" rev="footnote" class="footnote-backref"> ↩</a></span></span></li><li><span id="fn:2" class="footnote-text"><span>Paying More Attention to Attention: Improving the Performance of Convolutional Neural Networks via Attention Transfer : <a target="_blank" rel="noopener" href="https://arxiv.org/abs/1612.03928">https://arxiv.org/abs/1612.03928</a>
<a href="#fnref:2" rev="footnote" class="footnote-backref"> ↩</a></span></span></li></ol></div></section>
