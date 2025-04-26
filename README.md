# NuScenes Dataset Downloader with Aria2

## 📖 项目简介

本项目提供了一个简单高效的脚本 `nuscenes_downloader.sh`，用于高速批量下载 [NuScenes 数据集](https://www.nuscenes.org/) 的全部 `.tgz` 文件。  
为了提升下载速度和稳定性，脚本采用了多线程下载工具 **aria2**，相比传统 `wget` 或 `requests` 单线程方式，能显著缩短大文件下载时间，特别适合服务器/科研环境批量下载大数据集。

## 🚀 关于 Aria2

**aria2** 是一款轻量级、多协议、多来源的命令行下载工具，支持 HTTP/HTTPS、FTP、BitTorrent、Metalink 等协议，  
具有以下特点：

- 支持多线程并发连接（大大加快下载速度）
- 支持断点续传
- 支持同时下载多个文件
- 支持限速、代理、自定义连接数等高级功能

官方网址：[https://aria2.github.io/](https://aria2.github.io/)

## 📦 脚本功能

- 批量下载 NuScenes 所有主要 `.tgz` 数据文件
- 支持断点续传
- 支持 16 线程并发加速下载
- 自动保存到指定目录

## 🔧 安装要求

在使用脚本前，请确保系统已安装：

- `bash`（Linux/macOS 默认自带）
- `aria2`（如未安装请参考下方安装方法）

## 📋 安装 Aria2（如果尚未安装）

Ubuntu / Debian 系统：

```bash
sudo apt update
sudo apt install aria2 -y
```

CentOS / RedHat 系统：

```bash
sudo yum install epel-release
sudo yum install aria2 -y
```

macOS（使用 Homebrew）：

```bash
brew install aria2
```

## 📂 使用方法

1. 克隆本项目或手动下载脚本：

```bash
git clone https://github.com/WangShayn/nuscenes_downloader.git
cd your-repo-folder
```
或者直接保存 `nuscenes_downloader.sh` 文件。

2. 赋予脚本可执行权限：

```bash
chmod +x nuscenes_downloader.sh
```

3. 执行脚本开始下载：

```bash
./nuscenes_downloader.sh
```

4. 文件将被保存到默认目录 `/data/nuscenes`（可在脚本中自定义修改）。

## 🛠️ 可选配置

你可以根据需要在脚本中调整以下参数：

- `SAVE_DIR`：设置下载保存目录
- `-x 16 -s 16`：调整并发线程数（适配带宽和服务器性能）
- `FILES` 列表：自定义需要下载的具体文件

## ⚡ 常见问题

- **下载速度慢？**
  - 确保使用的是多线程工具 aria2。
  - 确保服务器带宽充足，无外网限制。
- **断点续传失败？**
  - 确认 aria2 的 `-c` 参数已启用。
- **文件下载后无法解压？**
  - 检查 `.tgz` 文件是否完整（可以增加 MD5 校验机制）。

## 📜 许可协议

本脚本遵循 MIT License，欢迎自由使用与修改。

---

> ✨ 如果你希望进一步增加功能（如下载完成后自动校验 MD5、自动解压等），可以在此脚本基础上扩展。
