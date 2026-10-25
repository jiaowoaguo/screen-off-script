' 双击关闭显示器；不睡眠，后台继续运行。动鼠标/键盘可唤醒。
Option Explicit
Dim sh, ps1
ps1 = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName) & "\关屏.ps1"
Set sh = CreateObject("WScript.Shell")
sh.Run "powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & ps1 & """", 0, False
