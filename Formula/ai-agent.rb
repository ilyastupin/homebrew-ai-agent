class AiAgent < Formula
  desc "Inpoint local agent helper CLI"
  homepage "https://ai.inpoint.dev/local-agent"
  version "2.1.1"
  url "https://raw.githubusercontent.com/ilyastupin/homebrew-ai-agent/master/ai-agent-2.1.1.tar.gz"
  sha256 "7a765b7526255cbbd5822455b283f887c4925b3b62bf0a5eb564c27327d265fe"
  license :cannot_represent

  def install
    bin.install "bin/ai-agent"
  end

  test do
    output = shell_output("#{bin}/ai-agent --version")
    assert_match("ai-agent #{version}", output)
  end
end
