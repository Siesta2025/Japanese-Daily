# 📚 日语学习每日推送系统 - 完整设置教程

> **本教程专为零基础用户设计**，从零开始手把手教你搭建属于自己的日语学习推送系统。
> 每天早上 8:00 自动推送日语学习内容到飞书群组，学习完 90 天即可达到 N5 水平！

---

## 🎯 你将学到

✅ 如何注册 GitHub 账号
✅ 如何 Fork 项目到自己的仓库
✅ 如何获取 LLM API Key
✅ 如何获取飞书群组 Webhook
✅ 如何配置 GitHub Actions Secrets
✅ 如何设置 Personal Access Token
✅ 如何测试运行

**预计耗时：20-30 分钟**

---

## 📋 准备工作

在开始之前，你需要准备：
- 📱 一个手机号（用于注册账号）
- 💻 一台电脑（Windows/Mac/Linux 都可以）
- 🌐 一个浏览器（Chrome/Edge 推荐）

**不需要任何编程基础！** 不需要安装任何软件！

---

## 第一步：注册 GitHub 账号（5分钟）

### 1.1 访问 GitHub

打开浏览器，访问：https://github.com

### 1.2 点击注册

点击右上角的 **Sign up** 按钮

### 1.3 填写信息

1. **邮箱地址**：填写你的常用邮箱
2. **密码**：设置一个强密码（至少15位，建议使用密码管理器）
3. **用户名**：你的唯一标识，比如 `japanese-learning-2024`
   > 💡 用户名一旦设置无法修改，请仔细选择

### 1.4 验证邮箱

GitHub 会发送一封验证邮件到你的邮箱，点击邮件中的链接完成验证。

✅ **完成后**：你已经拥有了自己的 GitHub 账号！

---

## 第二步：Fork 项目到你的仓库（2分钟）

### 2.1 访问原项目

打开浏览器，访问：
```
https://github.com/Siesta2025/Japanese-Daily
```

### 2.2 点击 Fork 按钮

在页面右上角，找到 **Fork** 按钮，点击它。

> 💡 **什么是 Fork？**
> Fork 就像是"复制"一份项目到你自己的账号下。你可以随意修改，不会影响原项目。

### 2.3 确认 Fork 信息

弹出窗口中：
- **Owner**：应该显示你的用户名
- **Repository name**：保持默认 `Japanese-Daily`
- 点击底部的 **Create fork** 按钮

✅ **完成后**：项目已经复制到你的账号下了！

页面地址应该变成：
```
https://github.com/你的用户名/Japanese-Daily
```

---

## 第三步：获取 DeepSeek API Key（5分钟）

> 💡 **为什么需要 API Key？**
> 系统需要调用 AI 来生成每日的日语学习内容。DeepSeek 是目前性价比最高的选择，90天大约需要 5-10 元人民币。

### 3.1 注册 DeepSeek 账号

访问：https://platform.deepseek.com

点击右上角 **API 开发者 → 登录/注册**

使用手机号注册（支持 +86）

### 3.2 实名认证

首次使用需要实名认证：
- 准备身份证照片
- 按照提示完成认证
- 通常 5-10 分钟内审核通过

### 3.3 创建 API Key

1. 登录后，点击左侧菜单的 **API Keys**
2. 点击 **创建 API Key** 按钮
3. 填写名称：`Japanese-Daily-Push`
4. 点击 **提交**
5. **⚠️ 重要**：复制显示的 API Key（格式：`sk-xxxxxxxxxx`）
   > 这个 Key 只显示一次，请立即保存到记事本！

✅ **完成后**：你应该有一个类似这样的 Key：
```
sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
> ⚠️ **安全提示**：这只是一个示例格式，你复制的是你自己真实的 Key。

### 3.4 充值（可选但推荐）

1. 点击左侧菜单的 **充值中心**
2. 选择金额（建议先充 10 元测试）
3. 选择支付方式（支持微信/支付宝）
4. 完成支付

> 💡 **费用说明**：每天生成一次内容，大约需要 0.1-0.2 元，90 天总共约 10-20 元。

---

## 第四步：配置 GitHub Secrets（5分钟）

### 4.1 打开你的仓库设置

在你 Fork 的仓库页面中：
1. 点击顶部的 **Settings** 标签
2. 在左侧菜单中，找到 **Secrets and variables**
3. 点击 **Actions**

### 4.2 添加 LLM API 配置

点击 **New repository secret** 按钮，依次添加以下 4 个 Secrets：

#### Secret 1: LLM_API_BASE
- **Name**: `LLM_API_BASE`
- **Secret**: `https://api.deepseek.com`
- 点击 **Add secret**

#### Secret 2: LLM_API_KEY
- **Name**: `LLM_API_KEY`
- **Secret**: 粘贴你在第三步获取的 API Key（`sk-xxxxx`）
- 点击 **Add secret**

#### Secret 3: LLM_MODEL
- **Name**: `LLM_MODEL`
- **Secret**: `deepseek-chat`
- 点击 **Add secret**

> ⚠️ **注意**：下面还有第五步（飞书 Webhook），完成第五步后再回来添加第四个 Secret！

### 4.3 验证 Secrets

添加完成后，你应该看到 4 个 Secrets（添加完飞书 Webhook 后）：
- ✅ LLM_API_BASE
- ✅ LLM_API_KEY
- ✅ LLM_MODEL
- ✅ FEISHU_WEBHOOK_URL

---

## 第五步：获取飞书群组 Webhook（3分钟）

### 5.1 创建飞书群组

1. 打开飞书 App
2. 创建一个新群组（或使用现有群组）
3. 邀请你自己加入即可

### 5.2 添加机器人

1. 进入群组设置
2. 点击 **群机器人**
3. 点击 **添加机器人**
4. 选择 **自定义机器人**
5. 机器人名称：`日语学习助手`
6. 点击 **添加**

### 5.3 获取 Webhook URL

1. 添加成功后，点击机器人头像
2. 找到 **Webhook URL**
3. 点击 **复制**
4. 保存到记事本（格式：`https://open.feishu.cn/open-apis/bot/v2/hook/xxxxx`）

### 5.4 返回 GitHub Secrets

回到第四步的 **4.2**，添加第四个 Secret：

#### Secret 4: FEISHU_WEBHOOK_URL
- **Name**: `FEISHU_WEBHOOK_URL`
- **Secret**: 粘贴刚才复制的飞书 Webhook URL
- 点击 **Add secret**

✅ **完成后**：所有 4 个 Secrets 都已配置完成！

---

## 第六步：创建 Personal Access Token（3分钟）

> 💡 **为什么需要 PAT？**
> GitHub Actions 需要权限来自动更新学习进度（天数+1）。默认的 Token 没有写权限。

### 6.1 打开 Token 设置页面

1. 点击 GitHub 右上角的头像
2. 点击 **Settings**
3. 在左侧菜单最下方，找到 **Developer settings**
4. 点击 **Personal access tokens** → **Tokens (classic)**

### 6.2 生成新 Token

1. 点击 **Generate new token (classic)**
2. **Note**: 填写 `Japanese-Daily-Push`
3. **Expiration**: 选择 `No expiration`（永不过期）
4. **Scopes**: 勾选 **repo**（会自动勾选下面的所有选项）
5. 滚动到最底部，点击 **Generate token**

### 6.3 复制 Token

**⚠️ 重要**：立即复制生成的 Token（格式：`ghp_xxxxxxxxxxx`）

> 这个 Token 只显示一次！请保存到记事本。

### 6.4 添加到 Secrets

回到第四步的 Secrets 页面，添加第五个 Secret：

#### Secret 5: PAT_TOKEN
- **Name**: `PAT_TOKEN`
- **Secret**: 粘贴刚才复制的 Personal Access Token（`ghp_xxxxx`）
- 点击 **Add secret**

✅ **完成后**：你应该有 5 个 Secrets 了！

---

## 第七步：重置学习进度（2分钟）

> 💡 **为什么要重置？**
> 原项目的进度可能已经到第 X 天了，你需要从第 1 天开始学习。

### 7.1 打开 current_day.txt 文件

在你的仓库页面：
1. 点击 **Code** 标签
2. 找到 `current_day.txt` 文件
3. 点击文件名打开它

### 7.2 编辑文件

1. 点击文件右上角的 **铅笔图标**（Edit this file）
2. 将内容改为 `1`
3. 在底部的提交信息框中，填写：`init: 重置学习进度为第 1 天`
4. 点击 **Commit changes** 按钮

✅ **完成后**：你的学习进度已重置为第 1 天！

---

## 第八步：手动测试运行（2分钟）

在正式启用自动推送前，先手动测试一次。

### 8.1 打开 Actions 页面

在你的仓库页面：
1. 点击顶部的 **Actions** 标签
2. 如果提示 "Workflows aren't enabled"，点击 **I understand my workflows, go ahead and enable them**

### 8.2 手动触发运行

1. 在左侧菜单中，点击 **日语学习每日推送**
2. 点击右侧的 **Run workflow** 按钮
3. 点击绿色的 **Run workflow** 按钮

### 8.3 查看运行结果

1. 等待 1-2 分钟
2. 点击运行记录查看详情
3. 如果所有步骤都显示 ✅ 绿色对勾，说明配置成功！

### 8.4 检查飞书群组

打开你的飞书群组，应该能看到推送的日语学习内容了！

✅ **如果看到推送内容**：恭喜，配置成功！

❌ **如果失败（403错误）**：
1. 检查 **第六步**的 PAT_TOKEN 是否正确配置
2. 确认 PAT_TOKEN 有 `repo` 权限
3. 查看 Actions 运行日志中的详细错误信息

---

## 第九步：启用定时推送（1分钟）

现在系统已经测试成功了，启用每天自动推送。

### 9.1 确认定时任务已启用

在你的仓库页面：
1. 点击 **Actions** 标签
2. 点击左侧的 **日语学习每日推送**
3. 查看右侧的 **Runs** 列表

系统默认配置为每天 **UTC 0:00**（北京时间 **早上 8:00**）自动运行。

### 9.2 推送时间说明

- **UTC 时间**: 每天 00:00
- **北京时间**: 每天 08:00
- **你可以修改**：编辑 `.github/workflows/daily_push.yml` 文件，找到 `cron: '0 0 * * *'` 这一行

常见时间设置：
```
cron: '0 0 * * *'    # 北京时间 08:00
cron: '0 1 * * *'    # 北京时间 09:00
cron: '0 23 * * *'   # 北京时间 07:00
```

> 💡 **cron 表达式格式**：`分 时 日 月 周`
> - 北京时间 = UTC 时间 + 8 小时

✅ **完成后**：系统将在每天早上 8:00 自动推送日语学习内容！

---

## 🎉 恭喜完成！

你现在拥有了一个完全自动化的日语学习系统！

### 📱 每天使用流程

1. **早上 8:00**：飞书群组自动收到推送
2. **学习内容**：包括五十音复习、词汇、语法、练习
3. **第二天**：自动推送下一天的内容
4. **90 天后**：完成 N5 水平学习！

### 📊 追踪学习进度

1. 访问你的 GitHub 仓库
2. 打开 `current_day.txt` 文件
3. 查看当前的数字（比如 `15` 表示第 15 天）

### 🔄 暂停/恢复推送

**暂停推送**：
1. 进入仓库的 **Actions** 设置
2. 点击 **Disable workflow**

**恢复推送**：
1. 点击 **Enable workflow**

### 🛠️ 常见问题

<details>
<summary><b>Q1: 推送失败了怎么办？</b></summary>

1. 查看 Actions 运行日志
2. 常见原因：
   - API 余额不足 → 去DeepSeek充值
   - Secrets 配置错误 → 重新检查配置
   - 网络超时 → 等待第二天自动重试
</details>

<details>
<summary><b>Q2: 想从第 N 天开始学习怎么办？</b></summary>

1. 打开 `current_day.txt` 文件
2. 修改数字为 `N`
3. 提交更改
</details>

<details>
<summary><b>Q3: 如何修改推送内容？</b></summary>

1. 编辑 `syllabus.json` 文件（学习大纲）
2. 编辑 `.github/workflows/daily_push.yml` 中的 `SYSTEM_PROMPT`（AI提示词）
3. 提交更改
</details>

<details>
<summary><b>Q4: 推送到多个群组怎么办？</b></summary>

目前只支持单群组推送。如需多群组，需要修改代码。可以联系原项目作者定制。
</details>

<details>
<summary><b>Q5: 费用大概是多少？</b></summary>

DeepSeek API 按实际使用量计费：
- 每次生成约 1000-2000 tokens
- 单价：¥0.001/千tokens
- 每天约 ¥0.1-0.2
- 90 天约 ¥10-20 元

也可以使用其他兼容 OpenAI 的 API（如 GPT-4o-mini），只需修改 `LLM_API_BASE` 和 `LLM_API_KEY`。
</details>

---

## 📞 获取帮助

遇到问题？可以：
1. 查看 GitHub Issues：https://github.com/Siesta2025/Japanese-Daily/issues
2. 联系原项目作者
3. 在 Discussions 中提问

---

## 🎓 学习资源推荐

配合这个推送系统，推荐：
- **APP**: 多邻国、MOJiTest
- **教材**: 《标准日本语 初级》
- **动漫**: 尝试看生肉（无字幕）动漫
- **JLPT**: 了解 N5 考试真题

---

**祝你学习愉快！がんばって！💪**
