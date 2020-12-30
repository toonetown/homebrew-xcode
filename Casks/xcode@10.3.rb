require 'pathname'
require Pathname(@path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)
AC_DOWNLOAD_URL = 'Xcode_10.3-patched.dmg'.freeze

cask 'xcode@10.3' do
  version '10.3'
  sha256 'd237dee929d6a88cb3758317a3bb8d3b4605cfcda01df3745201e02c313e337c'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Xcode'
  homepage DEV_HOMEPAGE

  app 'Xcode.app', target: "Xcode-#{version}.app"
end
