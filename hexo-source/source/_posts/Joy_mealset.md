---
title: "Ratina mealset"
date: 2025-08-20 12:00:00
tags:
  - "AI Agent"
  - "MCP"
index_img: /img/AI_Agent/ratina_mealset.jpg
---

# Ratina mealset

* * *

Ratina Mealset是基於Ratina的重構版，嘗試採用我之前開發的MCP Agent配置，並且ASR、TTS等功能都有更新。  
此專案用於自動化展Demo配餐功能。

![Demo](/img/AI_Agent/ratina_mealset.jpg)

## 🚀 核心功能

語音辨識 (ASR): 將使用者語音轉換為文字  
智能代理 (LLM Agent): 基於大型語言模型的對話系統  
多服務協議適配器 (MCP): 連接並調用多種外部服務和工具  
文字轉語音 (TTS): 將回覆轉換成自然的人聲輸出  
語音轉動畫 (A2F): 將語音轉換為數位🐭的面部表情和動作

## 🆙 功能升級

### 重構Agent Service

#### 技術框架升級

-   使用 Agent SDK 重構 Agent Service
    -   支援 Multi-Agent 架構（多 Agent 協作、Agent as tool）
        -   多Agent協作
        -   Agent as tool

#### 開發優化

-   Agent 動態配置
    -   YAML配置檔即時更新Prompt等設定
    -   API熱載入，無須重啟系統
-   支援 LLM 串流輸出文字
-   使用 Redis 及 PostgreSQL 管理記憶，提升可維護性與擴展性
-   容器化部屬，降低部屬難度

### 其餘升級項目

#### 語音對話優化

-   更換TTS及ASR微服務使其支援多語言
-   設計雙層語音佇列系統
    -   分層處理TTS和Digital Human講話排程
    -   避免Digital Human講話重疊
    -   設計簡易文字分段系統讓斷句更自然

#### 系統優化

-   優化開啟流程從10分鐘縮段至6分鐘

## 📋 功能介紹

### 智能點餐系統

通過Prompt Engineering讓Agent知道點餐流程。

![Demo](/img/AI_Agent/flow.jpg)

## 🏅 我的貢獻

-   主導 Agent SDK 重構與技術框架升級，設計並實作 Multi-Agent 架構
-   開發 Agent 動態配置、API 熱載入與 YAML 即時更新機制
-   實作 LLM 串流輸出、記憶體管理（Redis + PostgreSQL）與容器化部屬
-   優化語音對話流程，設計雙層語音佇列與分層排程
-   提升系統啟動效率與整體可維護性
-   使用 Nvidia Omniverse Renderer Microservice 打造逼真的 Digital Human 虛擬形象

## 📚 參考資料

-   \[Omniverse Renderer\][https://docs.nvidia.com/ace/omniverse-renderer-microservice/1.1/index.html#omniverse-renderer-microservice](https://docs.nvidia.com/ace/omniverse-renderer-microservice/1.1/index.html#omniverse-renderer-microservice)
