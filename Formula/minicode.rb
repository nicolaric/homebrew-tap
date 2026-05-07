class Minicode < Formula
  desc "Minimal local coding agent with terminal UI and Ollama integration"
  homepage "https://github.com/nicolaric/minicode"
  url "https://github.com/nicolaric/minicode/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "fa0e0882100b3d50cd828e8fd4627e9cca26aa8c52d526164cc48ae37a093e5d"
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
    assert_predicate bin/"minicode", :exist?
    assert_predicate bin/"minicode", :executable?
    
    # Test version output if available
    # system "#{bin}/minicode", "--version"
  end
end
