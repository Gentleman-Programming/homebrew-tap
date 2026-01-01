class GentlemanDots < Formula
  desc "TUI installer for Gentleman.Dots terminal environment"
  homepage "https://github.com/Gentleman-Programming/Gentleman.Dots"
  url "https://github.com/Gentleman-Programming/Gentleman.Dots/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "8a56fd3f64dd8a984bf269d85ba8de33aab33ef44a93a7feb17ade4785d54a75"
  license "MIT"
  version "2.2.0"

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
