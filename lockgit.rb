# Install the latest release version of lockgit using brew.
# brew install jswidler/tap/lockgit

# Dev note: Build new version and upload a draft with the artifacts to GitHub release page with:
# fgo --pkg build build --draft $(VERSION)

require "rbconfig"
class Lockgit < Formula
  desc "a CLI tool for storing encrypted secrets in a git repo"
  homepage "https://github.com/jswidler/lockgit"
  version "0.6.0"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG["host_os"]
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jswidler/lockgit/releases/download/v0.6.0/lockgit_0.6.0_darwin_amd64.zip"
      sha256 "23005f0bfa2aec9c6035d0395a1c7057ceb3c5effdea4a9fc7c68d4b3b63e5c4"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.6.0/lockgit_0.6.0_linux_amd64.tar.gz"
      sha256 "1ee21f14b025150fddd1fe6b916b2bda8d9dbb379303a14c32f4151e743b84a0"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  else
    case RbConfig::CONFIG["host_os"]
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jswidler/lockgit/releases/download/v0.6.0/lockgit_0.6.0_darwin_386.zip"
      sha256 "1e2a1cfd37603ce707ef396c784472a9d1cc7673fe3edb9320bfc8436417dbe2"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.6.0/lockgit_0.6.0_linux_386.tar.gz"
      sha256 "ee9e36c73f2823c7e68dfa8513dab0a8244213d0e3838e707b717a66bf030317"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  end

  def install
    bin.install "lockgit"
  end

  test do
    system "#{bin}/lockgit"
  end
end
