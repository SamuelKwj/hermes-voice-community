# 让你的本地 Hermes 接入 Community 版

如果你不知道 `API_SERVER_KEY` 是什么，不要猜。这个 key 不是 Hermes Voice Community 生成的，而是你的本地 Hermes Gateway 决定的。

最简单的做法：把下面这段任务说明交给你的本地 Hermes，让它帮你启动或配置 Gateway。

## 复制给你的本地 Hermes

```text
请帮我为 Hermes Voice Community 准备一个本地 Hermes Gateway。

目标：
让 Hermes Voice Community 可以通过 HTTP 调用你，并完成文字对话回复。

请你完成以下要求：

1. 在本机启动一个 HTTP 服务，默认监听：
   http://127.0.0.1:8642

2. 支持模型检查接口：
   GET /v1/models

   返回示例：
   {
     "data": [
       {"id": "hermes"}
     ]
   }

3. 支持聊天接口：
   POST /v1/chat/completions

   接收 OpenAI Chat Completions 风格 JSON：
   {
     "model": "hermes",
     "messages": [
       {"role": "system", "content": "..."},
       {"role": "user", "content": "你好"}
     ],
     "max_tokens": 300,
     "temperature": 0.7
   }

4. 聊天接口返回普通 JSON，不要先用流式输出。

   返回示例：
   {
     "choices": [
       {
         "message": {
           "role": "assistant",
           "content": "你好，我已经接通了。"
         }
       }
     ]
   }

5. 如果只监听 127.0.0.1，可以不启用鉴权。
   如果启用鉴权，请告诉我 API_SERVER_KEY 是什么。

6. 启动完成后，请明确告诉我这两个值：
   HERMES_GATEWAY_URL=...
   API_SERVER_KEY=...

7. 如果 API_SERVER_KEY 留空，也请明确告诉我：
   API_SERVER_KEY 留空
```

## 拿到 URL 和 Key 后怎么填

如果你的 Hermes 告诉你：

```text
HERMES_GATEWAY_URL=http://127.0.0.1:8642
API_SERVER_KEY=abc123
```

在 PowerShell 里运行：

```powershell
$env:HERMES_GATEWAY_URL="http://127.0.0.1:8642"
$env:API_SERVER_KEY="abc123"
.\scripts\start.ps1
```

如果你的 Hermes 明确说本机 Gateway 没有启用鉴权：

```powershell
$env:HERMES_GATEWAY_URL="http://127.0.0.1:8642"
$env:API_SERVER_KEY=""
.\scripts\start.ps1
```

## 一键测试 Gateway 是否接通

先让你的本地 Hermes Gateway 启动，然后在 Hermes Voice Community 目录运行：

```powershell
.\scripts\test_gateway.ps1
```

如果你的 Gateway 地址或 key 不是默认值：

```powershell
.\scripts\test_gateway.ps1 -BaseUrl "http://127.0.0.1:8642" -ApiKey "abc123"
```

预期结果：

```text
Gateway models endpoint OK
Gateway chat endpoint OK
```

## 你本地 Hermes 至少要做什么

一句话：你的本地 Hermes 要扮演一个兼容 OpenAI Chat Completions 的本地 HTTP 服务。

最少需要：

- 监听一个本地 HTTP 地址，例如 `http://127.0.0.1:8642`
- 支持 `GET /v1/models`
- 支持 `POST /v1/chat/completions`
- 接收 `messages`
- 返回 `choices[0].message.content`
- 如果启用鉴权，就使用 `Authorization: Bearer <API_SERVER_KEY>`

不要求：

- 不要求公网服务
- 不要求流式输出
- 不要求工具调用
- 不要求用户自己知道 key

key 应该由 Gateway 提供者给出；如果 Gateway 是你本机自己启动的，就由你的本地 Hermes 告诉你。
