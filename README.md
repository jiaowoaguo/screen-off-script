# 一键关屏脚本

双击即可关闭显示器，**不睡眠、不休眠**，电脑继续在后台运行；动鼠标或按任意键即可唤醒。

## 文件

| 文件 | 作用 |
|------|------|
| `一键关屏.vbs` | 入口：双击它，隐藏窗口调用 PowerShell（无黑框闪烁） |
| `关屏.ps1` | 实际逻辑：通过 `SendMessageTimeout` 广播 `SC_MONITORPOWER` 关闭显示器 |

## 用法

1. 把这两个文件放在同一目录（如桌面）。
2. 双击 `一键关屏.vbs`，屏幕立即关闭。
3. 移动鼠标或按键盘唤醒。

## 原理

`关屏.ps1` 用 P/Invoke 调用 `user32.dll` 的 `SendMessageTimeout`，向 `HWND_BROADCAST` 发送 `WM_SYSCOMMAND`（`SC_MONITORPOWER`，参数 `-2` 表示关闭显示器）。这只关屏幕，不影响系统电源状态，后台任务（下载、渲染等）照常运行。

## 注意

- 若 PowerShell 执行策略受限，VBS 已带 `-ExecutionPolicy Bypass`，无需修改系统策略。
- 部分电脑可能被组策略或显卡驱动限制而不响应，可改用系统自带的 `Win + L` 锁屏或电源按钮方案。
