require 'pathname'
require Pathname(@path).realpath.dirname.join('../lib', 'xcode-common') unless defined?(xcode_common)

cask 'docsetutil' do
  version '1.0'
  sha256 '615abd00262af6b42253764b6f71785d0234291c84bc936e90957a69c34a564e'

  url 'https://github.com/Kapeli/Dash-User-Contributions/files/2012357/DocSetUtil.zip'
  name 'DocSet Utility'
  homepage 'https://github.com/Kapeli/Dash-User-Contributions/pull/1884#issuecomment-389793784'
  
  binary 'DocSetUtil/Developer/usr/bin/docsetutil'
end
