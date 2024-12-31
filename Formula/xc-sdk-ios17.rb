require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkIos17 < XcSdkFormula
  version "17.4"
  ac_download_url "Xcode_15.4/Xcode_15.4.dmg"
  sha256 "dda7e2d87cde3c52e06b71959f6cea1412cf5c19c619b43e614d8f15aa87bec1"

  platforms %w[iPhoneOS iPhoneSimulator]
end
