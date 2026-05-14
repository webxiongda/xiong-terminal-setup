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
| **[Ghostty](https://ghostty.org)** | GPU 加速终端模拟器 |
| **Fish** 或 **Zsh** | Shell（你选） |
| **[Starship](https://starship.rs)** | 跨 Shell 提示符（Catppuccin Mocha 主题） |
| **MesloLGS NF** | Nerd Font，提供图标和 Powerline 字形 |
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

## 脚本做了什么

1. 安装**包管理器**（macOS 用 Homebrew，Linux 用 apt）
2. 安装 **Ghostty** 终端（macOS；Linux 需手动安装）
3. 安装 **MesloLGS NF** Nerd 字体（从仓库内置，无需下载）
4. 安装你选择的 **Shell** + 插件
5. 安装所有 **CLI 工具**（macOS 用 Homebrew，Linux 用 apt + 内置二进制）
6. 安装 **Starship** 提示符 + Catppuccin Mocha 配置
7. 安装 **fnm** + **Node.js** LTS（可选，fnm 已安装则跳过）
8. 安装 **Zellij** 终端复用器（可选）
9. 部署所有配置文件（已有配置会加时间戳备份）
   - 配置 **git-delta** 作为 git pager
   - 自动设置 **fish abbreviations** 或 **zsh aliases**
   - 初始化 **zoxide** 和 **fzf**

## 平台说明

### macOS
- 完整支持，所有工具通过 Homebrew 安装
- Ghostty 作为原生 macOS 应用安装

### Debian / Ubuntu
- CLI 工具优先用 apt 安装，apt 没有的用内置二进制（delta、lazygit、eza、tldr）
- `bat` 在 Debian 上叫 `batcat`，`fd` 叫 `fdfind` — 脚本会自动创建软链接
- 字体安装到 `~/.local/share/fonts/`
- Ghostty 不在 apt 里 — 可通过 [snap、源码编译](https://ghostty.org/docs/install) 安装，或用其他终端
- Zsh 插件通过 apt 或 git clone 安装

### Windows (WSL)
- 所有操作在 WSL 内部执行（Ubuntu/Debian 层）
- 终端模拟器在 Windows 侧运行 — 推荐 [Windows Terminal](https://aka.ms/terminal) 或 [Ghostty for Windows](https://ghostty.org)
- 脚本自动检测 WSL 环境并适配

## 别名 / 缩写

| 快捷方式 | 展开为 |
|----------|--------|
| `ls` | `eza --icons --group-directories-first` |
| `ll` | `eza -la --icons --group-directories-first` |
| `lt` | `eza --tree --icons --level=2` |
| `cat` | `bat` |
| `find` | `fd` |
| `grep` | `rg` |
| `top` | `btop` |
| `lg` | `lazygit` |
| `cd`（Fish 独有） | `z`（zoxide） |

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

---

## License

MIT
