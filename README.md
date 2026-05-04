# Xbox Controller → macOS Keyboard Mapper

将 Xbox 无线手柄变成 macOS 全功能遥控器。所有按键和摇杆映射为键盘快捷键，躺着也能控制浏览器、YouTube、媒体播放和系统操作。

## 为什么需要它？

坐在电脑前工作时切换标签页、调音量是很自然的。但当你靠在椅背上、坐在沙发上、或者接上大屏幕看电影时，键盘就变成了束缚。**xbox-mac-ctrl** 让你用手柄完成高频操作——翻页、滚动、切标签、调音量、播放控制——全程不用碰键盘。

## 快速开始

```bash
# 一键安装
chmod +x setup.sh && ./setup.sh

# 或手动安装
cp xbox-mac-ctrl /usr/local/bin/
chmod +x /usr/local/bin/xbox-mac-ctrl
```

连接 Xbox 手柄（蓝牙或 USB），运行：

```bash
xbox-mac-ctrl
```

按手柄任意按键唤醒连接，即可使用。

### 开机自启

```bash
# 安装 LaunchAgent
cp com.xbox-mac-ctrl.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/com.xbox-mac-ctrl.plist

# 卸载
launchctl unload ~/Library/LaunchAgents/com.xbox-mac-ctrl.plist
```

## 按键映射

### 默认模式（浏览器 / 内容消费）

```
┌─────────────────────────────────────────────────────┐
│                    DEFAULT MODE                      │
├──────────────┬──────────────────┬────────────────────┤
│   按键       │   映射            │   说明              │
├──────────────┼──────────────────┼────────────────────┤
│ A            │ Space            │ 播放 / 暂停         │
│ B            │ Cmd+[            │ 浏览器后退          │
│ X            │ F                │ 全屏切换            │
│ Y            │ M                │ 静音切换            │
│ LB           │ ←                │ 后退5秒 / 上一页    │
│ RB           │ →                │ 前进5秒 / 下一页    │
│ LT (压感)    │ ↑                │ 向上滚动 (越深越快)  │
│ RT (压感)    │ ↓                │ 向下滚动 (越深越快)  │
│ D-Pad ↑      │ 音量+            │ 系统音量增大        │
│ D-Pad ↓      │ 音量-            │ 系统音量减小        │
│ D-Pad ←      │ J                │ YouTube 回退10秒    │
│ D-Pad →      │ L                │ YouTube 前进10秒    │
│ 左摇杆 ↑     │ Page Up          │ 大幅上翻            │
│ 左摇杆 ↓     │ Page Down        │ 大幅下翻            │
│ 左摇杆 ←     │ Cmd+Shift+[       │ 上一个标签页        │
│ 左摇杆 →     │ Cmd+Shift+]       │ 下一个标签页        │
│ LSB (按下)   │ Cmd+T            │ 新建标签页          │
│ 右摇杆 ↑     │ ↑                │ 向上滚动            │
│ 右摇杆 ↓     │ ↓                │ 向下滚动            │
│ 右摇杆 ←     │ Cmd+[            │ 浏览器后退          │
│ 右摇杆 →     │ Cmd+]            │ 浏览器前进          │
│ RSB (按下)   │ Cmd+W            │ 关闭标签页          │
│ Select       │ Escape           │ 退出 / 取消         │
│ Start        │ Cmd+Space        │ Spotlight 搜索      │
└──────────────┴──────────────────┴────────────────────┘
```

### 阅读模式

用 `xbox-mac-ctrl --reading` 启动，LB/RB 变为 PageUp/PageDown，适合微信读书等阅读类应用。

## 模拟输入

### 扳机键 (LT/RT) — 压感滚动

按得越深，滚动越快：

| 压力范围 | 触发间隔 | 感受 |
|---------|---------|------|
| 0-25% | 不触发 | 死区 |
| 25-60% | 200ms | 慢速浏览 |
| 60-85% | 100ms | 匀速阅读 |
| 85-100% | 50ms | 快速扫过 |

### 摇杆 — 方向键重复

推摇杆持续触发方向键，推动幅度越大重复越快（150ms → 80ms），回中即停。

## 高级用法

### 自定义映射

```bash
xbox-mac-ctrl \
  --face=space,cmd+[,f,m \
  --shoulders=left,right \
  --triggers=up,down \
  --dpad=volume-up,volume-down,j,l \
  --lstick=pageup,pagedown,cmd+shift+[,cmd+shift+],cmd+t \
  --rstick=up,down,cmd+[,cmd+],cmd+w \
  --sys=escape,cmd+space
```

使用 `none` 禁用某个按键：

```bash
xbox-mac-ctrl --dpad=none,none,none,none   # 禁用十字键
```

## 支持按键列表

| 类别 | 可选按键 |
|------|---------|
| 导航 | left, right, up, down, pageup, pagedown |
| 字母 | f, j, k, l, m, t, w |
| 功能 | space, escape, enter, tab, backspace, delete |
| 组合键 | cmd+[, cmd+], cmd+left, cmd+right, cmd+shift+[, cmd+shift+], cmd+t, cmd+w, cmd+space, cmd+f, cmd+r |
| 特殊 | volume-up, volume-down, mute-system |
| 禁用 | none |

## 系统要求

- macOS 12+
- Xbox Wireless Controller（蓝牙或 USB 连接）
- **必须**授权辅助功能权限：系统设置 → 隐私与安全性 → 辅助功能 → 添加终端

## 技术实现

- **输入**: macOS GameController framework（蓝牙 + USB 双模）
- **输出**: AppleScript System Events 发送键盘事件
- **模拟处理**: 30Hz tick loop 驱动压感/摇杆的变速按键重复
- **语言**: Python 3 + PyObjC 桥接

## 工作原理

```
Xbox Controller → Bluetooth/USB
        ↓
macOS GameController Framework (GCController)
        ↓
xbox-mac-ctrl (Python + PyObjC)
        ↓
osascript System Events → 键盘事件
        ↓
任意前台 App (浏览器/YouTube/微信读书...)
```

## 常见问题

**Q: 按键没反应？**
A: 检查辅助功能权限：系统设置 → 隐私与安全性 → 辅助功能 → 确保终端已勾选。

**Q: 手柄过一会儿自动断开？**
A: Xbox 手柄 15 分钟不操作自动休眠（省电设计）。按任意按键 2-3 秒自动唤醒。脚本会自动检测重连。

**Q: 如何查看调试信息？**
A: 查看日志 `tail -f /tmp/xbox-mac-ctrl.log`。

**Q: 微信读书不响应？**
A: 微信读书是 Electron 应用，可能过滤了某些按键。使用 `--reading` 模式（LB/RB 变为 PageUp/PageDown）。

## 类似项目

- [Hammerspoon](https://github.com/Hammerspoon/hammerspoon) + hs.hid（但 GameController 独占访问权限，Hammerspoon 无法读取）
- [Enjoyable](https://github.com/fikovnik/Enjoyable)（年久失修，不支持 Apple Silicon）

## 许可证

MIT

## 作者

- X (Twitter): [@vista8](https://x.com/vista8)
- 微信公众号: 「向阳乔木推荐看」
- GitHub: [@joeseesun](https://github.com/joeseesun)
