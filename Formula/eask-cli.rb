require "language/node"

class EaskCli < Formula
  desc "CLI for building, running, testing, and managing your Emacs Lisp dependencies"
  version "0.11.2"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "ebf1c0085777aa1e9966d6239931e17588a3c6a79facbf1c25f8289c2d77a608"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
