class GentlemanDots < Formula
  desc "TUI installer for Gentleman.Dots terminal environment"
  homepage "https://github.com/Gentleman-Programming/Gentleman.Dots"
  url "https://github.com/Gentleman-Programming/Gentleman.Dots/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "354f941bd6aba2966f902f52053cdc099f9855ab808022deb582324a9f139806"
  license "MIT"
  version "2.1.0"

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
