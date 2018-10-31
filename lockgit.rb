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
  version "0.6.1"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG["host_os"]
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jswidler/lockgit/releases/download/v0.6.1/lockgit_0.6.1_darwin_amd64.zip"
      sha256 "b5fd8315ff69e7ca1bdd7c6d33f81acc2bffea439e1cdf35f5549b749f261126"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.6.1/lockgit_0.6.1_linux_amd64.tar.gz"
      sha256 "c9988e6536a06d423d261beb0cd69110b2eceea86ea459257db7a98fcaa96524"
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
      url "https://github.com/jswidler/lockgit/releases/download/v0.6.1/lockgit_0.6.1_darwin_386.zip"
      sha256 "8239e9d62c4390a357e055a825f8ebc33b99794cb4545531b0ff108f71918b30"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.6.1/lockgit_0.6.1_linux_386.tar.gz"
      sha256 "2c75f4e42b17737ce22fc2feb5814bb166f7039d94df921963486ad7efbc8e1b"
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
