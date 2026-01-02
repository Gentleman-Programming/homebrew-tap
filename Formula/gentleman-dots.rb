class GentlemanDots < Formula
  desc "TUI installer for Gentleman.Dots terminal environment"
  homepage "https://github.com/Gentleman-Programming/Gentleman.Dots"
  url "https://github.com/Gentleman-Programming/Gentleman.Dots/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "51482e1bf968a64db84d6d17a00794affbf4fc02be463e78728a56388a373119"
  license "MIT"
  version "2.4.0"

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
