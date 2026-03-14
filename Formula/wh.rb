class Wh < Formula
  desc "The operating infrastructure for autonomous agent factories"
  homepage "https://docs.wheelhouse.paris"
  version "0.1.4-alpha"
  license "Apache-2.0"

  option "with-podman", "Install Podman container runtime (required to run agents)"

  depends_on "podman" if build.with?("podman")

  on_macos do
    on_arm do
      url "https://github.com/Wheelhouse-Paris/wheelhouse/releases/download/v0.1.4-alpha/wh-aarch64-apple-darwin.tar.gz"
      sha256 "d8c10b23190fd12348e21ee0b8a3b945037c7f89cd3afef06ea6287b982766e8"
    end
  end

  def install
    bin.install "wh"
    bin.install "wh-broker"
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
