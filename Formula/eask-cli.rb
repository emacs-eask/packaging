require "language/node"

class EaskCli < Formula
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  name "Eask CLI"
  desc "A set of command-line tools to build Emacs packages"
  version "0.8.3"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
