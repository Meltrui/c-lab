# Git 从零上手（第一次 commit 版）

## 一句话：git 是什么

它是**代码的后悔药 + 成长日记**。

- **后悔药**：今天写崩了，能一键退回昨天还能跑的版本（你做 v0.5 文件读写时会天天感谢它）
- **成长日记**：每一天做了什么、改了哪几行，永久留痕。一年后你的 GitHub 主页上会长出一片绿格子 ——
  那片绿格子，就是你学习这件事唯一的、别人造不了假的证据

## 三条命令走天下（你 90% 的时间只用这些）

```bash
git add -A                      # 把所有改动放进"待提交"区
git commit -m "说明今天改了啥"    # 存档。这一刻的状态被永久保存
git status                      # 看看现在是什么情况（随时可以敲，无害）
```

每天写完代码，跑完能用了，就敲前两条。**存一次的粒度 = 一次成功的改动**，别攒一周。

## 第一次：先告诉 git 你是谁（只做一次）

打开 PowerShell，一次一行照抄：

```bash
git config --global user.name "你的名字或昵称"
git config --global user.email "你的邮箱"
```

邮箱建议填**你 GitHub 账号那个邮箱**（以后推到 GitHub 才能关联上贡献记录）。

## 现在轮到你：完成你的第一次 commit

我已经帮你把仓库建好了、该忽略的垃圾也排除了，源码已经放进"待提交"区。
**最后这最有仪式感的一步留给你自己敲：**

```bash
cd C:\Users\11216\Desktop\C-Lab
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
git commit -m "v0.1: 菜单循环，输入0退出"
git log --oneline
```

如果最后那条 `git log --oneline` 能打印出一行带编号的记录，**你的第一个版本就此诞生**。
任何一步报错，**别自己硬扛，把报错原样贴给我**。

## 排错速查

| 报错 | 意思 | 怎么解 |
|---|---|---|
| `Please tell me who you are` | 还没设置名字邮箱 | 执行上面两条 config |
| `nothing to commit` | 没有新改动要存 | 正常的，可能你已经存过了 |
| `'git' 不是内部或外部命令` | PowerShell 找不到 git | 告诉我，我来看 PATH |
| CRLF / LF warning | Windows 换行符提示 | **不用管**，不是错误 |
| `无法将"#"项识别为 cmdlet` | 脚本开头的 BOM 重复，第一行注释失效 | 已于 2026-10-10 修好。**这是小W的锅**，不是你的操作问题 |
| 中文文件名显示成 `\346\211\271...` | git 默认转义中文名 | 已设 `core.quotepath false`，重开 PowerShell 就正常 |

## 关于 `.gitignore`（重要）

我已经给 C-Lab 写好了 `.gitignore`，它告诉 git：**这些文件别管**。
里面排除了 VS 生成的 Debug/Release/临时数据库等。**原因是这样的：**

你桌面那个 V0.1 文件夹里，`Browse.VC.db` 一个文件就 **2MB**，
而你自己写的 `源.cpp` 才 **675 字节**。
如果把编译垃圾也存进仓库，你的代码仓库会比代码本身大几千倍，
而且 clone 下来全是删不掉的缓存垃圾。

**原则上：只提交源码（.c/.h/.md），不提交任何编译器生成的东西。**
这条规则等你第一次用 GitHub 时会庆幸自己遵守了。

## 你敲过的那四条命令，逐条翻译（2026-10-10 已执行成功）

```bash
git branch -M main
```
**把当前分支改名叫 main。** 原来叫 master，GitHub 现在默认叫 main，统一一下。
`-M` 是"强制改名"。这跟文件内容无关，只是给这条时间线换了个名字，一次就够。

```bash
git remote add origin https://github.com/Meltrui/c-lab.git
```
**登记一个云端的地址，并给它起个小名叫 origin。**
以后你想说"推到 GitHub"，只要说"推到 origin"就行，不用每次都抄那一长串网址。
`add` 一次就够，以后不用再敲。

```bash
git push -u origin main
```
**真正上传。**把本地 main 分支的内容送到 origin（也就是 GitHub）。
`-u` 是"顺便记住对应关系"——以后直接敲 `git push` 就行，不用再写 `-u origin main`。

### push 成功时长这样（逐行翻译）

```
Enumerating objects: 12, done.        清点：有 12 个东西要送
Counting objects: 100% (12/12)        数完了
Delta compression using up to 22 threads   压缩中（省流量）
Writing objects: 100% (12/12), 17.09 KiB   正在写入，一共 17 KB
Total 12 (delta 0), reused 0 (delta 0)     全部送达
To https://github.com/Meltrui/c-lab.git     送到哪儿
 * [new branch]      main -> main           在云端新建了一条叫 main 的分支 ★成功标志
   branch 'main' set up to track 'origin/main'.   以后本地 main 会自动跟随云端 main
```

**认准这两行就是成功**：`[new branch]` 和 `set up to track`。
只要没有红色的 `error` / `rejected`，后面那一大坨英文都是进度播报，不用逐字读。

## 之后每天的用法（三条）

```bash
cd C:\Users\11216\Desktop\C-Lab
git add -A
git commit -m "今天改了什么"
git push
```

嫌麻烦就用我写的脚本，一步到位：

```powershell
.\push.ps1 "v0.2a: 数组录入与打印"
```

（第一次用脚本要先敲一次 `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`，
PowerShell 默认禁止运行脚本，这是安全策略，敲一次永久生效，不需要管理员。）

## 追问：为什么 8 个文件，git 却说 12 个 objects？

因为你交上去的不只是"文件"，git 的仓库里存的是**三类对象**，它把它们全数了一遍：

| 类型 | 是什么 | 这次有几个 |
|---|---|---|
| **blob** | 一个文件的**内容**（不管叫什么名字） | 8 个（8 个文件） |
| **tree** | 一个**目录**的清单（里面有哪些文件/子目录） | 3 个（根目录 / `projects` / `projects/STU-Tools`） |
| **commit** | 一次**存档记录**（指向根 tree + 作者 + 说明） | 1 个 |

8 + 3 + 1 = **12**。所以多出来的 4 个，是 **3 个目录清单 + 1 条提交记录**。

（顺带说：git 不知道什么叫"文件夹搬家"。你把某个文件从 A 目录移到 B 目录、内容一字没改，
它也只记"同一个 blob，换了张 tree 清单"。这就是它省空间的原因，也是它比网盘强的地方。）

**你猜的是"上传脚本 push.ps1" —— 不对，而且有个更直接的理由：**
那次推送发生在 2026-10-09，而 `push.ps1` 是 10-10 才写出来的，那时它还不存在。
**以后再遇到这种"数不上"的问题，先问"这个东西当时存在吗"。**

## 关于那一片 `LF will be replaced by CRLF`

Windows 用两个字符表示换行（回车+换行），Linux/Mac 只用一个。git 看到不一致就会念一句。
它**不是错误，也不用管** —— 你已经在 10-10 设了 `core.autocrlf true`，
以后提交时 git 会自动帮你转换，警告也会消失。这就是上面那个技巧的完整用途：
**警告多了不要忍，去查它因什么而起，往往一条配置就能永久解决。**
