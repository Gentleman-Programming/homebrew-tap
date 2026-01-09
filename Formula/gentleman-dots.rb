class GentlemanDots < Formula
  desc "TUI installer for Gentleman.Dots terminal environment"
  homepage "https://github.com/Gentleman-Programming/Gentleman.Dots"
  version "2.5.1"
  url "https://github.com/Gentleman-Programming/Gentleman.Dots/archive/refs/tags/v#{version}.tar.gz"
  sha256 "45ba138840880e3affc13533fa29eae7b16f3c0b84067a5844e8aec0a918252f"
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
