# Xbox Controller → macOS 全能遥控器

**把你的 Xbox 手柄变成 Mac 万能遥控器。躺沙发、靠椅背、接大屏——再也不用伸手够键盘。**

<p align="center">
  <img src="https://img.shields.io/badge/platform-macOS%2012%2B-blue" alt="macOS 12+">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT">
  <img src="https://img.shields.io/badge/Python-3-blue" alt="Python 3">
</p>

## 一行命令安装

```bash
curl -fsSL https://raw.githubusercontent.com/joeseesun/xbox-mac-ctrl/main/setup.sh | bash
```

安装后开箱即用，开机自启。拿起手柄就能操控 Mac。

**安装前需要授权**（必须，否则按键无效）：

> 系统设置 → 隐私与安全性 → 辅助功能 → 勾选终端（或 iTerm）

## 手柄布局与完整映射

```
        ┌──────────────────────────────────────┐
        │           Xbox 手柄 → Mac            │
        ├──────────────────────────────────────┤
        │                                      │
        │   LB (← 快退)      RB (→ 快进)        │
        │                                      │
        │   LT (上滚 ░)      RT (下滚 ░)        │
        │   压越深滚越快                          │
        │                                      │
        │         Y (右键菜单)                   │
        │     X (播放/暂停)  B (后退)            │
        │         A (左键点击)                   │
        │                                      │
        │      左摇杆 ──── 右摇杆                │
        │     (鼠标光标)   (鼠标光标)             │
        │      按下=点击    按下=关闭标签页         │
        │                                      │
        │     十字键 ↑↓ = 音量 ±                 │
        │     十字键 ←→ = 切标签页                │
        │                                      │
        │   Select = Esc    Start = 搜索        │
        │     Share = 截图       Xbox = 系统预留 │
        └──────────────────────────────────────┘
```

### 完整映射表

| 控件 | 映射 | 实际效果 | 说明 |
|------|------|---------|------|
| **A** | 左键点击 | 鼠标左键 | 点击链接、按钮、选择 |
| **B** | Cmd+[ | 后退 | 浏览器返回上一页、Finder 返回上级 |
| **X** | Space | 播放/暂停 | 视频播放/暂停、页面下滚 |
| **Y** | 右键点击 | 鼠标右键 | 右键菜单、新建标签页打开链接 |
| **LB** | ← | 快退 | YouTube 后退 5 秒、B站后退 |
| **RB** | → | 快进 | YouTube 前进 5 秒、B站快进 |
| **LT** | 上滚（压感） | ↑ 滚动 | 越深越快：慢速→匀速→飞速 |
| **RT** | 下滚（压感） | ↓ 滚动 | 同上，中指自然搭放 |
| **D-Pad ↑** | 音量+ | 系统音量增大 | |
| **D-Pad ↓** | 音量- | 系统音量减小 | |
| **D-Pad ←** | Cmd+Shift+[ | 上一个标签页 | 浏览器向左切标签 |
| **D-Pad →** | Cmd+Shift+] | 下一个标签页 | 浏览器向右切标签 |
| **左摇杆** | 鼠标移动 | 光标控制 | 左右摇杆共享光标，无缝接力 |
| **LSB（按下）** | 左键点击 | 鼠标点击 | 按下摇杆=点击 |
| **右摇杆** | 鼠标移动 | 光标控制 | 同上，两手都能控 |
| **RSB（按下）** | Cmd+W | 关闭标签页/窗口 | 浏览器关标签、Finder 关窗口 |
| **Select** | Esc | 退出/取消 | 退出全屏、关闭弹窗 |
| **Start** | Cmd+Space | Spotlight 搜索 | 快速启动应用、搜索文件 |
| **Share** | Cmd+Shift+3 | 全屏截图 | 截图保存到桌面或"最近使用" |
| **Xbox Logo** | — | 系统预留 | macOS 系统拦截，无法映射 |

**Share 按钮为 Xbox Series X\|S 手柄专属。Xbox Logo 被 macOS 系统拦截（弹出 Game Center），不可用。**

## 分场景操作指南

### YouTube / B站 全屏看视频

这是最爽的场景——全程靠椅背，手柄搞定一切：

```
选中视频 → A 点击播放
全屏中  → 摇杆移光标到进度条
        → A 点击跳转
        → 十字键 ↑↓ 调音量
        → X 暂停 / 播放
        → LB 后退 5 秒（错过了什么）
        → RB 前进 5 秒（跳过无聊片段）
        → 十字键 ←→ 切到下一个视频标签
        → Select 退出全屏
        → 摇杆移光标到其他推荐视频 → A 点击
```

**典型流程**：打开 YouTube → 光标移到视频 → A 点击 → X 暂停时刷评论 → RT 滚动评论区 → X 继续看 → 不想看了十字键切标签 → B 回首页

### B站弹幕互动

```
A 点击视频 → X 暂停 → 摇杆移到弹幕框 → A 点击输入
→ Start 打开 Spotlight → 切回输入法 → 键盘打字发弹幕
→ Select 关闭弹幕面板 → X 继续播放
→ Y 右键视频区域 → 复制链接分享
```

### 刷网页（微博 / Twitter / 论坛）

```
RT 中指滚屏 ░░░ 匀速往下刷
（压力控制节奏：轻压慢刷→重压速刷）

摇杆移光标 → 看到想看的 → A 点开
不想看了 → 十字键 → 切回来（或 B 返回）
想新标签打开 → Y 右键 → 选"在新标签页打开"
想关掉当前 → RSB 按下 关闭标签
```

**典型流程**：Twitter 时间线 → RT 中指滚 → 看到好内容 → 右摇杆移光标 → A 点开看 → B 返回时间线 → 继续 RT 滚

### 写代码 / 看文档

```
摇杆在编辑器/终端间切光标
十字键 ←→ 切换文件标签
Select = Esc 退出 Vim insert / 关闭提示
Start 搜索文件/代码符号
LT/RT 滚动文档
RSB 关闭不用的标签页
B 在浏览器中后退到上一个文档
```

**典型流程**：靠在椅背上 → 摇杆在代码里定位 → 十字键切 .tsx 和 .css → LT 上翻看逻辑 → RT 下翻看样式 → RSB 关掉不需要的文件

### 微信读书 / 阅读

```
摇杆移光标到翻页按钮 → A 点击翻页
或：RT 向下滚动逐行阅读
A 长按选中文字 → Y 右键划线/查词
十字键 ←→ 切章节
LT 上滚回看前文
Select 退出全屏阅读
```

### 访达（Finder）/ 桌面

```
摇杆移光标 → A 选中文件/文件夹
B 返回上级目录
Start 搜索文件
Y 右键文件 → 操作菜单
RSB 关闭当前 Finder 窗口
```

## 模拟量按键（压感）

LT 和 RT 不是简单的"按下/松开"，而是**模拟量输入**——按得越深，效果越强：

| 压力范围 | 触发间隔 | 体验 |
|---------|---------|------|
| 0-25% | 不触发 | 死区，防误触 |
| 25-60% | 200ms | 慢速浏览，细读内容 |
| 60-85% | 100ms | 匀速扫读，正常节奏 |
| 85-100% | 50ms | 极速穿梭，快速定位 |

左右摇杆同样带**加速曲线**：小幅推动=慢速精准定位，推到底=快速跨屏移动。

## 为什么用 CGEvent 而不是 AppleScript？

市面上大多数方案用 AppleScript 模拟按键，但在中文输入法下会出问题——按 A 可能变成"啊"，按 Space 可能触发输入法候选。本项目用 macOS 底层 `CGEvent` API，**彻底绕开输入法**，所有按键直达应用。

音量调节因无 CGEvent API，仍通过 AppleScript 实现，不受输入法影响。

## 高级玩法

```bash
# 完全自定义映射
xbox-mac-ctrl \
  --face=click,cmd+[,space,rightclick \
  --dpad=volume-up,volume-down,cmd+shift+[,cmd+shift+] \
  --shoulders=left,right \
  --triggers=up,down \
  --sys=escape,cmd+space \
  --share=cmd+shift+3 \
  --xbox=launchpad
```

### 支持的按键值

| 类别 | 可选值 |
|------|-------|
| 鼠标 | `click`, `rightclick` |
| 导航 | `left`, `right`, `up`, `down`, `pageup`, `pagedown` |
| 功能 | `space`, `escape`, `enter`, `tab`, `backspace`, `delete` |
| 组合键 | `cmd+[`, `cmd+]`, `cmd+shift+[`, `cmd+shift+]`, `cmd+t`, `cmd+w`, `cmd+space`, `cmd+f`, `cmd+r`, `cmd+shift+3` |
| 系统 | `volume-up`, `volume-down`, `launchpad` |
| 禁用 | `none` |

## 常见问题

**Q: 按键没反应？**
授权辅助功能：系统设置 → 隐私与安全性 → 辅助功能 → 勾选终端（如果用的 iTerm 则勾选 iTerm）。

**Q: 手柄自动休眠？**
Xbox 手柄 15 分钟不操作会休眠省电。按任意键 2-3 秒自动唤醒，脚本会自动检测重连。

**Q: 怎么查看运行状态？**
```bash
tail -f /tmp/xbox-mac-ctrl.log
```

**Q: 怎么卸载？**
```bash
launchctl unload ~/Library/LaunchAgents/com.xbox-mac-ctrl.plist
rm /usr/local/bin/xbox-mac-ctrl ~/Library/LaunchAgents/com.xbox-mac-ctrl.plist
```

**Q: 停止运行（不卸载）？**
```bash
pkill -f xbox-mac-ctrl
```

## 技术栈

Python 3 + PyObjC，直接调用 macOS 原生框架：
- `GameController` — 读取手柄输入（蓝牙 + USB）
- `CoreGraphics (CGEvent)` — 发送键盘/鼠标事件（无输入法干扰）
- `CoreGraphics (Mouse Event)` — 鼠标移动、左右键点击
- `launchd` — 开机自启

## 作者

- X (Twitter): [@vista8](https://x.com/vista8)
- 微信公众号: 「向阳乔木推荐看」
- GitHub: [@joeseesun](https://github.com/joeseesun)

## 许可证

MIT — 随意使用、修改、分发。
