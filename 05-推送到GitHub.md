# 推送到 GitHub（想做的时候照着做）

> **先明确：不做这一步完全不影响你学 C。** 本地 commit 已经能救你的命（后悔药已经在手上了）。
> 推 GitHub 的额外好处只有一个：**多一份云端备份 + 主页上开始长绿格子**。

## 第 0 步：先把分支名改掉（一条命令，趁早做）

GitHub 现在默认用 `main` 当主分支，而 git 本机默认叫 `master`。统一一下，免得以后别扭：

```bash
cd C:\Users\11216\Desktop\C-Lab
git branch -M main
```

（`-M` 是"改名"，对已有的提交没有任何影响，放心。）

## 第 1 步：在网页上建一个空仓库

1. 打开 https://github.com/new
2. **Repository name** 填：`c-lab`
3. 选 **Public**（公开，这样绿格子才算数；不想公开就选 Private，也一样能用）
4. **下面这三个勾全都不许勾**：
   - ❌ Add a README file
   - ❌ Add .gitignore
   - ❌ Choose a license
5. 点 **Create repository**

> **为什么一个都不能勾？** 你本地已经有 README 和 .gitignore 了。
> 如果网页那边也造一份，两边内容对不上，push 会被拒绝（报 `rejected`）。
> 建一个干干净净的空仓库，是最省事的路。

## 第 2 步：把本地仓库连到 GitHub

建完仓库后，网页会显示一段命令。你只需要敲这两条：

```bash
git remote add origin https://github.com/Meltrui/c-lab.git
git push -u origin main
```

第一条是"登记一下云端地址"，只需做一次。
第二条才是真正的"上传"。

## 第 3 步：弹出的登录窗口

第一次 push 时，**会自动弹出一个窗口让你登录 GitHub**（这是 Git for Windows 自带的凭据管理器）。

- 选 **Sign in with your browser**（用浏览器登录）
- 浏览器里点 Authorize 授权
- 回到命令行，它自己就把代码推上去了

**不需要**手动去造什么 token，跟着弹窗走就行。以后再也不用了，它会记住。

## 第 4 步：验证

刷新你的 GitHub 仓库页面，应该能看到 README.md、PROGRESS.md、`projects/STU-Tools/v0_1.c` 这些文件。

然后回到网页个人主页，**今天的格子里会多一个绿点** —— 那是你第一天。

---

## 之后每天的日常（三条命令）

```bash
git add -A
git commit -m "v0.2a: 数组录入与打印"
git push
```

`git push` 之后可以不带参数了，因为第 2 步的 `-u` 已经记住了对应关系。

## 报错速查

| 报错关键词 | 什么意思 | 怎么办 |
|---|---|---|
| `rejected ... fetch first` | 云端有你本地没有的东西（多半是建仓库时勾了 README） | 把这个报错贴给小W |
| `remote origin already exists` | 已经登记过地址了 | 改用 `git remote set-url origin 地址` |
| `Authentication failed` | 登录失效 | 删掉 Windows「凭据管理器」里的 GitHub 条目，再 push 一次会重新弹窗 |
| `src refspec main does not match any` | 分支名不对（可能还叫 master） | 回到第 0 步执行改名 |
| `fatal: not a git repository` | 当前不在 C-Lab 目录里 | 先 `cd C:\Users\11216\Desktop\C-Lab` |

---

## 你之前那两个仓库是什么

你在 GitHub 上有 `Meltrui/git` 和 `Meltrui/git1`，还有 `skills-introduction-to-github` ——
后一个是 GitHub 官方的入门练习课程。

**它们不是问题，留着就行。** 那是"跟着教程点鼠标"的产物，没有你的思考在里面。
`c-lab` 不一样：**这里的每一行代码都是你自己写、自己调试、自己 commit 的。**
半年后回头看，你会清楚地区分这两类仓库的价值。
