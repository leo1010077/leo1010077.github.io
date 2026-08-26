---
title: "基礎MCP Agent"
date: 2025-06-30 12:00:00
tags:
  - "AI Agent"
  - "MCP"
index_img: /img/AI_Agent/MCP_agent.jpg
---

# MCP Agent

一個基於Open AI Agent SDK 和 Model Context Protocol(MCP)的Agent配置工具，提供子代理、工具代理等功能的配置。

![概念圖片](/img/AI_Agent/MCP_agent.jpg)  
此圖為基礎功能的圖片，通過此工具可以配置一個多Agent協作的系統，且可以配置MCP Server使用。

## ✨ 功能特色

🤖 多層級代理架構: 支援主代理、子代理和工具代理  
🔧 MCP 伺服器整合: 支援多種 MCP 工具和資源  
🌐 RESTful API: 完整的 FastAPI 後端服務  
🐳 Docker 支援: 容器化部署，簡化環境設定  
⚙️ 可配置化: 靈活的代理和工具配置系統  
🧠 記憶管理系統: 結合 Redis 快取與 PostgreSQL 永久儲存，實現高效且可擴展的 Agent 記憶體管理
