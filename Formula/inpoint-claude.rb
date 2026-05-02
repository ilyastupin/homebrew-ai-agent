class InpointClaude < Formula
  desc "Inpoint Claude Code agent — runs Claude Agent SDK sessions for ai.inpoint.dev"
  homepage "https://ai.inpoint.dev/claude"
  version "0.4.4"
  url "https://raw.githubusercontent.com/ilyastupin/homebrew-ai-agent/master/inpoint-claude-0.4.4.tar.gz"
  sha256 "5dbd245ed3985e7cf5c7b4fb91b50347ec57f39fee89c40190a2d5bc510c2f18"
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
