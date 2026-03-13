class Wh < Formula
  desc "The operating infrastructure for autonomous agent factories"
  homepage "https://docs.wheelhouse.paris"
  version "0.1.1-alpha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Wheelhouse-Paris/wheelhouse/releases/download/v0.1.1-alpha/wh-aarch64-apple-darwin"
      sha256 "9499a32120dd35cebb30b19732719b310d0d17439209aaeba8debfa410b64894"
    end
  end

  def install
    bin.install Dir["wh-*"].first => "wh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wh --version", 0)
  end
end
