require 'pathname'
require Pathname(path).realpath.dirname.join('../lib', 'xcode-common')
AC_DOWNLOAD_URL = 'Graphics_Tools_for_Xcode_7.2/Graphics_Tools_for_Xcode_7.2.dmg'.freeze

cask 'icon-composer' do
  version '2.5'
  sha256 'ac835dde82c605b6602ca0fd117b51402a8b307f746fab281f93d89b6c9b24c9'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Icon Composer'
  homepage DEV_HOMEPAGE
  license :commercial

  app 'Icon Composer.app', target: 'Developer/Icon Composer.app'

  caveats xcode_caveats(AC_DOWNLOAD_URL)
end
