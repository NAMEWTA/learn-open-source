# 第十二章：前端架构

## 学习目标

理解 DeerFlow 前端的整体架构：Next.js App Router 的使用方式、页面路由设计、布局体系、环境配置。读完本章后，你应该能在脑中建立前端代码的导航地图。

## 12.1 技术栈回顾

```
Next.js 16 (App Router + Turbopack)
├── React 19
├── TypeScript 5.8
├── Tailwind CSS 4
├── Shadcn UI + Radix UI（组件库）
├── TanStack Query（服务端状态管理）
├── @langchain/langgraph-sdk（后端通信）
├── Vercel AI SDK（AI 元素组件）
└── pnpm 10.26.2（包管理）
```

## 12.2 页面路由结构

```
src/app/
├── layout.tsx              # 根布局（主题、国际化、全局样式）
├── page.tsx                # / → 落地页（项目介绍）
│
├── workspace/
│   ├── layout.tsx          # 工作区布局（侧边栏、TanStack Query、命令面板）
│   ├── page.tsx            # /workspace → 重定向到 /workspace/chats/new
│   │
│   ├── chats/
│   │   ├── page.tsx        # /workspace/chats → 聊天列表（搜索、排序）
│   │   └── [thread_id]/
│   │       ├── layout.tsx  # 聊天布局（Subtasks/Artifacts/PromptInput Provider）
│   │       └── page.tsx    # /workspace/chats/{id} → 聊天页面（核心交互）
│   │
│   └── agents/
│       └── page.tsx        # /workspace/agents → 智能体管理页
│
├── api/
│   ├── auth/[...all]/      # 认证 API 路由（better-auth）
│   └── memory/[...path]/   # 记忆 API 代理
│
└── mock/api/               # 开发模拟数据
    ├── threads/
    ├── models/
    └── skills/
```

## 12.3 布局层次

DeerFlow 的布局采用嵌套结构，每层负责不同的职责：

```
RootLayout (layout.tsx)
│  → 主题提供者、国际化、全局字体、KaTeX CSS
│
└── WorkspaceLayout (workspace/layout.tsx)
    │  → TanStack QueryClientProvider
    │  → SidebarProvider（侧边栏状态）
    │  → CommandPalette（Cmd+K 命令面板）
    │  → Toaster（通知）
    │
    └── ChatLayout (chats/[thread_id]/layout.tsx)
        │  → SubtasksProvider（子任务上下文）
        │  → ArtifactsProvider（工件上下文）
        │  → PromptInputProvider（输入框上下文）
        │
        └── ChatPage (chats/[thread_id]/page.tsx)
            → ThreadTitle + MessageList + InputBox + TodoList
```

## 12.4 环境配置

> 文件：`deer-flow/frontend/src/env.js`

使用 `@t3-oss/env-nextjs` + Zod 进行类型安全的环境变量校验：

```javascript
export const env = createEnv({
  server: {
    BETTER_AUTH_SECRET: z.string().optional(),
    NODE_ENV: z.enum(["development", "test", "production"]),
  },
  client: {
    NEXT_PUBLIC_BACKEND_BASE_URL: z.string().url().optional(),
    NEXT_PUBLIC_LANGGRAPH_BASE_URL: z.string().url().optional(),
    NEXT_PUBLIC_STATIC_WEBSITE_ONLY: z.string().optional(),
  },
});
```

> 文件：`deer-flow/frontend/next.config.js`

Next.js 配置了 URL 重写，将 API 请求代理到后端：

```javascript
// /lgs/* → LangGraph Server (localhost:2024)
// /api/* → Gateway API (localhost:8001)
```

这样前端开发时不需要配置 CORS，所有请求都通过 Next.js 服务器代理。

## 12.5 源码目录结构

```
src/
├── app/          # 页面和路由（App Router）
├── components/   # React 组件
│   ├── ui/       # Shadcn UI 基础组件（自动生成，不手动编辑）
│   ├── ai-elements/  # Vercel AI SDK 元素（自动生成）
│   ├── workspace/    # 工作区业务组件
│   └── landing/      # 落地页组件
├── core/         # 业务逻辑核心（最重要）
│   ├── api/      # LangGraph SDK 客户端
│   ├── threads/  # 线程管理（Hooks + 类型）
│   ├── messages/ # 消息处理和分组
│   ├── artifacts/# 工件加载和缓存
│   ├── settings/ # 用户偏好（localStorage）
│   ├── i18n/     # 国际化（en-US, zh-CN）
│   ├── skills/   # 技能管理
│   ├── memory/   # 记忆系统
│   ├── todos/    # 待办事项
│   ├── uploads/  # 文件上传
│   ├── mcp/      # MCP 集成
│   └── models/   # 模型管理
├── hooks/        # 共享 React Hooks
├── lib/          # 工具函数（cn() 等）
├── styles/       # 全局样式（Tailwind CSS 变量）
└── server/       # 服务端代码（better-auth）
```

## 检查点

1. DeerFlow 前端有哪些页面路由？核心交互页面是哪个？
2. 布局的嵌套层次是什么？每层提供了什么 Provider？
3. `components/ui/` 和 `components/ai-elements/` 为什么不应该手动编辑？
4. Next.js 的 URL 重写解决了什么问题？
5. `core/` 目录和 `components/` 目录的职责区别是什么？