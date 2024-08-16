require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula") unless defined?(xc_sdk_formula)

class XcSdkOsx12 < XcSdkFormula
  version "12.3"
  ac_download_url "Xcode_13.4.1/Xcode_13.4.1.dmg"
  sha256 "9898cea07c3c3d47feb5ab38a68e6243687c7ee622da1d457fae21838e890959"

  platforms %w[MacOSX]
end
