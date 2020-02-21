require 'pathname'
require Pathname(@path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)
AC_DOWNLOAD_URL = 'Xcode_10.3-slimmed.dmg'.freeze

cask 'xcode@10.3' do
  version '10.3'
  sha256 'f178750e48cdf2f7c0ff5116b2483263056665bd749b2521d2ae430e79dbf662'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Xcode'
  homepage DEV_HOMEPAGE

  app 'Xcode.app', target: "Xcode-#{version}.app"
end
