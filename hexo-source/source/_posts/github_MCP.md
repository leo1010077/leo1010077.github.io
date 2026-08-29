---
title: "Github MCP Tool"
date: 2026-07-30 12:00:00
tags:
  - "AI Agent"
  - "MCP"
---

# Github MCP Tool

## 前情提要

公司內部有許多Code是不能上傳到雲端Agent的，但在此前提下，還是希望大家可以使用AI來加速開發。 我們設計了一套查詢Git Commit記錄的MCP Tool。 AI Agent在這個過程中只會經手 Commit標題和內文，所有Code都不會傳到雲端LLM那裡。


## 系統架構

系統架構如下，我們架設了一個Server以vLLM運行[jina-code-embeddings-1.5b](https://huggingface.co/jinaai/jina-code-embeddings-1.5b)並在其上運行此服務。

![系統架構圖](/img/github/githubtool.svg)

我們會定時抓取github專案的commit紀錄到本地端，同時透過embedding model建立commit記錄的向量資料庫，此向量資料庫會經由MCP的方式公開此服務，只要是連上此服務的LLM都可以使用此工具查詢我們Github上的commit紀錄。 

我們有額外開發skill來教AI Agent使用此工具的技巧，包含整理出符合大家使用習慣的格式，以及直接把commit的hash整理成超連結給使用者直接點進去確認內容。
