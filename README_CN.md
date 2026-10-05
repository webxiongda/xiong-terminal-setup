# 🐻‍❄️ Polar Bear

一键配置终端环境，支持 **macOS**、**Debian/Ubuntu** 和 **Windows (WSL)**。新机器跑一个脚本，几分钟搞定完整终端。

**🇬🇧 [English Version](README.md)**

<p align="center">
  <img src="assets/zsh.png" width="80" alt="Zsh">
  &nbsp;&nbsp;
  <img src="assets/starship.png" width="80" alt="Starship">
</p>

<p align="center">
  <img src="assets/demo-2x.gif" width="600" alt="Demo">
</p>

## ✨ 特性亮点

- 🎨 **Catppuccin 主题** — Starship 提示符自动跟随系统明暗模式 (Latte / Mocha)
- 🚀 **Starship 提示符** — Git、语言环境、耗时、conda 一目了然
- 🔤 **Maple Mono NF CN** — 支持中文的 Nerd Font，图标不乱码
- 🧰 **现代 CLI 全家桶** — eza / bat / fd / rg / fzf / zoxide / lazygit / delta…
- 🖥 **不绑定终端** — 用你现有的终端就行，推荐 Warp（可选，脚本不安装）
- 📦 **一键安装** — 零配置，5 分钟搞定；本机自定义放在 `~/.zshrc.local`，重跑不丢

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
./setup.sh --skip-node  # 跳过 fnm + Node.js 安装
./setup.sh --dry-run    # 预览会做什么（不做任何改动）
./setup.sh --reinstall  # 强制重新安装所有工具
```

一行命令（自动 clone）：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/webxiongda/xiong-terminal-setup/main/setup.sh)
```

## 工具栈

| 组件 | 说明 |
|------|------|
| **终端模拟器** | 自选 —— 推荐 [Warp](https://www.warp.dev)（可选，本脚本不安装） |
| **Zsh** | Shell，带有自动建议 + 语法高亮 + 补全 |
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

## Warp 快捷键速查（推荐终端，可选）

> 本脚本不安装终端模拟器 —— 用你现有的终端就行。以下为推荐的 **Warp** 的常用快捷键。
> `super` = ⌘ Cmd | `alt` = ⌥ Option | `ctrl` = ⌃ Control | `shift` = ⇧ Shift

| 分类 | 快捷键 | 功能 |
|------|--------|------|
| 分屏 | `Cmd+D` | 向右新建分屏 |
| | `Cmd+Shift+D` | 向下新建分屏 |
| | `Cmd+Opt+↑↓←→` | 在分屏间跳转 |
| | `Cmd+Shift+Enter` | 最大化/还原当前分屏 |
| 标签 | `Cmd+T` | 新建标签 |
| | `Cmd+1~8` | 切换标签 |
| | `Shift+Cmd+{` / `Shift+Cmd+}` | 上/下一个标签 |
| 面板 | `Cmd+P` | 命令面板 |
| | `Shift+Cmd+P` | 导航面板 |
| Block | `Cmd+↑/↓` | 上/下一个命令块 |
| | `Cmd+I` | 重新输入选中的命令 |
| 字体 | `Cmd+=` / `Cmd+-` | 放大/缩小 |
| | `Cmd+0` | 重置大小 |
| 搜索 | `Cmd+F` / `Cmd+G` | 查找 / 下一个匹配 |
| | `Ctrl+R` | Warp 自带命令搜索（会占用 fzf 的 `Ctrl+R`） |
| 其他 | `Cmd+K` | 清空 Blocks |
| | `Ctrl+L` | 清屏 |

> ⚠️ Warp 内置的 `Ctrl+R` 优先于 `~/.zshrc` 里 fzf 的绑定。想用 fzf 的历史搜索，
> 用 `Cmd+P` 搜 "command search" 改掉或关掉 Warp 的绑定。

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
| Starship | `~/.config/starship.toml` |
| Zsh | `~/.zshrc` |
| Zsh（本机自定义） | `~/.zshrc.local` — 重跑 `setup.sh` 不会覆盖 |

---

## License

MIT
