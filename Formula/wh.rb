class GithubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    @owner, @repo, @tag, @filename = url.match(
      %r{https://github\.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
    ).captures
  end

  def _fetch(url:, resolved_url:, timeout:)
    token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise CurlDownloadStrategyError, "Set HOMEBREW_GITHUB_API_TOKEN to install from a private repo." unless token

    curl_download(
      "--header", "Authorization: token #{token}",
      "--location",
      url,
      to: temporary_path,
      timeout: timeout,
    )
  end
end

class Wh < Formula
  desc "The operating infrastructure for autonomous agent factories"
  homepage "https://docs.wheelhouse.paris"
  version "0.1.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Wheelhouse-Paris/wheelhouse/releases/download/v0.1.0-alpha/wh-aarch64-apple-darwin",
          using: GithubPrivateRepositoryReleaseDownloadStrategy
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
