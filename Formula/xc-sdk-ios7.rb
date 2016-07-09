require "pathname"
require Pathname(__FILE__).realpath.dirname.join("../lib", "xc-sdk-formula")

class XcSdkIos7 < XcSdkFormula
  version "7.1"
  ac_download_url "xcode_5.1.1/xcode_5.1.1.dmg"
  sha256 "5bd3c1792b695dae3c96065a9cc02215ec2fab6aecbf708a66b7d19fa65ff967"

  platforms %w[iPhoneOS iPhoneSimulator]
end
