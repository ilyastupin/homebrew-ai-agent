class AiAgent < Formula
  desc "Inpoint local agent helper CLI"
  homepage "https://ai.inpoint.dev/local-agent"
  version "2.1.1"
  url "https://ai.inpoint.dev/ai-agent-2.1.1.tar.gz"
  sha256 "28f030b62236b5d33e7a9b4eba87cdf3ddc2db1e9ab8eb7f0c9c51f5afe74171"
  license :cannot_represent

  def install
    bin.install "bin/ai-agent"
  end

  test do
    output = shell_output("#{bin}/ai-agent --version")
    assert_match("ai-agent #{version}", output)
  end
end
