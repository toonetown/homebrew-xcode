require 'pathname'
require Pathname(@path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)
AC_DOWNLOAD_URL = 'Xcode_13.1/Xcode_13.1.dmg'.freeze

cask 'xcode' do
  version '13.1'
  sha256 '5fd393455c820f597d23f3830192ccef1848785835baf6aff273cd6a1bbb2a1e'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Xcode'
  homepage DEV_HOMEPAGE

  depends_on formula: 'toonetown/xcode/link-sdks'

  def depends_on
    if appdir.join('Xcode.app').exist?
      raise Hbc::CaskError, 'The appstore version of Xcode is already installed'
    end

    super
  end

  app 'Xcode.app'

  postflight do
    app_location = appdir.join(@cask.artifacts.select { |a| a.is_a?(Artifact::App) }.first.summarize).to_s

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

  caveats xcode_xip_caveats(AC_DOWNLOAD_URL, artifacts.select { |a| a.is_a?(Artifact::App) }.first.summarize)
end
