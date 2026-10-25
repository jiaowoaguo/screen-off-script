# Close monitor only: no sleep/hibernate; PC keeps running.
# Wake: move mouse or press a key.

Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public static class MonitorPower
{
    [DllImport("user32.dll", SetLastError = true)]
    private static extern IntPtr SendMessageTimeout(
        IntPtr hWnd, uint Msg, UIntPtr wParam, IntPtr lParam,
        uint fuFlags, uint uTimeout, out UIntPtr lpdwResult);

    public static void TurnOff()
    {
        const uint WM_SYSCOMMAND = 0x0112;
        const uint SC_MONITORPOWER = 0xF170;
        const uint MONITOR_OFF = 2;
        const uint SMTO_ABORTIFHUNG = 2;

        UIntPtr result;
        SendMessageTimeout(
            (IntPtr)0xFFFF,          // HWND_BROADCAST
            WM_SYSCOMMAND,
            (UIntPtr)SC_MONITORPOWER,
            (IntPtr)MONITOR_OFF,
            SMTO_ABORTIFHUNG,
            5000,
            out result);
    }
}
'@

[MonitorPower]::TurnOff()
