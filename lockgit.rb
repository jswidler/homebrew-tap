require "rbconfig"
class Lockgit < Formula
  desc "a CLI tool for storing encrypted secrets in a git repo"
  homepage "https://github.com/jswidler/lockgit"
  version "0.5.1"

  if Hardware::CPU.is_64_bit?
    case RbConfig::CONFIG["host_os"]
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      :windows
    when /darwin|mac os/
      url "https://github.com/jswidler/lockgit/releases/download/v0.5.1/lockgit_0.5.1_darwin_amd64.zip"
      sha256 "bb54a5db8e22428496ea07dd504050022b86714d9441a81c203edf9d663316f3"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.5.1/lockgit_0.5.1_linux_amd64.tar.gz"
      sha256 "41e5620c8266fa359aed29bd64739028315977d7165b5cf7963001342b34c01c"
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
      url "https://github.com/jswidler/lockgit/releases/download/v0.5.1/lockgit_0.5.1_darwin_386.zip"
      sha256 "07a898d7bb41b6740d62187e6c74105b0e634ad65c70b897959ec01f549942d1"
    when /linux/
      url "https://github.com/jswidler/lockgit/releases/download/v0.5.1/lockgit_0.5.1_linux_386.tar.gz"
      sha256 "2c4cd974c1282cef384e82db9bd3aa13bd91c5604a458435f2ff5336a873a9c0"
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
