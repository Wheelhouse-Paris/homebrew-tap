class Wh < Formula
  desc "The operating infrastructure for autonomous agent factories"
  homepage "https://docs.wheelhouse.paris"
  version "0.1.0-alpha"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Wheelhouse-Paris/wheelhouse/releases/download/v0.1.0-alpha/wh-aarch64-apple-darwin"
      sha256 "c46d3e1ba69a0e10fa04653c7e7858e110ad03ae76006a0f605ed31896649d83"
    end
  end

  def install
    bin.install Dir["wh-*"].first => "wh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wh --version", 0)
  end
end
