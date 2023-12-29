require "language/node"

class EaskCli < Formula
  desc "A set of command-line tools to build Emacs packages"
  version "0.9.2"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "731d02178f9a364af7bcc59e400896ba0162db7b585959459d093a162f79e4c8"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
