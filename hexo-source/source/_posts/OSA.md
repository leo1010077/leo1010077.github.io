---
title: "可攜式睡眠呼吸檢測儀"
date: 2023-03-15 20:46:25
tags:
  - "生醫"
  - "邊緣運算裝置"
  - "產學合作"
  - "3D列印"
index_img: /img/OSA/機器運作整晚圖_crop.jpg
---

# 可攜式睡眠呼吸檢測儀

## 摘要

傳統檢測睡眠呼吸中止症的方法是到睡眠中心做睡眠多項生理檢查(Polysomnography)，但此檢查昂貴且不適。我們希望設計一台便攜且設置方便的機器使睡眠呼吸中止症的檢查更加簡單。

### 特色

-   機身輕巧方便攜帶
-   設置簡單
-   發熱量低且無聲
-   簡易app方便使用

## 資料蒐集

訓練模型所需的資料由某大型醫院提供，資料蒐集的方式為進入病人家中設置錄音配備和HST(Home Sleep Testing)設備，同時蒐集受測者的聲音和相關生理訊號作為GT，目前蒐集到63人/次。

![資料標記流程圖](/img/OSA/dataflowchart.jpg)

蒐集到的資料再透過上圖的流程整理為可使用的資料再將其轉為頻域資訊後便為我們的訓練資料。

## 實作流程

### 模型設計&訓練

我們基於CNN(convolution neuron network)設計我們的神經網路架構，並加入了Residual Block等架構提高模型的準度。

訓練時我們加入了四種自己設計的資料增強(data augment)來提升模型的準度和魯棒性，並採用K-Fold的方式訓練。

### 機器設計

<table><thead><tr><th><img src="/img/OSA/OSA_MECH.png" alt="機器設計示意圖"></th><th><img src="/img/OSA/%E6%A9%9F%E5%99%A8%E5%AF%A6%E9%AB%94%E5%9C%96.jpg" alt="機器外觀"></th></tr></thead></table>

上圖是我們的可攜式睡眠呼吸檢測儀，此裝置是基於樹莓派(Raspberry Pi)開  
發的非接觸式的睡眠呼吸檢測裝置。此裝置由 Raspberry Pi 4B 8GB、BOYA BYM100UA、Kneron KL52 神經網路加速棒和 LCD1602 構成，使用的系統為  
Raspberry Pi OS-Buster。

KL520 是由 Kneron 設計的高效能的邊緣 AI 推理裝置，該裝置的特色為超低功耗和高效能的神經網路推理運算能力，因此我們可以透過此加速棒提供的運算能力使整晚運作的機器不會因為過熱導致當機甚至發生其他危險。  
![運作整晚結果](/img/OSA/%E6%A9%9F%E5%99%A8%E9%81%8B%E4%BD%9C%E6%95%B4%E6%99%9A%E5%9C%96_crop.jpg)

### 手機APP

![APP介面](/img/OSA/APP1.jpg)

上圖為配合機器設計的簡易APP，此APP基於Kotlin開發並使用Rfcomm藍芽協議和裝置溝通。受測者可以使用此APP使用機器測量結果也會直接回傳至手機方便紀錄結果。

## 結果展示

<iframe width="720" height="480" src="https://www.youtube.com/embed/LRRW_RfHFD4" title="RPPG Heart Rate Real-Time Testing" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
