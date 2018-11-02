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
  version "0.7.0"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG["host_os"]
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jswidler/lockgit/releases/download/v0.7.0/lockgit_0.7.0_darwin_amd64.zip"
      sha256 "dfe4d3a313b980b35f9aa87350fe432d2a96d3a24dcf7e6b02751e37d408e4f4"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.7.0/lockgit_0.7.0_linux_amd64.tar.gz"
      sha256 "908df79161051c08072c4525f56ef9401548656be4ceeeb499921dd6a8792945"
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
      url "https://github.com/jswidler/lockgit/releases/download/v0.7.0/lockgit_0.7.0_darwin_386.zip"
      sha256 "0de75a94fdae5bc120a2eff8d5577dd0dec1c7311f64c44c755adffad24e8313"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.7.0/lockgit_0.7.0_linux_386.tar.gz"
      sha256 "3c7b9e89655a6594f9209d2b8900c4580f47d6408621b030c17310f5d3e12b24"
    when /solaris|bsd/
      :unix
    else
      :unknown
    end
  end

  def install
    bin.install "lockgit"
    system "#{bin}/lockgit", "completion", "-o", "completions.bash"
    bash_completion.install "completions.bash" => "lockgit"
  end

  test do
    system "#{bin}/lockgit"
  end
end
