class GentlemanDots < Formula
  desc "TUI installer for Gentleman.Dots terminal environment"
  homepage "https://github.com/Gentleman-Programming/Gentleman.Dots"
  version "2.5.0"
  url "https://github.com/Gentleman-Programming/Gentleman.Dots/archive/refs/tags/v#{version}.tar.gz"
  sha256 "348cc3289893f38a1f5508c1882845abed6ab44d6dee9ad46b7035f3981bae97"
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
