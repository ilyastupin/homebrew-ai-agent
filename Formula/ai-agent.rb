class AiAgent < Formula
  desc "Inpoint local agent helper CLI"
  homepage "https://ai.inpoint.dev/local-agent"
  version "2.1.1"
  url "https://raw.githubusercontent.com/ilyastupin/homebrew-ai-agent/main/ai-agent-2.1.1.tar.gz"
  sha256 "58f599c5b6de6ee980ead447edb0889b6a4d45ca485a86306d9eb7ff46fc9c9a"
  license :cannot_represent

  def install
    bin.install "bin/ai-agent"
  end

  test do
    output = shell_output("#{bin}/ai-agent --version")
    assert_match("ai-agent #{version}", output)
  end
end
