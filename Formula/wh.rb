class Wh < Formula
  desc "The operating infrastructure for autonomous agent factories"
  homepage "https://docs.wheelhouse.paris"
  version "0.1.0-alpha.8"
  license "Apache-2.0"

  option "with-podman", "Install Podman container runtime (required to run agents)"

  depends_on "podman" if build.with?("podman")

  on_macos do
    on_arm do
      url "https://github.com/Wheelhouse-Paris/wheelhouse/releases/download/v0.1.0-alpha.8/wh-aarch64-apple-darwin"
      sha256 "762d681cb6b1bd205b4c43b88e7a8a225ac6423867e387a78534d00b88065aab"
    end
  end

  def install
    bin.install Dir["wh-*"].first => "wh"
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
