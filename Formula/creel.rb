class Creel < Formula
  desc "Fast, vim-driven SQL TUI for SQLite, MySQL, and PostgreSQL"
  homepage "https://github.com/rsiota/creel"
  url "https://github.com/rsiota/creel/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "03bf8bfb16acfe5d49a597212750c4ae33a2ca0e970b431d1a763b4088c44bde"
  license "MIT"
  head "https://github.com/rsiota/creel.git", branch: "main"

  depends_on "go" => :build

  def install
    # Pure-Go (no CGO): build the creel CLI from cmd/creel.
    ldflags = "-s -w -X github.com/rsiota/creel/internal/version.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/creel"
  end

  test do
    assert_match "1", shell_output("#{bin}/creel -e 'SELECT 1' -database #{testpath}/t.db")
  end
end
