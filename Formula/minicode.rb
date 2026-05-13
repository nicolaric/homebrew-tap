class Minicode < Formula
  desc "Minimal local coding agent with terminal UI and Ollama integration"
  homepage "https://github.com/nicolaric/minicode"
  url "https://github.com/nicolaric/minicode/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "4d2a3557233961ea418ab2518b91e0ef1196830dcc645cd9278c731271bd59ae"
  license "MIT"

  depends_on "zig" => :build
  depends_on "curl"
  depends_on "ollama" => :optional

  def install
    # Build the project
    system "zig", "build", "-Doptimize=ReleaseFast"

    # Install the binary
    bin.install "zig-out/bin/minicode"
  end

  def caveats
    <<~EOS
      minicode requires Ollama to be running for AI functionality.

      To start Ollama:
        ollama serve

      Then pull a coding model:
        ollama pull qwen3.6:27b-coding-nvfp4

      Environment variables (optional):
        OLLAMA_BASE_URL=http://127.0.0.1:11434
        OLLAMA_MODEL=qwen3.6:27b-coding-nvfp4

      Config file location: ~/.config/minicode/config.json
    EOS
  end

  test do
    # Test that the binary exists and is executable
    assert_path_exists bin/"minicode"
    assert_predicate bin/"minicode", :executable?

    # Test version output if available
    # system "#{bin}/minicode", "--version"

    # Basic help test
    # system "#{bin}/minicode", "--help"
  end
end
