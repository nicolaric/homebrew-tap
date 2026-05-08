class Minicode < Formula
  desc "Minimal local coding agent with terminal UI and Ollama integration"
  homepage "https://github.com/nicolaric/minicode"
  url "https://github.com/nicolaric/minicode/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "b5cea8c75e01a3d84562aa6a439d7a1d56aac04f1b089155c69c7eb4ee386108"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e2cedc3ba9d486d7bea2663f398af5ffbd5b97e1ce91e5d5fdaaac21fc020d52"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0f088e99cdbb74244056da0bc91e87af4c7c55ce31c7cd5a4b78842be46b1ce4"
  end

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
    assert_predicate bin/"minicode", :exist?
    assert_predicate bin/"minicode", :executable?

    # Test version output if available
    # system "#{bin}/minicode", "--version"

    # Basic help test
    # system "#{bin}/minicode", "--help"
  end

end


