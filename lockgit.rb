# Install the latest release version of lockgit using brew.
# brew install jswidler/tap/lockgit

# Dev note: Build new version and upload a draft with the artifacts to GitHub release page with:

# export XCBUILD=true
# export VERSION=X.Y.Z
# make clean build
# fgo --pkg build build --draft $VERSION

require "rbconfig"
class Lockgit < Formula
  desc "a CLI tool for storing encrypted secrets in a git repo"
  homepage "https://github.com/jswidler/lockgit"
  version "0.8.0"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG["host_os"]
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jswidler/lockgit/releases/download/v0.8.0/lockgit_0.8.0_darwin_amd64.zip"
      sha256 "67e2a63fa3e5f05dba3485d6edc0ec7a21b197d648d7cf6d798c3840fc232e0a"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.8.0/lockgit_0.8.0_linux_amd64.tar.gz"
      sha256 "ac86163e149b02d8dfafd0a66a92e2f833330d890463eefcf350a19b94907b0b"
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
      url "https://github.com/jswidler/lockgit/releases/download/v0.8.0/lockgit_0.8.0_darwin_386.zip"
      sha256 "cdfd0f0a31db3f217edeedf5da646faaf97b461970d5d5e70d4e720d373e7c9e"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.8.0/lockgit_0.8.0_linux_386.tar.gz"
      sha256 "a838221a7140499cbc2603ef9cbba4c48b76934b9185eef4fcfc88e3e4b6aa44"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  end

  def install
    bin.install "lockgit"
    system "#{bin}/lockgit", "completion", "-o", "completions.bash"
    system "#{bin}/lockgit", "completion", "-z", "-o", "completions.zsh"
    bash_completion.install "completions.bash" => "lockgit"
    zsh_completion.install "completions.zsh" => "_lockgit"
  end

  test do
    system "#{bin}/lockgit"
  end
end
