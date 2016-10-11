require 'pathname'
require Pathname(@path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)
AC_DOWNLOAD_URL = 'signaturecheck/signaturecheck.dmg'.freeze

cask 'check-signature' do
  version '1.0'
  sha256 '4f269b302fc8106406fe539af133866425a798fcd89f573be08ccc68fdfdd161'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Signature Check'
  homepage DEV_HOMEPAGE

  binary 'check-signature'

  caveats xcode_caveats(AC_DOWNLOAD_URL)
end
