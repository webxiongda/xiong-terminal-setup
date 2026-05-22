# 🐻‍❄️ Polar Bear

一键配置终端环境，支持 **macOS**、**Debian/Ubuntu** 和 **Windows (WSL)**。新机器跑一个脚本，几分钟搞定完整终端。

**🇬🇧 [English Version](README.md)**

<p align="center">
  <img src="assets/ghostty.png" width="80" alt="Ghostty">
  &nbsp;&nbsp;
  <img src="assets/fish.png" width="80" alt="Fish Shell">
  &nbsp;&nbsp;
  <img src="assets/zsh.png" width="80" alt="Zsh">
  &nbsp;&nbsp;
  <img src="assets/starship.png" width="80" alt="Starship">
</p>

<p align="center">
  <img src="assets/demo-2x.gif" width="600" alt="Demo">
</p>

## ✨ 特性亮点

- 🪟 **毛玻璃透明** — Ghostty 0.85 透明度 + 高斯模糊
- 🎨 **Catppuccin 主题** — 自动跟随系统明暗模式 (Latte / Mocha)
- ⌨️ **完整快捷键** — 分屏、标签页、光标跳转一应俱全
- 🚀 **Starship 提示符** — Git、语言环境、耗时、conda 一目了然
- 🔤 **Maple Mono NF CN** — 支持中文的 Nerd Font，图标不乱码
- 📦 **一键安装** — 零配置，5 分钟搞定

## 支持平台

| 平台 | 状态 | 包管理器 |
|------|------|---------|
| 🍎 **macOS** | ✅ 主力平台 — 长期使用验证 | Homebrew |
| 🐧 **Debian / Ubuntu** | 🧪 实验性 — 可用但未经长期测试 | apt + 内置二进制 |
| 🪟 **Windows (WSL)** | 🧪 实验性 — 可用但未经长期测试 | apt（WSL 内部） |
| 🪟 **Windows (原生)** | ⛔ 不支持 | 请先安装 WSL |

## 快速开始

### macOS

```bash
git clone https://github.com/webxiongda/xiong-terminal-setup.git
cd xiong-terminal-setup && ./setup.sh
```

### Debian / Ubuntu

```bash
git clone https://github.com/webxiongda/xiong-terminal-setup.git
cd xiong-terminal-setup && ./setup.sh
```

### Windows (WSL)

先安装 WSL（如果还没有）：
```powershell
# 在 PowerShell（管理员）中运行
wsl --install
```

然后在 WSL 中：
```bash
git clone https://github.com/webxiongda/xiong-terminal-setup.git
cd xiong-terminal-setup && ./setup.sh
```

### 选项

```bash
./setup.sh --fish       # Fish shell
./setup.sh --zsh        # Zsh + 类 Fish 插件
./setup.sh --skip-node  # 跳过 fnm + Node.js 安装
./setup.sh --dry-run    # 预览会做什么（不做任何改动）
./setup.sh --reinstall  # 强制重新安装所有工具
```

一行命令（自动 clone）：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/webxiongda/xiong-terminal-setup/main/setup.sh)
```

## 选择你的 Shell

| | 🐟 Fish | 🐚 Zsh |
|---|---------|---------|
| **POSIX 兼容** | ❌ 自有语法 | ✅ 兼容 |
| **自动补全建议** | ✅ 内置 | ✅ 通过插件 |
| **语法高亮** | ✅ 内置 | ✅ 通过插件 |
| **Node 管理** | fnm（共享） | fnm（共享） |
| **配置文件** | `~/.config/fish/config.fish` | `~/.zshrc` |
| **适合** | 开箱即用，省心 | 写脚本，POSIX 兼容 |

## 工具栈

| 组件 | 说明 |
|------|------|
| **[Ghostty](https://ghostty.org)** | GPU 加速终端，毛玻璃 + 分屏 + Quick Terminal |
| **Fish** 或 **Zsh** | Shell（你选） |
| **[Starship](https://starship.rs)** | 跨 Shell 提示符（Catppuccin Mocha 主题） |
| **Maple Mono NF CN** | Nerd Font，中文支持，图标 + Powerline 字形 |
| **[bat](https://github.com/sharkdp/bat)** | 带语法高亮和行号的 `cat` |
| **[eza](https://github.com/eza-community/eza)** | 带图标、git 状态、树形视图的 `ls` |
| **[fd](https://github.com/sharkdp/fd)** | 更快更直观的 `find` |
| **[ripgrep](https://github.com/BurntSushi/ripgrep)** | 比 `grep` 快几个数量级 |
| **[fzf](https://github.com/junegunn/fzf)** | 模糊查找器（Ctrl+R / Ctrl+T / Alt+C） |
| **[btop](https://github.com/aristocratos/btop)** | 漂亮的系统监控 |
| **[zoxide](https://github.com/ajeetdsouza/zoxide)** | 智能 `cd`，学习你的习惯 |
| **[jq](https://github.com/jqlang/jq)** | JSON 处理器 |
| **[tldr](https://github.com/tldr-pages/tldr)** | 简化版 man 手册，附带示例 |
| **[delta](https://github.com/dandavison/delta)** | 带语法高亮的 git diff |
| **[lazygit](https://github.com/jesseduffield/lazygit)** | Git 终端 UI |
| **[fnm](https://github.com/Schniz/fnm)** | 快速 Node 版本管理器（Rust 编写） |
| **[Zellij](https://zellij.dev)** | 现代终端复用器（可选） |

## Ghostty 快捷键速查

> `super` = ⌘ Cmd | `alt` = ⌥ Option | `ctrl` = ⌃ Control | `shift` = ⇧ Shift

| 分类 | 快捷键 | 功能 |
|------|--------|------|
| 分屏 | `Cmd+D` | 向右新建分屏 |
| | `Cmd+Shift+D` | 向下新建分屏 |
| | `Cmd+Opt+↑↓←→` | 在分屏间跳转 |
| | `Cmd+Shift+Enter` | 放大/还原当前分屏 |
| 标签 | `Cmd+T` | 新建标签 |
| | `Cmd+1~8` | 切换标签 |
| | `Cmd+Shift+[/]` | 上/下一个标签 |
| 窗口 | `Cmd+W` | 关闭分屏 |
| | `Cmd+Opt+W` | 关闭标签 |
| | `Cmd+N` | 新建窗口 |
| 字体 | `Cmd+=` / `Cmd+-` | 放大/缩小 |
| | `Cmd+0` | 重置大小 |
| 导航 | `Cmd+↑/↓` | 跳转上/下一个命令提示符 |
| | `Opt+←/→` | 光标跳单词 |
| | `Cmd+←/→` | 光标跳行首/尾 |
| 其他 | `Cmd+K` | 清屏 |
| | `Cmd+Shift+,` | 重载配置 |
| | `Cmd+Enter` | 全屏 |

## 别名 / 缩写

| 快捷方式 | 展开为 |
|----------|--------|
| `ls` | `eza --icons --group-directories-first` |
| `ll` | `eza -lha --icons --group-directories-first` |
| `la` | `eza -a --icons` |
| `lt` | `eza --tree --icons --level=2` |
| `cat` | `bat` |
| `find` | `fd` |
| `grep` | `rg` |
| `top` | `btop` |
| `lg` | `lazygit` |
| `c` | `clear` |

## fzf 快捷键

| 按键 | 功能 |
|------|------|
| `Ctrl+R` | 模糊搜索命令历史 |
| `Ctrl+T` | 模糊查找文件（用 `fd` 作为后端） |
| `Alt+C` | 模糊进入目录 |

## fnm — Node 版本管理

```bash
fnm install 22            # 安装 Node 22
fnm install --lts         # 安装最新 LTS
fnm default 22            # 设置默认版本
fnm use 22                # 当前 shell 切换
echo "22" > .node-version # 进入目录自动切换
```

## SSH Key 切换

两种 Shell 配置都内置了 `set-ssh-key` 函数：

```bash
set-ssh-key my-key-name     # 清空 agent，加载 ~/.ssh/my-key-name
set-ssh-key                  # key 不存在时列出所有可用 key
```

## 配置文件位置

| 文件 | 路径 |
|------|------|
| Ghostty | `~/.config/ghostty/config` |
| Starship | `~/.config/starship.toml` |
| Zsh | `~/.zshrc` |
| Fish | `~/.config/fish/config.fish` |

---

## License

MIT
