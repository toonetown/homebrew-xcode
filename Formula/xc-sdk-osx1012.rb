require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkOsx1012 < XcSdkFormula
  version "10.12"
  ac_download_url "Xcode_9.2/Xcode_9.2.dmg"
  sha256 "9e6b7dc568a06faf0cc9cc82641e9dedb84e4306976457c485d4c8ab164e41e4"

  platforms %w[MacOSX]
end
