class GentlemanDots < Formula
  desc "TUI installer for Gentleman.Dots terminal environment"
  homepage "https://github.com/Gentleman-Programming/Gentleman.Dots"
  url "https://github.com/Gentleman-Programming/Gentleman.Dots/archive/refs/tags/v2.1.2.tar.gz"
  sha256 "a1957b69a5e5c58bf4b36f3a25c2e4bd52b8db627d4362fb446f206607190820"
  license "MIT"
  version "2.1.2"

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
