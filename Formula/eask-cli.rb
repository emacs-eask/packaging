class EaskCLI < Formula
  desc "A set of command-line tools to build Emacs packages"
  homepage "https://emacs-eask.github.io/"
  url "https://github.com/emacs-eask/cli/releases/download/0.8.3/eask_0.8.3_macos-x64.zip"
  sha256 ""
  license "GPLv3"
  version "0.8.3"

  def install
    bin.install "eask_0.8.3_macos-x64"
  end
end
