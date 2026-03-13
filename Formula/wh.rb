class Wh < Formula
  desc "The operating infrastructure for autonomous agent factories"
  homepage "https://docs.wheelhouse.paris"
  version "0.1.0-alpha.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Wheelhouse-Paris/wheelhouse/releases/download/v0.1.0-alpha.4/wh-aarch64-apple-darwin"
      sha256 "abd32242360b8d54318ea15b050789900fe30a4cd3cac653fc0afebb979a2a8f"
    end
  end

  def install
    bin.install Dir["wh-*"].first => "wh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wh --version", 0)
  end
end
