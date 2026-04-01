# Open Source Learning Hub - 开源代码学习中心

这是一个集中式的代码学习平台，用于系统性地学习和研究各种优秀的开源框架和库。

## 📚 项目结构 / Project Structure

```
learn-open-source/              # 父仓库 - 总学习中心
├── deer-flow/                  # 子模块 1: Deer Flow 框架
├── hello-halo/                 # 子模块 2: Hello Halo 项目
├── learn-claude-code/          # 子模块 3: Claude Code 学习
├── nanobot/                    # 子模块 4: NanoBot 框架
└── claude-code/                # 子模块 5: Claude Code 最佳实践
```

## 🎯 学习目标 / Learning Goals

- **系统性学习**: 通过 Git 子模块管理多个开源项目
- **版本控制**: 每个子模块保持独立的版本历史
- **代码研究**: 深入理解优秀开源项目的架构和实现
- **实践应用**: 将学到的知识应用到实际开发中

## 📖 子模块介绍 / Submodules Overview

### 1. Deer Flow (`deer-flow/`)
- **用途**: [在此填写学习目标]
- **技术栈**: [在此填写技术栈]
- **学习重点**: [在此填写学习重点]

### 2. Hello Halo (`hello-halo/`)
- **用途**: [在此填写学习目标]
- **技术栈**: [在此填写技术栈]
- **学习重点**: [在此填写学习重点]

### 3. Learn Claude Code (`learn-claude-code/`)
- **用途**: [在此填写学习目标]
- **技术栈**: [在此填写技术栈]
- **学习重点**: [在此填写学习重点]

### 4. NanoBot (`nanobot/`)
- **用途**: [在此填写学习目标]
- **技术栈**: [在此填写技术栈]
- **学习重点**: [在此填写学习重点]

### 5. Claude Code (`claude-code/`)
- **用途**: Claude Code 最佳实践和高级用法
- **技术栈**: AI 编程助手、自动化脚本
- **学习重点**: AI 辅助编程的高级技巧和工作流

## 🛠️ 使用指南 / Usage Guide

### 初始化子模块 / Initialize Submodules

```bash
# 克隆主仓库后，初始化所有子模块
git submodule update --init --recursive

# 或者单独更新某个子模块
git submodule update --init deer-flow
```

### 更新子模块 / Update Submodules

```bash
# 更新所有子模块到最新版本
git submodule update --remote

# 更新特定子模块
git submodule update --remote deer-flow
```

### 在子模块中学习 / Learning in Submodules

```bash
# 进入子模块目录
cd deer-flow

# 查看子模块的 git 状态
git status

# 切换分支进行学习
git checkout -b study-branch

# 创建学习笔记分支
git checkout -b notes/feature-name
```

## 📝 学习方法论 / Learning Methodology

### 建议的学习流程：

1. **通读项目结构** - 了解整体架构和目录组织
2. **阅读文档** - 仔细阅读 README、文档和注释
3. **运行示例** - 按照文档运行示例代码
4. **代码精读** - 选择核心模块进行深入分析
5. **做笔记** - 在各自仓库中创建学习笔记分支
6. **实践练习** - 尝试修改和扩展功能

## 📓 学习笔记 / Study Notes

为每个子模块创建专门的学习笔记分支：

```bash
# 示例：为 deer-flow 创建学习笔记分支
cd deer-flow
git checkout -b notes/architecture-analysis
git checkout -b notes/core-modules-study
git checkout -b notes/best-practices
```

## 🔧 配置说明 / Configuration

### Git 子模块配置

本项目使用 Git 子模块来管理多个开源项目：

- **父仓库**: `learn-open-source` - 作为总的学习中心
- **子模块**: 各个开源项目保持独立的 git 历史
- **优势**: 
  - 每个项目可以独立更新
  - 保持原始的提交历史
  - 可以轻松切换到不同版本

### 添加新的学习项目 / Add New Learning Project

```bash
# 将新的开源项目添加为子模块
git submodule add <repository-url> <path>

# 示例
git submodule add https://github.com/example/project.git projects/example-project
```

## 🤝 贡献 / Contributing

本项目主要用于个人学习研究。如需分享学习心得：

1. 在对应子模块中创建笔记分支
2. 记录详细的分析过程和结论
3. 标注重点代码和关键设计
4. 总结可借鉴的设计模式

## 📅 学习计划 / Learning Schedule

| 时间段 | 学习项目 | 目标 | 状态 |
|--------|----------|------|------|
| 第 1-2 周 | Deer Flow | 理解核心架构 | 📝 计划中 |
| 第 3-4 周 | Hello Halo | 掌握关键技术 | 📝 计划中 |
| 第 5-6 周 | Learn Claude Code | AI 集成学习 | 📝 计划中 |
| 第 7-8 周 | NanoBot | 机器人框架 | 📝 计划中 |
| 第 9-10 周 | Claude Code | AI 编程最佳实践 | 📝 计划中 |

## 📞 联系方式 / Contact

- **Repository**: learn-open-source
- **用途**: 个人学习与研究

---

**Happy Coding! 🚀**

开始你的开源代码探索之旅吧！
