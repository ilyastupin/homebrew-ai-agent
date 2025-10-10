class AiAgent < Formula
  desc "Inpoint local agent helper CLI"
  homepage "https://ai.inpoint.dev/local-agent"
  version "2.1.1"
  url "https://raw.githubusercontent.com/ilyastupin/homebrew-ai-agent/master/ai-agent-2.1.1.tar.gz"
  sha256 "3d33411d30d0f38b9306d57a6cce6db855fc8191cdf80aeab9239bbd2251c873"
  license :cannot_represent

  def install
    bin.install "bin/ai-agent"
  end

  test do
    output = shell_output("#{bin}/ai-agent --version")
    assert_match("ai-agent #{version}", output)
  end
end
