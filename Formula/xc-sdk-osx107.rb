require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkOsx107 < XcSdkFormula
  version "10.7"
  ac_download_url "xcode_4.6.3/xcode4630916281a.dmg"
  sha256 "07c454db2e7b09c7607df33b2d1d7cd3b04cdd9dfcbf9719db0bd0b0e310b69f"

  platforms %w[MacOSX]
end
