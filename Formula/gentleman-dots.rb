class GentlemanDots < Formula
  desc "TUI installer for Gentleman.Dots terminal environment"
  homepage "https://github.com/Gentleman-Programming/Gentleman.Dots"
  version "2.4.4"
  url "https://github.com/Gentleman-Programming/Gentleman.Dots/archive/refs/tags/v#{version}.tar.gz"
  sha256 "ab96bfbf99532157b7da90df89cccb5b79a96bc52f6d1ad54e8ddea8722a1cc9"
  license "MIT"

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
