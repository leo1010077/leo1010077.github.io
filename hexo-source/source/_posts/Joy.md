---
title: "Digital Human Demokit"
date: 2025-05-20 12:00:00
tags:
  - "AI Agent"
  - "Demo"
  - "MCP"
index_img: /img/AI_Agent/ratina.jpg
---

# Digital Human Demokit

RATINA 是一個綜合性的數位🐭聊天系統，結合了多種 AI 技術，包括語音辨識、大型語言模型、文字轉語音以及動畫生成，打造出能夠與人類自然互動的數位助理。  
此專案用於Computex Demo AI Agent和機器手臂的連動。

![Demo](/img/AI_Agent/ratina.jpg)

## 🚀 核心功能

語音辨識 (ASR): 將使用者語音轉換為文字  
智能代理 (LLM Agent): 基於大型語言模型的對話系統  
多服務協議適配器 (MCP): 連接並調用多種外部服務和工具  
文字轉語音 (TTS): 將回覆轉換成自然的人聲輸出  
語音轉動畫 (A2F): 將語音轉換為數位🐭的面部表情和動作

## 🏗️ 技術架構

![技術框架](/img/AI_Agent/digital_human_white.jpg)

-   Digital Human 使用Nvidia的 Ominverser Renderer
-   TTS和ASR使用 Nvidia NIM提供的Service
-   各項微服務使用Docker Compose部屬

## 📋 功能介紹

### 智能RAG問答系統

通過RAG系統回答

-   公司資訊
-   展場資訊
-   產品Spec

### 機器手臂互動

通過自行開發的MCP Server和機器手臂互動

-   吸取餅乾
-   給顧客贈品
-   拍攝主機板瑕疵照片並辨識

* * *

## 🏅 我的貢獻

### 系統架構設計

-   獨立調研Nvidia生態系統
-   設計微服務整合方案
-   規劃服務通訊與資料流向

### 後端開發

-   完整負責後端系統開發
-   整合API Gateway
-   開發Agent 核心功能

### 跨領域協作

-   與前端工程師協作定義API介面和通訊協議
-   與機器手臂合作廠商對接通訊協議
-   與PM、行銷協作優化RAG資料庫

### 技術整合

-   整合並部屬多個NIM服務，確保系統運行
-   實作語音對話的完整流程處理

## 📚 參考資料

-   \[Omniverse Renderer\][https://docs.nvidia.com/ace/omniverse-renderer-microservice/1.1/index.html#omniverse-renderer-microservice](https://docs.nvidia.com/ace/omniverse-renderer-microservice/1.1/index.html#omniverse-renderer-microservice)
