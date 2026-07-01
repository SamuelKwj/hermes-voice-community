# Contributing

Thanks for your interest in Hermes Voice Community.

## Good Contribution Areas

- Documentation fixes
- Setup and startup issue reports
- Basic compatibility fixes
- Small, clear bug fixes
- Hermes Gateway integration examples

## Out of Scope

- Product-grade app packaging work
- Release workflow
- Advanced voice experience
- Large rewrites
- Features that do not fit the Basic community edition

## Checks Before Submitting

Run at least:

```powershell
python -c "import ast, pathlib; [ast.parse(p.read_text(encoding='utf-8-sig'), filename=str(p)) for p in pathlib.Path('.').rglob('*.py')]"
```

Also run your preferred secret scanner before opening a pull request.

## Pull Requests

- Keep one PR focused on one problem.
- Explain the purpose, impact, and verification.
- Do not commit local models, logs, virtual environments, or build artifacts.
