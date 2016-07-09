require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula")

class XcSdkIos5 < XcSdkFormula
  version "5.1"
  ac_download_url "xcode_4.4.1/xcode_4.4.1_6938145.dmg"
  sha256 "4f41f8331350363cc1a1345d1ecacfc95ac0bb38ecfb60734a8ed0c04df9810f"

  platforms %w[iPhoneOS iPhoneSimulator]
end
