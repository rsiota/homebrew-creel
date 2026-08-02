class Creel < Formula
  desc "Fast, vim-driven SQL TUI for SQLite, MySQL, and PostgreSQL"
  homepage "https://github.com/rsiota/creel"
  url "https://github.com/rsiota/creel/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7098421ecfb0a0599bcee64045986cd1b56af29aedfab24794a08e1aa518751c"
  license "MIT"
  head "https://github.com/rsiota/creel.git", branch: "main"

  depends_on "go" => :build

  def install
    # Pure-Go (no CGO): build the creel CLI from cmd/creel.
    system "go", "build", *std_go_args, "./cmd/creel"
  end

  test do
    assert_match "1", shell_output("#{bin}/creel -e 'SELECT 1' -database #{testpath}/t.db")
  end
end
