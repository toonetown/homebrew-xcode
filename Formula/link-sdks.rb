require "formula"

class LinkSdks < Formula
  version "2"

  url "https://gist.github.com/befe043f8ee85c67ad70.git", :revision => "c31e23f0"
  head "https://gist.github.com/befe043f8ee85c67ad70.git", :branch => "master"
  homepage "https://gist.github.com/befe043f8ee85c67ad70"

  skip_clean "bin"

  def install
    chmod 0755, "link-sdks"
    bin.install "link-sdks"
  end
end
