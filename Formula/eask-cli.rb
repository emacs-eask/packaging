require "language/node"

class EaskCli < Formula
  desc "A set of command-line tools to build Emacs packages"
  version "0.9.3"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "1f3d948d89544c7680f882c9dee72f121a500947a42aa14b785ac949f729a3d0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
