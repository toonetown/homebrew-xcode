require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkIos12 < XcSdkFormula
  version "12.4"
  ac_download_url "Xcode_10.3/Xcode_10.3.dmg"
  sha256 "77f721659cf513f3b294ff9fa1672f9e3970201e15adf131fd959591bf4bb0fc"

  platforms %w[iPhoneOS iPhoneSimulator]
end
