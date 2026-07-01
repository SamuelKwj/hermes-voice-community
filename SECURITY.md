# Security

## Sensitive Data

Do not commit:

- API keys
- Local credentials
- Private Gateway URLs
- Logs containing personal data
- Local model cache files
- Build artifacts

## Reporting Security Issues

Do not open a public issue for security problems. Report privately through the repository owner's public contact method first.

## Default Security Posture

- The community edition does not include a built-in `API_SERVER_KEY`.
- The local backend listens on `127.0.0.1` by default.
- Do not expose the local backend to the public internet.
