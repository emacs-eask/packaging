require "language/node"

class EaskCli < Formula
  desc "CLI for building, running, testing, and managing your Emacs Lisp dependencies"
  version "0.11.3"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "5cd29c927325fcb00436e0a4422ba9baf1f93feaaa8c033f3461b426729c3390"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
