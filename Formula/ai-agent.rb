class AiAgent < Formula
  desc "Inpoint local agent helper CLI"
  homepage "https://ai.inpoint.dev/local-agent"
  version "2.1.1"
  url "https://raw.githubusercontent.com/ilyastupin/homebrew-ai-agent/main/ai-agent-2.1.1.tar.gz"
  sha256 "468c27fdcfbdd6f6b5006f1c7c23b41bd7ab30f2f68a4c7db23078dbe8263c93"
  license :cannot_represent

  def install
    bin.install "bin/ai-agent"
  end

  test do
    output = shell_output("#{bin}/ai-agent --version")
    assert_match("ai-agent #{version}", output)
  end
end
