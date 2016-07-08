require 'pathname'
require Pathname(path).realpath.dirname.join('../lib', 'xcode-common')
AC_DOWNLOAD_URL = 'Xcode_7.3.1/Xcode_7.3.1.dmg'.freeze

cask 'xcode' do
  version '7.3.1'
  sha256 'bb0dedf613e86ecb46ced945913fa5069ab716a0ade1035e239d70dee0b2de1b'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Xcode'
  homepage DEV_HOMEPAGE
  license :commercial

  depends_on formula: 'toonetown/xcode/link-sdks'

  def depends_on
    if appdir.join('Xcode.app').exist?
      raise Hbc::CaskError, 'The appstore version of Xcode is already installed'
    end
    super
  end

  app 'Xcode.app'

  postflight do
    # Select this version of xcode
    ohai 'Selecting default version of Xcode (may require sudo)'
    system '/usr/bin/sudo', '-E', '--', '/usr/bin/xcode-select', '--switch', appdir.join('Xcode.app')

    ohai 'Agreeing to license'
    system '/usr/bin/sudo', '-E', '--', '/usr/bin/xcodebuild', '-license'

    ohai 'Relinking SDKs'
    system 'link-sdks', '--xcodePath', appdir.join('Xcode.app').to_s
  end

  uninstall_postflight do
    # Reset the version of xcode
    ohai 'Resetting default version of Xcode (may require sudo)'
    system '/usr/bin/sudo', '-E', '--', '/usr/bin/xcode-select', '--reset'
  end

  caveats xcode_caveats(AC_DOWNLOAD_URL)
end
