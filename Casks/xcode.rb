require 'pathname'
require Pathname(@path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)
AC_DOWNLOAD_URL = 'Xcode_14.3/Xcode_14.3.dmg'.freeze

cask 'xcode' do
  version '14.3'
  sha256 '869ae7f0ac72f112b5c6739dac4fef21a198bd892f7d92d3268f250618501f2e'

  url xcode_url(AC_DOWNLOAD_URL)
  name 'Xcode'
  homepage DEV_HOMEPAGE

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
  end

  uninstall_postflight do
    # Reset the version of xcode
    ohai 'Resetting default version of Xcode (may require sudo)'
    system '/usr/bin/sudo', '-E', '--', '/usr/bin/xcode-select', '--reset'
  end

  caveats xcode_xip_caveats(AC_DOWNLOAD_URL, artifacts.select { |a| a.is_a?(Artifact::App) }.first.summarize)
end
