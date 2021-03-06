require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkIos13 < XcSdkFormula
  version "13.7"
  ac_download_url "Xcode_11.7/Xcode_11.7.dmg"
  sha256 "7adf35923e2292f8688323c8f5dad3b42acb631d3957e032ecb2b2a45cd0c949"

  platforms %w[iPhoneOS iPhoneSimulator]
end
