require "language/node"

class EaskCli < Formula
  desc "A set of command-line tools to build Emacs packages"
  version "0.9.7"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "c455ab86f2ece9d7778c1ce62f45d52c115aa9a25ad063880b14910f169b7f1b"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
