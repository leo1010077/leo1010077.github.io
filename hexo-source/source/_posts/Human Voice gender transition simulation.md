---
title: "性別轉換聲音模擬"
date: 2024-03-11 16:00:00
tags:
  - "生醫"
index_img: /img/VoiceTransform/pic.png
---

# 性別轉換聲音模擬

## 前言

本專案和亞東醫院合作設計一個程式在聲帶手術前就透過模擬系統讓受測者對自己做完手術的聲音有個概念和變音器不同的是我們要盡可能的保留受測者聲音的細節，使調高/低音調後的聲音聽起來也像是本人的聲音。

## 簡介

影響聲音的身體部位可以簡單粗分部分，分別是聲帶和共振腔。其中聲帶影響聲高、共振腔影響音色。所以我們的目標是把 共振腔的效果提取出來，保留其原來的音色調整聲高後再將共振腔的效果放回聲音中以保留受測者原本的音色。

## 提出方法

### 聲音的構成

![人聲頻譜圖](/img/VoiceTransform/HumonSound.jpg)

上圖是人聲的頻譜圖，人聲是由基頻和共鳴腔共同影響所構成的，基頻來自聲帶，共鳴腔由喉嚨、口腔等部位構成。

![理想聲音](/img/VoiceTransform/IdealSound.jpg)

上圖是沒有共振腔作用的人聲波型，其中F0為基頻F0的n被稱為harmonic。  
頻率每高八度音(Octave)震幅就會降低12分貝，每八度音代表頻率提高一倍。

### 得到共鳴腔

在實作的過程中我們並無法得到共振腔確實的數據，所以我們只能夠盡可能的模擬其效果。為此我們設計了一個方法模擬共振腔對聲音的影響將其從人的聲音中取出來藉此得到聲帶發出來的聲音，再調整聲音的頻率來達到模擬聲帶手術的效果 最後再重新加入共振腔的效果，達到調整聲音且不失去受測者原來聲音的細節的效果。

![得到共鳴腔](/img/VoiceTransform/GetHarmonic.jpg)

上圖為我們設計用於得到harmonic的方法，我們從包含基頻在內的前四個harmonic中挑一個最接近聲音分貝大小的harmonic為基礎。

根據每八度音震幅就降低12分貝的原則生成一個模擬頻率/分貝曲線，將實際人聲曲線減去模擬人聲曲線可以得到模擬共鳴腔的效果。

### 調整共鳴腔

根據分貝的公式  
![公式1](/img/VoiceTransform/db.png)  
其中amp0為起始頻率、amp1為調整後的頻率，我們可以反過來推導出  
![公式2](/img/VoiceTransform/db2.png)  
以此公式我們可以直接調整特定頻段的震幅，其中mask代表+/-分貝數分別為+1/-1。

### 音階、音程

再調整頻率前要先介紹一下音高的計算方式。  
![音程、音階](/img/VoiceTransform/OctaveBin.png)  
前文中有提到的八度音(Octave)也就是一個音程，在圖上代表的是一列。而音階代表的是一個音程中的一格。  
以75和110為例，對應至圖表中可以看到從D2跳至A2總共8階。

### 調整聲音頻率

調整頻率的方式採用librosa的pitch\_shift

![PitchShift](/img/VoiceTransform/PitchShift.png)

其中bins\_per\_octave代表一個音程要分為幾個音階，以上面的圖為例一個音程共分為12個音階。  
所以每個音階的頻率差為2^(1/12)約為1.059

n\_steps則代表要提升/降低幾個音階(可以設定為小數)所以經過調整的頻率為  
![調整頻率](/img/VoiceTransform/freq.png)

### 求得n\_steps

![n\_step](/img/VoiceTransform/n_step.png)

以75跳至95和125為例

(95/75) = (2^(1/12))^x 解出此方程式x為4.095

(125/75) = (2^(1/12))^x 解出此方程式x為8.844

將解出的x帶入n\_steps就可以正確的調整聲音的頻率

## 結果展示

### 結果展示 - 調高

<iframe width="1063" height="606" src="https://www.youtube.com/embed/G7oGPR-FGcI" title="變聲手術效果模擬-調高" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>

### 結果展示 - 調低

<iframe width="1055" height="602" src="https://www.youtube.com/embed/jJmdmcD6ZrI" title="變聲手術效果模擬-調低" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>

### 参考連結

1.  人聲曲線相關圖片來自亞東醫院的ppt [↩](#fnref:1)
2.  音階、音程 : [https://www.youtube.com/watch?v=czGQiTHaffM](https://www.youtube.com/watch?v=czGQiTHaffM) [↩](#fnref:2)
3.  Pitch\_shift : [https://librosa.org/doc/main/generated/librosa.effects.pitch\_shift.html](https://librosa.org/doc/main/generated/librosa.effects.pitch_shift.html) [↩](#fnref:3)
