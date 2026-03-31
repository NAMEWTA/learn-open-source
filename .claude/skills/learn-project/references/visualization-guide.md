# 可视化图表指南

在学习笔记中使用图表来辅助理解项目架构和流程。

## Mermaid 图表

### 架构图（用于模块关系）

```mermaid
graph TB
    A[前端 UI] --> B[API 网关]
    B --> C[业务服务]
    B --> D[认证服务]
    C --> E[(数据库)]
    C --> F[消息队列]
```

### 时序图（用于请求链路）

```mermaid
sequenceDiagram
    participant U as 用户
    participant F as 前端
    participant A as API
    participant D as 数据库
    U->>F: 发起操作
    F->>A: HTTP 请求
    A->>D: 查询数据
    D-->>A: 返回结果
    A-->>F: JSON 响应
    F-->>U: 渲染页面
```

### 流程图（用于启动流程/业务逻辑）

```mermaid
flowchart TD
    A[入口文件] --> B{检查配置}
    B -->|有效| C[初始化服务]
    B -->|无效| D[加载默认配置]
    D --> C
    C --> E[注册路由]
    E --> F[启动监听]
```

### 类图（用于核心抽象）

```mermaid
classDiagram
    class BaseAgent {
        +name: str
        +run(input): Output
        #process(data): Result
    }
    class SpecificAgent {
        +tools: List
        +run(input): Output
    }
    BaseAgent <|-- SpecificAgent
```

### 状态图（用于状态管理）

```mermaid
stateDiagram-v2
    [*] --> 初始化
    初始化 --> 就绪
    就绪 --> 运行中: 收到请求
    运行中 --> 就绪: 处理完成
    运行中 --> 错误: 异常
    错误 --> 就绪: 重试
```

## ASCII 图表

### 目录树（用于项目结构）

```
project/
├── src/
│   ├── core/           # 核心逻辑
│   │   ├── engine.py
│   │   └── config.py
│   ├── api/            # API 层
│   │   ├── routes.py
│   │   └── middleware.py
│   └── models/         # 数据模型
│       └── schema.py
├── tests/
└── package.json
```

### 数据流（用于管道/流水线）

```
输入 ──→ [解析器] ──→ [验证器] ──→ [处理器] ──→ [格式化] ──→ 输出
              │            │            │
              ▼            ▼            ▼
           日志记录     错误处理     缓存层
```

### 层级关系（用于分层架构）

```
┌─────────────────────────────────┐
│         表现层 (UI/CLI)          │
├─────────────────────────────────┤
│         业务逻辑层               │
├─────────────────────────────────┤
│         数据访问层               │
├─────────────────────────────────┤
│         基础设施层               │
└─────────────────────────────────┘
```

## 选择原则

| 场景 | 推荐图表 |
|------|---------|
| 模块依赖关系 | Mermaid graph TB/LR |
| 请求处理链路 | Mermaid sequenceDiagram |
| 启动/业务流程 | Mermaid flowchart |
| 类继承/接口 | Mermaid classDiagram |
| 状态流转 | Mermaid stateDiagram |
| 项目目录结构 | ASCII 目录树 |
| 数据管道 | ASCII 数据流 |
| 分层架构 | ASCII 层级图 |
