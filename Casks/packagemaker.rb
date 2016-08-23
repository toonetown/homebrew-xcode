require 'pathname'
require Pathname(path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)
AC_DOWNLOAD_URL = 'auxiliary_tools_for_xcode__late_july_2012/xcode44auxtools6938114a.dmg'.freeze

cask 'packagemaker' do
  version '3.0.6'
  sha256 '57eb1ec7f13cc36b56ee517f564fa2ad5cc2ab337b90aecbba5d1dbd08a7d203'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'PackageMaker'
  homepage DEV_HOMEPAGE
  license :commercial

  app 'PackageMaker.app', target: 'Developer/PackageMaker.app'

  caveats xcode_caveats(AC_DOWNLOAD_URL)
end
