# Usage Guide

## Start Order

1. Start Hermes Gateway.
2. Install this project's dependencies.
3. Verify `ffmpeg`, `ffplay`, and the Gateway.
4. Set `API_SERVER_KEY`.
5. Start Hermes Voice Community.

```powershell
cd path\to\hermes-voice-community
.\scripts\setup.ps1
ffmpeg -version
ffplay -version
.\scripts\test_gateway.ps1
$env:API_SERVER_KEY="your-hermes-gateway-key"
.\scripts\start.ps1
```

## Basic Operation

- Hold the talk button to start recording.
- Release the button to stop recording.
- The app will transcribe speech, send the text to Hermes Gateway, and play the response.
- If recognition or playback fails, check the status endpoint first.

## Local Endpoints

```text
http://127.0.0.1:8765
http://127.0.0.1:8765/health
http://127.0.0.1:8765/api/status
http://127.0.0.1:8765/api/devices
```

## Common Issues

### Hermes Gateway is not reachable

Confirm that Hermes Gateway is running and `HERMES_GATEWAY_URL` points to the correct address.

```powershell
.\scripts\test_gateway.ps1
```

If your Gateway uses a custom URL or key:

```powershell
.\scripts\test_gateway.ps1 -BaseUrl "http://127.0.0.1:8642" -ApiKey "your-key"
```

### No voice playback

Check:

- The system output device works.
- `ffmpeg` and `ffplay` are available in PATH.
- `edge-tts` installed correctly.

```powershell
ffmpeg -version
ffplay -version
```

### No microphone input

Check:

- Windows microphone permission.
- WebView microphone permission.
- `/api/devices` lists an input device.

Open Windows Settings and confirm microphone access is enabled for desktop apps. Then check:

```text
http://127.0.0.1:8765/api/devices
```

### First transcription is slow

faster-whisper may need to download or load the model. The default model cache is:

```text
%LOCALAPPDATA%\HermesVoiceWidget\models
```

The default model is `base`. If the first download fails, check network access and the app log:

```text
%LOCALAPPDATA%\HermesVoiceWidget\logs\app.log
```
