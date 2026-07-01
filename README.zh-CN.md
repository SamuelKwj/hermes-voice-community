# Hermes Voice Community

Hermes Voice Community 是 Hermes Voice 的 Basic 社区版：一个本地语音桌面悬浮窗，支持按住说话、本地语音识别、调用 Hermes Gateway，并用 edge-tts 播放语音回复。

这个仓库适合学习、体验、本地测试和基础接入验证。它不是完整产品版，也不是可直接商用发布的版本。

## 它能做什么

已包含：

- 桌面悬浮语音窗口
- 按住说话
- 本地 STT 语音识别
- Hermes Gateway 对接
- edge-tts 语音播放
- 基础设置页
- 首次启动诊断
- 系统托盘
- 本地日志
- 音频设备检查

不包含：

- 产品级安装包制作流程
- 高级悬浮窗交互
- 免提模式
- 唤醒词流程
- 性能档切换
- 深度 GPU 优化
- 应用商店发布、代码签名或正式发布流程
- 跨平台发行能力

## 环境要求

- Windows 10/11
- Python 3.11+
- `ffmpeg` 和 `ffplay` 已加入 PATH
- Hermes Gateway 默认运行在 `http://127.0.0.1:8642`
- `API_SERVER_KEY` 需要按你自己的 Hermes Gateway 配置设置

如果你不知道 `API_SERVER_KEY` 是什么，把 [让你的本地 Hermes 接入 Community 版](docs/LOCAL_HERMES_GUIDE.zh-CN.md) 里的任务说明复制给你的本地 Hermes，让它告诉你 Gateway 地址和 key。

## 快速开始

安装依赖：

```powershell
.\scripts\setup.ps1
```

如果 PowerShell 阻止脚本执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup.ps1
```

设置 Hermes Gateway 密钥：

```powershell
$env:API_SERVER_KEY="your-hermes-gateway-key"
```

启动桌面版：

```powershell
.\scripts\start.ps1
```

也可以手动启动：

```powershell
.\.venv\Scripts\python.exe launcher.py
```

## 使用方式

1. 先启动 Hermes Gateway。
2. 启动 Hermes Voice Community。
3. 在悬浮窗中按住说话按钮，或按住配置好的快捷键说话。
4. 松开后等待识别、发送到 Hermes Gateway、播放回复。

本地接口：

- UI: `http://127.0.0.1:8765`
- 健康检查: `http://127.0.0.1:8765/health`
- 诊断状态: `http://127.0.0.1:8765/api/status`
- 音频设备: `http://127.0.0.1:8765/api/devices`

## 常用配置

用户设置保存在：

```text
%LOCALAPPDATA%\HermesVoiceWidget\settings.json
```

日志和模型缓存：

```text
%LOCALAPPDATA%\HermesVoiceWidget\logs\app.log
%LOCALAPPDATA%\HermesVoiceWidget\models
```

常用环境变量：

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `VOICE_WIDGET_HOST` | `127.0.0.1` | 本地后端监听地址 |
| `VOICE_WIDGET_PORT` | `8765` | 本地后端端口 |
| `HERMES_GATEWAY_URL` | `http://127.0.0.1:8642` | Hermes Gateway 地址 |
| `API_SERVER_KEY` | 空 | Hermes Gateway 鉴权密钥 |
| `VOICE_STT_MODEL` | `base` | faster-whisper 模型 |
| `VOICE_STT_LANG` | `zh` | 识别语言 |
| `VOICE_USE_CUDA` | 空 | 设为 `1` 时尝试 CUDA |
| `VOICE_TTS_VOICE` | `zh-CN-XiaoxiaoNeural` | edge-tts 声音 |

## 文档

- [使用说明](docs/USAGE.md)
- [配置说明](docs/CONFIGURATION.md)
- [Hermes Gateway 接入](docs/HERMES_GATEWAY.md)
- [让你的本地 Hermes 接入 Community 版](docs/LOCAL_HERMES_GUIDE.zh-CN.md)
- [社区版边界](docs/COMMUNITY_EDITION.md)
- [贡献说明](CONTRIBUTING.md)
- [安全说明](SECURITY.md)
- [支持方式](SUPPORT.md)
- [协议说明](LICENSE.md)

## 版本定位

Hermes Voice Community 是 Basic 社区版，重点是让开发者能看懂、能跑起来、能接入 Hermes Gateway。

如果一个功能会明显增加产品复杂度、发布成本，或属于完整产品体验的一部分，它通常不会直接进入这个社区版。

## 协议

本仓库使用自定义 Source-Available Non-Commercial License。

简单说：

- 可以看源码、学习、非商业本地运行、非商业修改、提交 issue 或 PR
- 不允许商用、售卖、再分发、托管成服务，或基于它制作商业竞品
- 商业使用需要获得作者书面许可

详见 [LICENSE.md](LICENSE.md)。
