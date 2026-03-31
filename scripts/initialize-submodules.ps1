#!/bin/bash

# learn-open-source Git 子模块初始化脚本
# 此脚本用于将现有的独立仓库转换为 Git 子模块结构

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "learn-open-source Git 子模块初始化" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$ErrorActionPreference = "Stop"

# 切换到工作目录
Set-Location "d:\Data\01-Code\learn-open-source"

Write-Host "步骤 1: 检查 .gitmodules 文件..." -ForegroundColor Yellow
if (Test-Path ".gitmodules") {
    Write-Host "✓ .gitmodules 文件已存在" -ForegroundColor Green
} else {
    Write-Host "✗ .gitmodules 文件不存在，需要先创建" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "步骤 2: 添加所有文件到 Git 暂存区..." -ForegroundColor Yellow
git add .gitmodules
git add README.md
git add GIT_SUBMODULE_GUIDE.md
git add QUICK_START.md
git add ARCHITECTURE.md
git add .learning-config.json
git add .gitignore
Write-Host "✓ 配置文件已添加到暂存区" -ForegroundColor Green

Write-Host ""
Write-Host "步骤 3: 处理子模块目录..." -ForegroundColor Yellow

$submodules = @("deer-flow", "hello-halo", "learn-claude-code", "nanobot")

foreach ($submodule in $submodules) {
    Write-Host ""
    Write-Host "处理子模块：$submodule" -ForegroundColor Cyan
    
    # 检查目录是否存在
    if (-not (Test-Path $submodule)) {
        Write-Host "  ✗ 目录不存在，跳过" -ForegroundColor Red
        continue
    }
    
    # 检查是否已经是 git 仓库
    if (Test-Path "$submodule/.git") {
        Write-Host "  ✓ 检测到独立的 Git 仓库" -ForegroundColor Green
        
        # 进入子模块查看信息
        Set-Location $submodule
        $branch = git branch --show-current
        $commit = git rev-parse --short HEAD
        Set-Location ..
        
        Write-Host "  ℹ 当前分支：$branch, 提交：$commit" -ForegroundColor Blue
        
        # 添加到暂存区（这会将子模块注册为 Git 子模块）
        git add $submodule
        Write-Host "  ✓ 已添加到 Git 子模块" -ForegroundColor Green
    } else {
        Write-Host "  ⚠ 不是 Git 仓库，需要特殊处理" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "步骤 4: 检查 Git 状态..." -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "步骤 5: 准备提交..." -ForegroundColor Yellow
Write-Host "以下操作将提交所有更改到 Git：" -ForegroundColor Yellow
Write-Host ""

$confirm = Read-Host "是否继续提交？(y/n)"
if ($confirm -ne "y") {
    Write-Host "操作已取消" -ForegroundColor Red
    exit 0
}

Write-Host ""
git commit -m "feat: 初始化 Git 子模块学习平台

- 添加 .gitmodules 配置文件
- 注册 4 个子模块：deer-flow, hello-halo, learn-claude-code, nanobot
- 添加完整的文档体系（README, 使用指南，快速开始，架构文档）
- 添加学习配置文件和 .gitignore
- 建立父子仓库关系

这是学习平台的初始版本，为后续的代码学习奠定基础。"

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ 初始化成功完成！" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "下一步操作：" -ForegroundColor Cyan
    Write-Host "1. 查看提交历史：git log --oneline" -ForegroundColor White
    Write-Host "2. 查看子模块状态：git submodule status" -ForegroundColor White
    Write-Host "3. 阅读快速开始指南：code QUICK_START.md" -ForegroundColor White
    Write-Host "4. 开始第一个学习项目！" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "✗ 提交失败，请检查错误信息" -ForegroundColor Red
}

Set-Location ..
