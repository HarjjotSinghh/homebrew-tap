class Reinstate < Formula
  desc "Continue supported coding-agent sessions across configured devices."
  homepage "https://reinstate.dev"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HarjjotSinghh/reinstate/releases/download/v0.2.0/reinstate_0.2.0_darwin_arm64.tar.gz"
      sha256 "edc1d2257ad4309f4be10b0c46bd711dc6a1ac3d9ce5ccfc332a6274e092943b"
    else
      url "https://github.com/HarjjotSinghh/reinstate/releases/download/v0.2.0/reinstate_0.2.0_darwin_amd64.tar.gz"
      sha256 "29798402751b58eb7ec62aa68abe4a605aef37a8b8eb86a0d3c374bf15d16d81"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/HarjjotSinghh/reinstate/releases/download/v0.2.0/reinstate_0.2.0_linux_arm64.tar.gz"
      sha256 "e06709f95e623bfcf0f5bd49916dad2e96353dc5bddef00ae06094cffacb13c3"
    else
      url "https://github.com/HarjjotSinghh/reinstate/releases/download/v0.2.0/reinstate_0.2.0_linux_amd64.tar.gz"
      sha256 "0e7f6eadb56b8ced89cc60d3bf6c97e1105ee0c838e7d5ecdba9b58eefd7761e"
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
