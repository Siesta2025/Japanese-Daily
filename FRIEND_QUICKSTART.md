# 给朋友的快速卡片

## 🚀 5 分钟快速开始

如果你已经有了 GitHub 账号，按照以下步骤快速设置：

### 1️⃣ Fork 项目
访问：https://github.com/Siesta2025/Japanese-Daily
点击右上角 **Fork** 按钮

### 2️⃣ 获取 DeepSeek API Key
访问：https://platform.deepseek.com
注册 → 实名认证 → 创建 API Key（保存它！）

### 3️⃣ 配置 GitHub Secrets
进入你的仓库 → **Settings** → **Secrets and variables** → **Actions**

添加 5 个 Secrets：
| Name | Value |
|------|-------|
| `LLM_API_BASE` | `https://api.deepseek.com` |
| `LLM_API_KEY` | 你的 DeepSeek API Key (`sk-xxxxx`) |
| `LLM_MODEL` | `deepseek-chat` |
| `FEISHU_WEBHOOK_URL` | 你的飞书群组 Webhook URL |
| `PAT_TOKEN` | 你的 GitHub Personal Access Token (`ghp_xxxxx`) |

### 4️⃣ 重置到第 1 天
编辑 `current_day.txt` 文件，改为 `1`，提交更改

### 5️⃣ 测试运行
进入仓库 → **Actions** → **日语学习每日推送** → **Run workflow**

### 6️⃣ 检查飞书群组
应该能收到推送了！

✅ **完成！** 明天早上 8:00 开始自动推送

---

## ❓ 遇到问题？

查看详细教程：[FRIEND_SETUP_GUIDE.md](FRIEND_SETUP_GUIDE.md)

或联系原项目作者
