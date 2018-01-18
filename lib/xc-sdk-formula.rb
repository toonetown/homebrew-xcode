require "pathname"
require "formula"
require "keg"
require Pathname(__FILE__).realpath.dirname.join("xcode-common") unless defined?(xcode_common)

# Override this function so that we don't do anything with the install_name tool
class Keg
  def install_name_tool(*args)
  end
end

class XcSdkFormula < Formula
  def mount_name
    "Xcode"
  end

  def plat_path(platform)
    "Xcode.app/Contents/Developer/Platforms/#{platform}.platform"
  end

  def sdks_path(platform)
    "#{plat_path platform}/Developer/SDKs"
  end

  def sdk_name(platform)
    "#{platform}#{self.class.version}.sdk"
  end

  def sdk_path(platform)
    "#{sdks_path platform}/#{sdk_name platform}"
  end

  def initialize(*)
    cls=self.class
    raise FormulaSpecificationError, "Requires an ac_download_url" unless cls.ac_download_url
    raise FormulaSpecificationError, "Requires platforms (array)" unless cls.platforms && cls.platforms.is_a?(Array)

    cls.url xcode_url(cls.ac_download_url)
    cls.homepage DEV_HOMEPAGE
    cls.depends_on "toonetown/xcode/link-sdks"

    super
  end

  def install
    ohai "Mounting DMG"
    (buildpath + "dmg-mount").mkpath
    quiet_system "hdiutil", "attach", self.class.ac_download_url.split("/")[-1],
                 "-nobrowse", "-mountroot", buildpath + "dmg-mount"

    begin
      self.class.platforms.each do |platform|
        ohai "Copying #{sdk_name platform}"
        cp_r buildpath + "dmg-mount" + mount_name + sdk_path(platform), prefix
        touch prefix + sdk_name(platform) + "legacy"

        # Make this directory first so that links get create in it instead of links to it.
        (HOMEBREW_PREFIX + "share/legacy-sdks/#{platform}.platform").mkpath
        (share + "legacy-sdks/#{platform}.platform").install_symlink (prefix + sdk_name(platform))
      end
    ensure
      ohai "Unmounting DMG"
      quiet_system "hdiutil", "detach", buildpath + "dmg-mount" + mount_name
    end
  end

  # Need to override that it's actually defined so it gets called from the superclass
  def post_install_defined?
    true
  end

  def post_install
    ohai "Relinking SDKs (may require sudo)"
    system "link-sdks", "--sdksPath", (HOMEBREW_PREFIX + "share/legacy-sdks").to_s
  end

  def caveats; <<~EOS.undent
    #{xcode_caveats(self.class.ac_download_url).rstrip}

    After uninstalling, you may wish to run `link-sdks` to clean up any leftover
    links.  This is because we can't hook into brew uninstall to execute commands

    EOS
  end

  class << self
    attr_rw :ac_download_url, :platforms
  end
end

def xc_sdk_formula; end
