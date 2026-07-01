# Hermes Gateway Integration

Hermes Voice Community calls a local Hermes Gateway by default:

```text
http://127.0.0.1:8642
```

## Authentication

Requests use:

```text
Authorization: Bearer <API_SERVER_KEY>
```

Set the key before starting the app:

```powershell
$env:API_SERVER_KEY="your-hermes-gateway-key"
```

The community edition does not include a built-in default key.

If you do not know this key, ask whoever runs your Hermes Gateway. For a local self-hosted Gateway, the local Hermes process should either:

- run without auth on `127.0.0.1`, in which case `API_SERVER_KEY` can be empty; or
- generate/configure a key and tell you the exact `API_SERVER_KEY` value.

Chinese setup prompt: [让你的本地 Hermes 接入 Community 版](LOCAL_HERMES_GUIDE.zh-CN.md).

## Chat Endpoint

The current client calls:

```text
POST /v1/chat/completions
```

Request shape:

```json
{
  "model": "hermes",
  "messages": [
    {"role": "system", "content": "You are a concise voice assistant."},
    {"role": "user", "content": "hello"}
  ],
  "max_tokens": 300,
  "temperature": 0.7
}
```

## Model Status Endpoint

Diagnostics call:

```text
GET /v1/models
```

If your Gateway does not support this endpoint, the main voice flow may still work, but diagnostics can show a warning.
