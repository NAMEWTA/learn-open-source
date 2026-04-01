# nanobot 学习笔记

> 来源：[HKUDS/nanobot](https://github.com/HKUDS/nanobot)
> 简介：超轻量级个人 AI 助手框架，灵感来自 OpenClaw，支持多渠道集成和技能扩展
> 技术栈：Python 3.11+ / Pydantic / OpenAI SDK / Anthropic SDK / Typer / aiohttp / Docker

## 学习目录

- [x] [01-项目全景.md](01-project-overview.md) — 定位、技术栈、目录结构、核心依赖、运行模式
- [x] [02-架构拆解.md](02-architecture.md) — 消息流架构、模块划分、配置体系、事件总线
- [x] [03-Agent核心.md](03-agent-core.md) — Agent Loop、Runner、Context构建、记忆系统
- [x] [04-工具与技能.md](04-tools-and-skills.md) — 内置工具体系、Skills系统、MCP协议集成
- [x] [05-渠道与Provider.md](05-channels-and-providers.md) — 多渠道集成、LLM Provider注册表、插件机制
- [ ] [06-运行机制.md](06-runtime.md) — CLI启动流程、Gateway模式、API服务、会话管理、定时任务
- [ ] [07-二次开发指南.md](07-dev-guide.md) — 扩展点总结、自定义渠道/Provider/工具、实战演练
