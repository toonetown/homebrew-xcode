require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkOsx1011 < XcSdkFormula
  version "10.11"
  ac_download_url "Xcode_7.3.1/Xcode_7.3.1.dmg"
  sha256 "bb0dedf613e86ecb46ced945913fa5069ab716a0ade1035e239d70dee0b2de1b"

  platforms %w[MacOSX]
end
