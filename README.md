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

## 能做什么

```
      Y (右键菜单)                         左摇杆/右摇杆 = 鼠标光标
  X (播放/暂停)   B (后退)                  左摇杆按下 = 点击
      A (左键点击)                          右摇杆按下 = 关闭标签页

  LB = ← 快退    RB = → 快进               十字键 ↑↓ = 音量
  LT = 上滚 ░   RT = 下滚 ░                十字键 ←→ = 切标签页
  (压越深滚越快)                             Select = Esc   Start = 搜索
```

**16 个控件全部映射，一个不浪费。** 看 YouTube、刷网页、翻文档——全程手柄搞定。

## 为什么用 CGEvent 而不是 AppleScript？

市面上大多数方案用 AppleScript 模拟按键，但在中文输入法下会出问题（按 A 变成"啊"）。本项目用 macOS 底层 `CGEvent` API，**彻底绕开输入法**，所有按键直达应用。

## 实测场景

| 场景 | 躺姿 |
|------|------|
| YouTube 全屏 | 摇杆移光标→A点击暂停→十字键调音量→B返回 |
| 刷微博/Twitter | RT 中指滚屏→右摇杆移鼠标→A 点开看 |
| 微信读书 | 摇杆翻页→A 点击划线→十字键切章节 |
| 写代码累了靠椅背 | 摇杆切文件→B 返回→十字键 ←→ 切标签 |

## 高级玩法

```bash
# 完全自定义映射
xbox-mac-ctrl \
  --face=click,cmd+[,space,rightclick \
  --dpad=volume-up,volume-down,cmd+shift+[,cmd+shift+] \
  --shoulders=left,right \
  --triggers=up,down \
  --sys=escape,cmd+space
```

任何按键填 `none` 即可禁用。

## 常见问题

**Q: 按键没反应？**
授权辅助功能：系统设置 → 隐私与安全性 → 辅助功能 → 勾选终端

**Q: 手柄自动休眠？**
Xbox 手柄 15 分钟不操作会休眠省电。按任意键 2-3 秒自动唤醒。

**Q: 怎么卸载？**
```bash
launchctl unload ~/Library/LaunchAgents/com.xbox-mac-ctrl.plist
rm /usr/local/bin/xbox-mac-ctrl ~/Library/LaunchAgents/com.xbox-mac-ctrl.plist
```

## 技术栈

Python 3 + PyObjC，直接调用 macOS 原生框架：
- `GameController` — 读取手柄输入（蓝牙 + USB）
- `CoreGraphics (CGEvent)` — 发送键盘/鼠标事件（无输入法干扰）
- `launchd` — 开机自启

## 作者

- X (Twitter): [@vista8](https://x.com/vista8)
- 微信公众号: 「向阳乔木推荐看」
- GitHub: [@joeseesun](https://github.com/joeseesun)

## 许可证

MIT — 随意使用、修改、分发。
