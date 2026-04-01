# deer-flow 学习笔记

> 来源：[bytedance/deer-flow](https://github.com/bytedance/deer-flow)
> 简介：字节跳动开源的超级智能体编排框架（v2.0），支持沙箱执行、持久化记忆、子智能体委派和可扩展技能集成
> 技术栈：Python 3.12 + LangGraph + FastAPI（后端） | Next.js 16 + React 19 + TypeScript 5.8（前端）

## 学习目录

### 第一层：项目全景

- [x] [01-项目全景](01-project-overview.md) — 定位、技术栈、目录结构、核心依赖、快速上手

### 第二层：架构拆解

- [x] [02-整体架构](02-architecture.md) — 前后端分离架构、模块划分、数据流全景、核心抽象
- [x] [03-配置体系](03-configuration.md) — config.yaml、环境变量、LangGraph 配置、MCP 配置、多模型配置

### 第三层：后端核心（深入六章）

- [x] [04-LangGraph 图引擎](04-langgraph-engine.md) — StateGraph 构建、节点与边、状态定义、检查点机制
- [x] [05-Lead Agent 主智能体](05-lead-agent.md) — 主智能体构建流程、动态模型选择、系统提示组装、工具绑定
- [x] [06-中间件链](06-middleware-chain.md) — 9 个中间件的职责、执行顺序、实现原理、扩展方式
- [x] [07-沙箱系统](07-sandbox-system.md) — 沙箱抽象接口、本地/Docker 提供者、虚拟路径映射、安全隔离
- [x] [08-子智能体系统](08-subagent-system.md) — 子智能体注册表、后台执行引擎、内置智能体、委派机制
- [x] [09-工具与技能系统](09-tools-and-skills.md) — 内置工具、社区工具、MCP 工具、技能包机制、工具搜索

### 第四层：后端进阶

- [x] [10-记忆系统](10-memory-system.md) — 记忆存储、提取、更新、与中间件的协作、长期记忆管理
- [x] [11-Gateway API 层](11-gateway-api.md) — FastAPI 网关、路由设计、依赖注入、线程/运行管理、文件上传

### 第五层：前端深入

- [x] [12-前端架构](12-frontend-architecture.md) — Next.js App Router、页面路由、布局体系、环境配置
- [x] [13-线程与消息流](13-thread-and-messages.md) — LangGraph SDK 通信、流式处理、TanStack Query 状态管理、消息渲染
- [x] [14-组件体系与交互](14-components-and-ui.md) — Shadcn UI 组件库、AI 元素组件、工件系统、国际化、主题

### 第六层：实战

- [x] [15-二次开发指南](15-extension-guide.md) — 扩展点总览、自定义工具/技能/子智能体/中间件、开发环境搭建、实战演练
