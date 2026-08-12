class Reinstate < Formula
  desc "Continue supported coding-agent sessions across configured devices."
  homepage "https://reinstate.dev"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HarjjotSinghh/reinstate/releases/download/v0.3.0/reinstate_0.3.0_darwin_arm64.tar.gz"
      sha256 "609d09ed5be32140ce74954efbe5be54416bdb47e4d4f8eaa7c4630b72e4b067"
    else
      url "https://github.com/HarjjotSinghh/reinstate/releases/download/v0.3.0/reinstate_0.3.0_darwin_amd64.tar.gz"
      sha256 "ff485d51cba808a75122055a9717976e2e8164e5cd9fc800ecc6b98d6e86a45e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/HarjjotSinghh/reinstate/releases/download/v0.3.0/reinstate_0.3.0_linux_arm64.tar.gz"
      sha256 "5794f56c89f9509d7e74b10da22f84a3aa04c598e27196afb554068fd0cb7745"
    else
      url "https://github.com/HarjjotSinghh/reinstate/releases/download/v0.3.0/reinstate_0.3.0_linux_amd64.tar.gz"
      sha256 "a679b743c4b10eaa509edcb074046d303b9bc0f4b35f79b4685029c163a0fe6f"
    end
  end

  def install
    bin.install "reinstate"
    bin.install_symlink "reinstate" => "rein"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rein version")
  end
end
