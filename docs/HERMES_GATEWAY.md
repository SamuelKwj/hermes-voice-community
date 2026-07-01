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
