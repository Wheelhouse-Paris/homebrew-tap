class Wh < Formula
  desc "The operating infrastructure for autonomous agent factories"
  homepage "https://docs.wheelhouse.paris"
  version "0.1.2-alpha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Wheelhouse-Paris/wheelhouse/releases/download/v0.1.2-alpha/wh-aarch64-apple-darwin"
      sha256 "f083db2be5e316c8858f2179d9dfb0fca0b59ba031fc27483be64d19dd6a8353"
    end
  end

  def install
    bin.install Dir["wh-*"].first => "wh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wh --version", 0)
  end
end
