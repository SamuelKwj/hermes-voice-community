param(
    [string]$BaseUrl = $env:HERMES_GATEWAY_URL,
    [string]$ApiKey = $env:API_SERVER_KEY
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($BaseUrl)) {
    $BaseUrl = "http://127.0.0.1:8642"
}

$BaseUrl = $BaseUrl.TrimEnd("/")
$Headers = @{}
if (-not [string]::IsNullOrWhiteSpace($ApiKey)) {
    $Headers["Authorization"] = "Bearer $ApiKey"
}

Write-Host "Testing Hermes Gateway at $BaseUrl"

$models = Invoke-RestMethod -Method Get -Uri "$BaseUrl/v1/models" -Headers $Headers -TimeoutSec 10
if ($null -eq $models) {
    throw "Gateway models endpoint returned an empty response."
}
Write-Host "Gateway models endpoint OK"

$body = @{
    model = "hermes"
    messages = @(
        @{
            role = "system"
            content = "You are a concise test assistant."
        },
        @{
            role = "user"
            content = "Reply with OK."
        }
    )
    max_tokens = 32
    temperature = 0.2
} | ConvertTo-Json -Depth 6

$chat = Invoke-RestMethod `
    -Method Post `
    -Uri "$BaseUrl/v1/chat/completions" `
    -Headers $Headers `
    -ContentType "application/json" `
    -Body $body `
    -TimeoutSec 30

$content = $chat.choices[0].message.content
if ([string]::IsNullOrWhiteSpace($content)) {
    throw "Gateway chat endpoint did not return choices[0].message.content."
}

Write-Host "Gateway chat endpoint OK"
Write-Host "Assistant reply: $content"
