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
  version "0.9.0"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG["host_os"]
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jswidler/lockgit/releases/download/v0.9.0/lockgit_0.9.0_darwin_amd64.zip"
      sha256 "7a190d68711f5e305a575ca65f6e693be7c96888300a4e47c75a711192aef307"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.9.0/lockgit_0.9.0_linux_amd64.tar.gz"
      sha256 "92f60f3bd4fbbe53c33b114190b96c13bb5831a201a9654793f91e3dfba4ed68"
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
      url "https://github.com/jswidler/lockgit/releases/download/v0.9.0/lockgit_0.9.0_darwin_386.zip"
      sha256 "e0d98d6d9f4ed65fef944cb6c86c4f7f10d047cc9b613f1780615adb7cb89f1a"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.9.0/lockgit_0.9.0_linux_386.tar.gz"
      sha256 "d56d07a2c2e2a2d4529ba5c8c9fbb8c74180557606497d4ef98f9a3bdb60a2cf"
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
