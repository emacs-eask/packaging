require "language/node"

class EaskCli < Formula
  desc "CLI for building, running, testing, and managing your Emacs Lisp dependencies"
  version "0.11.4"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "abb681994e64a65adafcf4c2a05e201e7389db9b4d6f8893221e9443251e7eb7"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
