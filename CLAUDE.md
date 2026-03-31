# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 仓库定位

这是一个**个人开源项目学习仓库**。父仓库本身不包含任何应用代码，仅用于：
- 通过 Git 子模块引用各个开源项目的源码
- 在父仓库中编写和管理学习笔记、课程文档
- 子模块会持续增加，不会减少

## 核心规则

### 语言规范
- **所有交互使用中文**，包括对话、注释、commit message、文档内容
- 文档统一使用 Markdown 格式，文件名使用英文或拼音

### 子模块规则（极其重要）
- **子模块内的文件绝对不做任何修改**，子模块是只读的参考源码
- 不在子模块内创建分支、提交、或修改任何文件
- 所有学习产出（笔记、分析、总结）都写在父仓库的 `notes/` 目录下
- 如需引用子模块中的代码，使用代码块复制 + 文件路径标注的方式

### 父仓库编辑规范
- 父仓库中只编辑以下内容：
  - `notes/` 目录下的学习文档
  - `CLAUDE.md`（本文件）
  - `.gitmodules`（添加新子模块时）
  - `.gitignore`
- 不在父仓库根目录堆积零散文件

## 目录结构

```
learn-open-source/
├── CLAUDE.md                  # Claude Code 指引（本文件）
├── .gitmodules                # 子模块配置
├── .gitignore
├── notes/                     # 所有学习文档的根目录
│   ├── README.md              # 学习进度总览与索引
│   ├── deer-flow/             # deer-flow 学习笔记
│   ├── hello-halo/            # hello-halo 学习笔记
│   ├── learn-claude-code/     # learn-claude-code 学习笔记
│   ├── nanobot/               # nanobot 学习笔记
│   └── ...                    # 新增子模块时同步创建对应目录
├── deer-flow/                 # [子模块·只读] bytedance/deer-flow
├── hello-halo/                # [子模块·只读] openkursar/hello-halo
├── learn-claude-code/         # [子模块·只读] shareAI-lab/learn-claude-code
└── nanobot/                   # [子模块·只读] HKUDS/nanobot
```

## 当前子模块

| 子模块 | 来源 | 简介 |
|--------|------|------|
| `deer-flow/` | bytedance/deer-flow | 基于 LangGraph 的 AI 超级智能体（Python + Next.js） |
| `hello-halo/` | openkursar/hello-halo | Halo 博客平台客户端（Electron + Capacitor） |
| `learn-claude-code/` | shareAI-lab/learn-claude-code | Claude Code 学习教程（Python） |
| `nanobot/` | HKUDS/nanobot | AI 智能体框架（Python + Docker） |

## 常用命令

```bash
# 克隆后初始化所有子模块
git submodule update --init --recursive

# 添加新的学习项目
git submodule add <仓库URL> <目录名>
# 然后在 notes/ 下创建对应的笔记目录
mkdir notes/<目录名>

# 更新某个子模块到上游最新版本
git submodule update --remote <目录名>

# 查看子模块状态
git submodule status
```

## 学习文档规范

### 文件命名
- 笔记文件：`notes/<项目名>/XX-主题名.md`（XX 为两位数序号，如 `01-架构概览.md`）
- 索引文件：`notes/<项目名>/README.md`（该项目的学习路线和笔记索引）

### 文档结构模板

每篇学习笔记建议包含：

```markdown
# 主题名称

## 学习目标
简述本次学习要搞清楚什么

## 源码分析
引用子模块中的关键代码，标注文件路径，如：
> 文件：`deer-flow/backend/packages/harness/deerflow/agents/lead_agent/agent.py`

## 关键发现
列出核心设计思路、模式、技巧

## 疑问与思考
记录未解决的问题或延伸思考
```

### 进度总览
`notes/README.md` 作为学习进度的总入口，记录：
- 各项目的学习状态（未开始 / 进行中 / 已完成）
- 每个项目的笔记索引链接

## 新增子模块的流程

当需要学习一个新的开源项目时：

1. 添加子模块：`git submodule add <URL> <目录名>`
2. 创建笔记目录：`mkdir notes/<目录名>`
3. 创建笔记索引：在 `notes/<目录名>/README.md` 中写入项目简介和学习计划
4. 更新本文件的「当前子模块」表格
5. 更新 `notes/README.md` 的进度总览
6. 提交：`git add . && git commit -m "feat: 添加 <项目名> 子模块及学习目录"`
