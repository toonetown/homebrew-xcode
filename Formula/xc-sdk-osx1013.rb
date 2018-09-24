require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkOsx1013 < XcSdkFormula
  version "10.13"
  ac_download_url "Xcode_9.4.1/Xcode_9.4.1.dmg"
  sha256 "fe97d79be0750f7e8247f4d236d6d9fbd5d230e7adcaf322ef3d91aad2255f0d"

  platforms %w[MacOSX]
end
