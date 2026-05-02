class InpointClaude < Formula
  desc "Inpoint Claude Code agent — runs Claude Agent SDK sessions for ai.inpoint.dev"
  homepage "https://ai.inpoint.dev/claude"
  version "0.4.1"
  url "https://raw.githubusercontent.com/ilyastupin/homebrew-ai-agent/master/inpoint-claude-0.4.1.tar.gz"
  sha256 "01ee3832d3e06ff5dafe0cc75a4142da23a9bf9bdf85446c6501c416b5f4571a"
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
      First run (sets and saves the server URL):
        inpoint-claude --server https://ai.inpoint.dev

      After that just:
        inpoint-claude

      The agent prints its tokens at startup. Paste the share token into
      the "Paste agent token…" field at https://ai.inpoint.dev/claude
      and click Add. Config is stored in ~/.claude-terminal-proxy/agent.json.
    EOS
  end

  test do
    assert_predicate bin/"inpoint-claude", :executable?
  end
end
