XCODE_DOWNLOAD_PATH = (ENV["XCODE_DOWNLOAD_PATH"] ? ENV["XCODE_DOWNLOAD_PATH"] : "file:#{ENV["HOME"]}/Downloads").freeze
AC_DOWNLOAD = "http://adcdownload.apple.com/Developer_Tools".freeze
DEV_HOMEPAGE = "https://developer.apple.com/downloads/".freeze

def xcode_url(ac_download_url)
  "#{XCODE_DOWNLOAD_PATH}/#{ac_download_url.split("/")[-1]}".gsub(/\.xip$/, '.dmg')
end

def xcode_caveats(ac_download_url); <<~EOS.undent
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

def xcode_xip_caveats(ac_download_url, appname)
  xcode_caveats(ac_download_url.gsub(/\.dmg$/, '.xip')) + <<~EOS.undent
  After downloading the file, convert the xip to a dmg by opening a 
  terminal to the folder where the xip is placed and run the 
  following commands:
    $ open #{ac_download_url.split("/")[-1].gsub(/\.dmg$/, '.xip')}
    $ mkdir Xcode-tmp
    $ mv #{appname} Xcode-tmp/#{appname}
    $ hdiutil create -volname "Xcode" \\
                     -srcfolder Xcode-tmp \\
                     -ov -format UDZO \\
                     #{ac_download_url.split("/")[-1]}
    $ rm -rf Xcode-tmp

  EOS
end

def xcode_common; end
