require 'pathname'
require Pathname(@path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)
AC_DOWNLOAD_URL = 'Xcode_8.1_beta_2/Xcode_8.1_beta_2.dmg'.freeze

cask 'xcode-beta' do
  version '8.1_beta_2'
  sha256 '6237b4edc5f6fabdb18905e55f820fe6211b422d1764e77b67b049bad850564a'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Xcode-beta'
  homepage DEV_HOMEPAGE

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
