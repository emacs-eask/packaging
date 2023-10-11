require "language/node"

class EaskCli < Formula
  desc "A set of command-line tools to build Emacs packages"
  version "0.8.3"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "d63d7ab8b8f2c640d20c4cdba986a7b7595ca9972753659bfd6a511387f1b122"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
