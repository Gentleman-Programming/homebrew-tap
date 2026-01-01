class GentlemanDots < Formula
  desc "TUI installer for Gentleman.Dots terminal environment"
  homepage "https://github.com/Gentleman-Programming/Gentleman.Dots"
  url "https://github.com/Gentleman-Programming/Gentleman.Dots/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "8963d2c124d6ef2157bbc08dd71189976f4a938135f8c62dd0c02103fe0f1622"
  license "MIT"
  version "2.3.0"

  depends_on "go" => :build

  def install
    cd "installer" do
      system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "-o", bin/"gentleman.dots", "./cmd/gentleman-installer"
    end
  end

  test do
    assert_match "gentleman.dots v#{version}", shell_output("#{bin}/gentleman.dots --version")
  end
end
