XCODE_DOWNLOAD_PATH = (ENV['XCODE_DOWNLOAD_PATH'] ? ENV['XCODE_DOWNLOAD_PATH'] : "file:#{ENV['HOME']}/Downloads").freeze
AC_DOWNLOAD = 'http://adcdownload.apple.com/Developer_Tools'.freeze
DEV_HOMEPAGE = 'https://developer.apple.com/downloads/'.freeze

def xcode_caveats(ac_download_url); <<-EOS.undent
  You must specify a location for the download files by setting the
  environment variable 'XCODE_DOWNLOAD_PATH'.  This can be specified as a
  local path (using the file:// scheme) or other URL, and will be used in
  the url for this cask. It defaults to ${HOME}/Downloads

  You can download this file by logging in to:
    #{DEV_HOMEPAGE}
  And then downloading from:
    #{AC_DOWNLOAD}/#{ac_download_url}

  EOS
end
