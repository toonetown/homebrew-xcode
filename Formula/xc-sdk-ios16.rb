require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkIos16 < XcSdkFormula
  version "16.4"
  ac_download_url "Xcode_14.3/Xcode_14.3.dmg"
  sha256 "869ae7f0ac72f112b5c6739dac4fef21a198bd892f7d92d3268f250618501f2e"

  platforms %w[iPhoneOS iPhoneSimulator]
end
