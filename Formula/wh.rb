class Wh < Formula
  desc "The operating infrastructure for autonomous agent factories"
  homepage "https://docs.wheelhouse.paris"
  version "0.1.8-alpha"
  license "Apache-2.0"

  option "with-podman", "Install Podman container runtime (required to run agents)"

  depends_on "podman" if build.with?("podman")

  on_macos do
    on_arm do
      url "https://github.com/Wheelhouse-Paris/wheelhouse/releases/download/v0.1.8-alpha/wh-aarch64-apple-darwin.tar.gz"
      sha256 "3cd394b14d8511240d474e43e30f91bcbb57316fc7eee9eb802f5eff182a422d"
    end
  end

  def install
    bin.install "wh"
    bin.install "wh-broker"
    bin.install "wh-telegram"
  end

  def caveats
    unless build.with?("podman")
      <<~EOS
        Podman is required to run agents. Install it with:
          brew install --formula podman
        Or reinstall wh with Podman included:
          brew reinstall wheelhouse-paris/tap/wh --with-podman
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wh --version", 0)
  end
end
