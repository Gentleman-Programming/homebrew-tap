class GentleCreation < Formula
  desc "AI-powered content creation workflow for developers in your terminal"
  homepage "https://github.com/Gentleman-Programming/gentle-creation"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Gentleman-Programming/gentle-creation/releases/download/v#{version}/gentle-creation_#{version}_darwin_arm64.tar.gz"
      sha256 "027627b3a6ddfd1bdf5280c5ccf3d49470098305eb1c7cd25fb3ee8a3970e769"
    end
    on_intel do
      url "https://github.com/Gentleman-Programming/gentle-creation/releases/download/v#{version}/gentle-creation_#{version}_darwin_amd64.tar.gz"
      sha256 "3ea9d127f9251c0cf49cab9bc78ec41633649703a8651b1133f7f74e50342b95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Gentleman-Programming/gentle-creation/releases/download/v#{version}/gentle-creation_#{version}_linux_arm64.tar.gz"
      sha256 "9ca567b469889a5bd07d7004f0cd78b7f1660592f43d62d53b8e01423e079e5e"
    end
    on_intel do
      url "https://github.com/Gentleman-Programming/gentle-creation/releases/download/v#{version}/gentle-creation_#{version}_linux_amd64.tar.gz"
      sha256 "614c88521986afee53bf49a24f698088ff7fd1a3fa4b207d0e33bcfbceb56b0e"
    end
  end

  def install
    bin.install "gentle-creation"
  end

  test do
    system "#{bin}/gentle-creation", "--help"
  end
end
