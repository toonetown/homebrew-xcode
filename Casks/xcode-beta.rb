require 'pathname'
require Pathname(path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)
AC_DOWNLOAD_URL = 'Xcode_8.1_beta/Xcode_8.1_beta.dmg'.freeze

cask 'xcode-beta' do
  version '8.1_beta'
  sha256 'ea3cdf7ead28ecbc79453c058809dbacbce89e8b87934d356ff09493020637bd'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Xcode-beta'
  homepage DEV_HOMEPAGE
  license :commercial

  depends_on formula: 'toonetown/xcode/link-sdks'

  app 'Xcode-beta.app'

  postflight do
    app_location = appdir.join(@cask.artifacts[:app].first.first).to_s
    
    # Select this version of xcode
    ohai 'Selecting default version of Xcode (may require sudo)'
    system '/usr/bin/sudo', '-E', '--', '/usr/bin/xcode-select', '--switch', app_location

    ohai 'Agreeing to license'
    system '/usr/bin/sudo', '-E', '--', '/usr/bin/xcodebuild', '-license', 'accept'

    ohai 'Relinking SDKs'
    system 'link-sdks', '--xcodePath', app_location
  end

  uninstall_postflight do
    # Reset the version of xcode
    ohai 'Resetting default version of Xcode (may require sudo)'
    system '/usr/bin/sudo', '-E', '--', '/usr/bin/xcode-select', '--reset'
  end

  caveats xcode_xip_caveats(AC_DOWNLOAD_URL, artifacts[:app].first.first)
end
