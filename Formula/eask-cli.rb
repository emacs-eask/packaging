cask "eask-cli" do
  arch arm: "arm64", intel: "x64"
  sha256 ""

  name: "Eask CLI"
  desc "A set of command-line tools to build Emacs packages"
  version "0.8.3"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://github.com/emacs-eask/cli/releases/download/#{version}/eask_#{version}_macos-#{arch}.zip"
end
