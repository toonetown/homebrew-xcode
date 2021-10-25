require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkIos14 < XcSdkFormula
  version "14.5"
  ac_download_url "Xcode_12.5/Xcode_12.5.dmg"
  sha256 "21e63ab4d40174352ff45fa552288103a3da65d59f69237e4f9d1e6a4cc0632e"

  platforms %w[iPhoneOS iPhoneSimulator]
end
