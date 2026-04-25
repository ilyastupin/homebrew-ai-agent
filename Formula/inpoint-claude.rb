class InpointClaude < Formula
  desc "Inpoint Claude Code agent — runs Claude Agent SDK sessions for ai.inpoint.dev"
  homepage "https://ai.inpoint.dev/claude"
  version "0.2.0"
  url "https://raw.githubusercontent.com/ilyastupin/homebrew-ai-agent/master/inpoint-claude-0.2.0.tar.gz"
  sha256 "b233eb702b108bac8dab59d3944f1d32e8b45d4122187c9dbee41eb44a6c3049"
  license :cannot_represent

  depends_on "node"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system "npm", "install", "--omit=dev", "--no-fund", "--no-audit"
    end
    (bin/"inpoint-claude").write <<~SH
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/index.js" "$@"
    SH
    chmod 0755, bin/"inpoint-claude"
  end

  def caveats
    <<~EOS
      Run the agent in foreground:
        inpoint-claude --server https://ai.inpoint.dev

      The token is printed at startup. Paste it into the "Add agent token"
      field at https://ai.inpoint.dev/claude. Server URL is saved to
      ~/.claude-terminal-proxy/agent.json after the first run.
    EOS
  end

  test do
    assert_predicate bin/"inpoint-claude", :executable?
  end
end
