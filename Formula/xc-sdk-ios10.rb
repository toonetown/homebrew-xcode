require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkIos10 < XcSdkFormula
  version "10.3"
  ac_download_url "Xcode_8.3.3/Xcode8.3.3.xip"
  sha256 "8ad7a4332c9a67ff7c96ff8e581fa95b73d465a3fbff96ed11dc339154a8b371"

  platforms %w[iPhoneOS iPhoneSimulator]
end
