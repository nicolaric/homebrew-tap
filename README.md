# Homebrew Tap for Minicode

This is a [Homebrew](https://brew.sh) tap for [minicode](https://github.com/nicolaric/minicode), a minimal local coding agent written in Zig.

## Installation

```bash
# Add this tap
brew tap nicolaric/tap

# Install minicode
brew install minicode
```

Or install directly without tapping:

```bash
brew install nicolaric/tap/minicode
```

## Requirements

- macOS or Linux
- [Zig](https://ziglang.org/) (installed automatically as build dependency)
- [curl](https://curl.se/) (installed automatically)
- [Ollama](https://ollama.com/) (optional, for AI functionality)

## Usage

Start Ollama first:
```bash
ollama serve
```

Then run minicode:
```bash
minicode
```

## Configuration

Set environment variables or create `~/.config/minicode/config.json`:

```json
{
  "model": "qwen3.6:27b-coding-nvfp4",
  "base_url": "http://127.0.0.1:11434"
}
```

## Documentation

See the [main repository](https://github.com/nicolaric/minicode) for full documentation.

## License

Same as minicode (see upstream repository).
