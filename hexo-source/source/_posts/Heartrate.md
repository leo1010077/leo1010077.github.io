---
title: "熱影像心率檢測儀"
date: 2021-12-31 20:46:25
tags:
  - "生醫"
  - "邊緣運算裝置"
  - "產學合作"
index_img: /img/HR/realtimeGIF2CROP2.gif
---

# 熱影像心率檢測儀

## 摘要

使用傳統的心電圖（ECG）設備進行心臟脈搏的接觸式測量需要患者佩戴黏膠貼片或胸帶，這可能導致皮膚刺激和不適。市面上的血氧儀通常需要夾在手上，這對患者來說也很不方便，且彈簧夾可能會引起疼痛。因此，我們開發了一種新的非接觸式量測技術，利用紅外熱像儀來測量心率。人體皮膚由於血管的周期性收縮和舒張而產生微小的溫度變化。 即使用熱像儀，這些微小的變化也很難被觀察到。為了克服這個困難，我們設計了一個新的卷積神經網絡，用於從臉部皮膚預測心跳。

### 特色

-   無接觸式的心率量測方式
-   基於熱影像受環境光源影響較小
-   運算速度快可實時量測

## 資料集

實驗使用的資料集為自己蒐集的熱影像影片，使用熱影像攝影機拍攝影片搭配接觸式設備蒐集的心率。

![資料集分布](/img/HR/%E8%B3%87%E6%96%99%E5%8F%8A%E5%88%86%E5%B8%83.jpg)  
最終總共蒐集到23位受測者，18位男性5位女性。最終訓練資料有21206筆測試資料集15373筆。

## 提出方法

![Working flow chart](/img/HR/RPPGheartrate.drawio.png)

上圖為系統運作的流程圖，可以將流程分為兩個部分人臉擷取和預測心率。人臉擷取的部分我們使用yolov5s訓練熱影像人臉偵測模型。偵測出人臉後我們會將80幀的人臉合併為一筆資料送進我們設計的模型做預測。  
心率預測的模型為我們自己設計的模型，使用了Convolution Block Attention Module(CBAM)和(2+1)D CNN等機制最終模型的誤差為4.416(BPM)。

## Real-time測試結果

![Real-Time Testing Result](/img/HR/realtimeResultr.jpg)

上表為Real-time測試的結果，我們總共測試了28人/次最終誤差達到5.61(BPM)

下面影片為Real-time測試的影片

<iframe width="480" height="720" src="https://www.youtube.com/embed/hYLwT5vJHHA" title="RPPG Heart Rate Real-Time Testing" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
