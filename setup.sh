#!/bin/bash
# xbox-mac-ctrl 一键安装脚本
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN_PATH="/usr/local/bin/xbox-mac-ctrl"
PLIST_PATH="$HOME/Library/LaunchAgents/com.xbox-mac-ctrl.plist"

echo "=== Xbox Controller → macOS Mapper 安装 ==="
echo ""

# 1. 复制脚本到 /usr/local/bin
echo "→ 安装脚本到 $BIN_PATH"
cp "$SCRIPT_DIR/xbox-mac-ctrl" "$BIN_PATH"
chmod +x "$BIN_PATH"

# 2. 检查辅助功能权限
echo "→ 检查辅助功能权限..."
if osascript -e 'tell application "System Events" to key code 0' 2>/dev/null; then
    echo "  ✓ 辅助功能权限已授权"
else
    echo "  ⚠ 请前往 系统设置 → 隐私与安全性 → 辅助功能，添加终端应用"
fi

# 3. 安装 LaunchAgent (开机自启)
echo "→ 安装开机自启..."
mkdir -p "$HOME/Library/LaunchAgents"
cp "$SCRIPT_DIR/com.xbox-mac-ctrl.plist" "$PLIST_PATH"

# 卸载旧的 (如果存在)
launchctl unload "$PLIST_PATH" 2>/dev/null || true
launchctl load "$PLIST_PATH"
echo "  ✓ 已启用开机自启"

# 4. 立即启动
echo "→ 启动 xbox-mac-ctrl..."
pkill -f xbox-mac-ctrl 2>/dev/null || true
sleep 1
nohup "$BIN_PATH" &>/tmp/xbox-mac-ctrl.log &
sleep 2

if pgrep -f xbox-mac-ctrl > /dev/null; then
    echo "  ✓ xbox-mac-ctrl 已启动 (PID=$(pgrep -f xbox-mac-ctrl))"
else
    echo "  ⚠ 启动失败，查看日志: cat /tmp/xbox-mac-ctrl.log"
fi

echo ""
echo "=== 安装完成 ==="
echo ""
echo "管理命令:"
echo "  查看日志:  tail -f /tmp/xbox-mac-ctrl.log"
echo "  手动启动:  nohup xbox-mac-ctrl &>/tmp/xbox-mac-ctrl.log &"
echo "  停止运行:  pkill -f xbox-mac-ctrl"
echo "  禁用自启:  launchctl unload $PLIST_PATH"
echo "  启用自启:  launchctl load $PLIST_PATH"
