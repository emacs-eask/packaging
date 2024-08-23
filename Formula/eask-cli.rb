require "language/node"

class EaskCli < Formula
  desc "A set of command-line tools to build Emacs packages"
  version "0.9.0"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "d16af63009c6b38d8b65bc383139f9d7d2a70ba7f26d2def26574da9d37fe459"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
