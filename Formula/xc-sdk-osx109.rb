require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula")

class XcSdkOsx109 < XcSdkFormula
  version "10.9"
  ac_download_url "Xcode_6.4/Xcode_6.4.dmg"
  sha256 "fc25d75f23d82084dd740d7e29d0e5adea96dd600d1e19bc86408c133d1edf66"

  platforms %w[MacOSX]
end
