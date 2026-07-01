# Hermes Voice Community

[中文介绍](README.zh-CN.md)

Hermes Voice Community is the Basic community edition of Hermes Voice: a local desktop voice widget for push-to-talk speech recognition, Hermes Gateway chat, and edge-tts voice playback.

This repository is intended for learning, local testing, and basic Hermes Gateway integration. It is not the full product edition.

## Features

Included:

- Desktop floating voice widget
- Push-to-talk recording
- Local STT with faster-whisper
- Hermes Gateway integration
- Voice playback with edge-tts
- Basic settings panel
- First-run diagnostics
- System tray entry
- Local logs
- Audio device checks

Not included:

- Product-grade app packaging workflow
- Advanced floating widget interactions
- Hands-free mode
- Wake word flow
- Performance profiles
- Deep GPU optimization
- Store publishing, code signing, or release workflow
- Cross-platform distribution support

## Requirements

- Windows 10/11
- Python 3.11+
- `ffmpeg` and `ffplay` available in PATH
- Hermes Gateway running at `http://127.0.0.1:8642` by default
- `API_SERVER_KEY` configured for your own Hermes Gateway

If you do not know your Gateway key, ask your local Hermes/Gateway provider to start a compatible Gateway and give you `HERMES_GATEWAY_URL` plus `API_SERVER_KEY`. Chinese users can follow [Local Hermes Guide](docs/LOCAL_HERMES_GUIDE.zh-CN.md).

## Quick Start

Install dependencies:

```powershell
.\scripts\setup.ps1
```

If PowerShell blocks script execution:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup.ps1
```

Set your Hermes Gateway key:

```powershell
$env:API_SERVER_KEY="your-hermes-gateway-key"
```

Start the desktop app:

```powershell
.\scripts\start.ps1
```

You can also start it manually:

```powershell
.\.venv\Scripts\python.exe launcher.py
```

## Usage

1. Start Hermes Gateway.
2. Start Hermes Voice Community.
3. Hold the talk button, or hold the configured hotkey, and speak.
4. Release to transcribe, send the text to Hermes Gateway, and play the reply.

Local endpoints:

- UI: `http://127.0.0.1:8765`
- Health: `http://127.0.0.1:8765/health`
- Status: `http://127.0.0.1:8765/api/status`
- Audio devices: `http://127.0.0.1:8765/api/devices`

## Configuration

User settings are stored at:

```text
%LOCALAPPDATA%\HermesVoiceWidget\settings.json
```

Logs and model cache:

```text
%LOCALAPPDATA%\HermesVoiceWidget\logs\app.log
%LOCALAPPDATA%\HermesVoiceWidget\models
```

Common environment variables:

| Variable | Default | Description |
| --- | --- | --- |
| `VOICE_WIDGET_HOST` | `127.0.0.1` | Local backend host |
| `VOICE_WIDGET_PORT` | `8765` | Local backend port |
| `HERMES_GATEWAY_URL` | `http://127.0.0.1:8642` | Hermes Gateway URL |
| `API_SERVER_KEY` | empty | Hermes Gateway auth key |
| `VOICE_STT_MODEL` | `base` | faster-whisper model |
| `VOICE_STT_LANG` | `zh` | STT language |
| `VOICE_USE_CUDA` | empty | Set to `1` to try CUDA |
| `VOICE_TTS_VOICE` | `zh-CN-XiaoxiaoNeural` | edge-tts voice |

## Documentation

- [Usage Guide](docs/USAGE.md)
- [Configuration](docs/CONFIGURATION.md)
- [Hermes Gateway Integration](docs/HERMES_GATEWAY.md)
- [Local Hermes Guide zh-CN](docs/LOCAL_HERMES_GUIDE.zh-CN.md)
- [Community Edition Scope](docs/COMMUNITY_EDITION.md)
- [Contributing](CONTRIBUTING.md)
- [Security](SECURITY.md)
- [Support](SUPPORT.md)
- [License Status](LICENSE.md)

## Project Structure

```text
backend/      Local FastAPI backend, STT, TTS, and Hermes Gateway client
frontend/     Floating widget UI
scripts/      Setup and start scripts
launcher.py   Desktop window entry point
```

## License

This repository uses a custom source-available, non-commercial license. See [LICENSE.md](LICENSE.md).
