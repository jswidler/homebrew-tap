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
  version "0.7.1"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG["host_os"]
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jswidler/lockgit/releases/download/v0.7.1/lockgit_0.7.1_darwin_amd64.zip"
      sha256 "599a1f2a2b8a8aa63cdbac055235e10259e570bc4bb25c4213487b3fa986bc65"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.7.1/lockgit_0.7.1_linux_amd64.tar.gz"
      sha256 "fec4f6a819d04d921f919edc99a228a3b5edfb1ac1bcacc9d6c73438376ae605"
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
      url "https://github.com/jswidler/lockgit/releases/download/v0.7.1/lockgit_0.7.1_darwin_386.zip"
      sha256 "730eb1a7756ea39e16d96f30d0c174bf144c0cacb38ef19d995c2e5790373ce6"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.7.1/lockgit_0.7.1_linux_386.tar.gz"
      sha256 "d00ea5f6cc98c9dbbae1543d649851fa8651cee608675aab6dc3a90315b72c4b"
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
