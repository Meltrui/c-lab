# push.ps1 —— 把「暂存 + 提交 + 推送」一次做完
#
# 用法：在 PowerShell 里进入 C-Lab 目录，然后敲
#   .\push.ps1 "v0.2a: 数组录入与打印"
# 引号里写今天改了什么，不能省略。
#
# 第一次用之前，PowerShell 默认不允许运行脚本，先敲一次这条（只需一次，不用管理员）：
#   Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

# $args[0] 是脚本后面跟的第一个参数，也就是你写的那句说明
$msg = $args[0]

# 没写说明就拒绝执行 —— 强迫自己留下能看懂的历史
if ([string]::IsNullOrWhiteSpace($msg)) {
    Write-Host "ERROR: no message." -ForegroundColor Yellow
    Write-Host 'Example:  .\push.ps1 "v0.2a: array input"' -ForegroundColor Yellow
    exit 1
}

Write-Host "== 1/3  暂存所有改动 ==" -ForegroundColor Cyan
git add -A

Write-Host "== 2/3  看看要提交什么 ==" -ForegroundColor Cyan
git status --short

Write-Host "== 3/3  提交并推送到 GitHub ==" -ForegroundColor Cyan
git commit -m $msg
git push -u origin main

Write-Host "== done ==" -ForegroundColor Green
