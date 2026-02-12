require "language/node"

class EaskCli < Formula
  desc "CLI for building, running, testing, and managing your Emacs Lisp dependencies"
  version "0.12.6"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "51ea82efd3dbae6cd9689f5850c8895a7e2dccf6d16b942372c9f86e1036d656"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
