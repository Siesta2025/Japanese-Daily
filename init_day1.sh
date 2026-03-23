#!/bin/bash
# 一键初始化脚本 - 重置学习进度到第 1 天
# 用途：让新用户从第 1 天开始学习，不影响原项目的进度

set -e

echo "=================================="
echo "📚 日语学习系统 - 初始化脚本"
echo "=================================="
echo ""
echo "⚠️  注意：此脚本将重置学习进度到第 1 天"
echo "⚠️  请确保你已经 Fork 了项目到自己的账号"
echo ""
read -p "确认继续？(y/N) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ 已取消"
    exit 1
fi

echo ""
echo "📝 正在重置学习进度..."

# 重置 current_day.txt 为 1
echo "1" > current_day.txt

# 提交更改
if git diff --quiet && git diff --cached --quiet; then
    # 有更改
    git add current_day.txt
    git commit -m "init: 重置学习进度为第 1 天

- 这是我的日语学习之旅的开始！
- 从 2025 年开始，90 天后达到 N5 水平
- がんばって！💪"
    echo "✅ 学习进度已重置为第 1 天"
    echo ""
    echo "📤 下一步：推送更改到你的仓库"
    echo "   运行: git push"
else
    echo "✅ 学习进度已经是第 1 天了"
fi

echo ""
echo "=================================="
echo "🎉 初始化完成！"
echo "=================================="
echo ""
echo "📋 接下来的步骤："
echo "   1. 运行 'git push' 推送到远程仓库"
echo "   2. 在 GitHub 上启用 Actions"
echo "   3. 手动运行一次测试"
echo "   4. 查看飞书群组是否收到推送"
echo ""
echo "📖 详细教程请查看: FRIEND_SETUP_GUIDE.md"
echo ""
