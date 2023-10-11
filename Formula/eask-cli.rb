cask "eask-cli" do
  arch arm: "arm64", intel: "x64"
  sha256 arm:   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
         intel: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  name "Eask CLI"
  desc "A set of command-line tools to build Emacs packages"
  version "0.8.3"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://github.com/emacs-eask/cli/releases/download/#{version}/eask_#{version}_macos-#{arch}.zip"
end
