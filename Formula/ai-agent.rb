class AiAgent < Formula
  desc "Inpoint local agent helper CLI"
  homepage "https://ai.inpoint.dev/local-agent"
  version "2.1.1"
  url "https://raw.githubusercontent.com/ilyastupin/homebrew-ai-agent/main/ai-agent-2.1.1.tar.gz"
  sha256 "80fc95a2b46ef29ffe835b0a680158b5cd00511262e199e411681d2d9a8510f6"
  license :cannot_represent

  def install
    bin.install "bin/ai-agent"
  end

  test do
    output = shell_output("#{bin}/ai-agent --version")
    assert_match("ai-agent #{version}", output)
  end
end
