# Hermes Voice Community

Hermes Voice Community 是一个本地语音桌面悬浮窗 Basic 版：按住说话，走本地 STT -> Hermes Gateway -> edge-tts 播放。

## 当前状态

- 基础链路已跑通：录音、识别、LLM 回复、TTS、播放。
- 基础 UI 可用：桌面悬浮窗、语音波形、按住说话、对话展示。
- 基础运行能力：健康检查、持久化设置、设置页、首次启动诊断、系统托盘、日志落盘、设备列表、依赖诊断、可配置端口、Windows 启动脚本。

## 社区版范围

本仓库是 Basic 社区版，适合学习、二次开发和接入 Hermes Gateway。

不包含高级语音体验、性能优化、安装包制作流程和跨平台上架能力。

## 环境要求

- Windows 10/11
- Python 3.11+
- ffmpeg 已加入 PATH
- Hermes Gateway 默认运行在 `http://127.0.0.1:8642`
- `API_SERVER_KEY` 需要按你的 Hermes Gateway 配置自行设置

## 安装

```powershell
.\scripts\setup.ps1
```

如果 PowerShell 阻止脚本执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup.ps1
```

## 启动桌面版

```powershell
.\scripts\start.ps1
```

也可以手动启动：

```powershell
.\.venv\Scripts\python.exe launcher.py
```

## 只启动后端调试

```powershell
.\.venv\Scripts\python.exe backend\run_server.py
```

打开：

- UI: `http://127.0.0.1:8765`
- 健康检查: `http://127.0.0.1:8765/health`
- 诊断状态: `http://127.0.0.1:8765/api/status`
- 音频设备: `http://127.0.0.1:8765/api/devices`

## 配置

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

- `VOICE_WIDGET_HOST`: 默认 `127.0.0.1`
- `VOICE_WIDGET_PORT`: 默认 `8765`
- `HERMES_GATEWAY_URL`: 默认 `http://127.0.0.1:8642`
- `API_SERVER_KEY`: Hermes Gateway 鉴权密钥，默认不内置
- `VOICE_STT_MODEL`: 默认 `base`
- `VOICE_STT_LANG`: 默认 `zh`
- `VOICE_USE_CUDA`: 设为 `1` 时使用 CUDA
- `VOICE_TTS_VOICE`: 默认 `zh-CN-XiaoxiaoNeural`

## 社区版待办

1. 补充更清晰的 Hermes Gateway 接入文档。
2. 增加基础错误报告导出。
3. 改进首次启动引导。
4. 补充更多系统兼容性说明。

