# Configuration

## User Settings

The app stores user settings at:

```text
%LOCALAPPDATA%\HermesVoiceWidget\settings.json
```

This file stores audio device, STT, TTS, Hermes Gateway, and UI settings.

## Environment Variables

PowerShell example:

```powershell
$env:HERMES_GATEWAY_URL="http://127.0.0.1:8642"
$env:API_SERVER_KEY="your-hermes-gateway-key"
$env:VOICE_STT_MODEL="base"
$env:VOICE_STT_LANG="zh"
$env:VOICE_TTS_VOICE="zh-CN-XiaoxiaoNeural"
```

These values only apply to the current PowerShell session.

## Hermes Gateway

| Item | Default | Description |
| --- | --- | --- |
| `HERMES_GATEWAY_URL` | `http://127.0.0.1:8642` | Hermes Gateway URL |
| `API_SERVER_KEY` | empty | Auth key for your Gateway |

## STT

| Item | Default | Description |
| --- | --- | --- |
| `VOICE_STT_MODEL` | `base` | faster-whisper model |
| `VOICE_STT_LANG` | `zh` | Recognition language |
| `VOICE_USE_CUDA` | empty | Set to `1` to try CUDA |

## TTS

| Item | Default | Description |
| --- | --- | --- |
| `VOICE_TTS_VOICE` | `zh-CN-XiaoxiaoNeural` | edge-tts voice |

## Local Backend

| Item | Default | Description |
| --- | --- | --- |
| `VOICE_WIDGET_HOST` | `127.0.0.1` | Local backend host |
| `VOICE_WIDGET_PORT` | `8765` | Local backend port |
