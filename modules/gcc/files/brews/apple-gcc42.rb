require 'formula'

class PkgDownloadStrategy < CurlDownloadStrategy
  def stage
    # The compilers are distributed as a OS X 10.5 package- a single flat xar
    # archive instead of a bundle.
    safe_system '/usr/bin/xar', '-xf', @tarball_path
    chdir

    # Clean up.
    safe_system "mv *.pkg/Payload Payload.gz"
    safe_system "ls | grep -v Payload | xargs rm -r"
  end
end

class AppleGcc42 < Formula
  homepage 'http://r.research.att.com/tools/'
  url 'http://r.research.att.com/tools/gcc-42-5666.3-darwin11.pkg'
  sha1 '8fadde2a159082d6474fe9e325b6301e3c0bc84f'
  version '4.2.1-5666.3-boxen1'


  def download_strategy
    PkgDownloadStrategy
  end

  # Don't strip compiler binaries.
  skip_clean :all

  def install
    safe_system "pax --insecure -rz -f Payload.gz -s ',./usr,#{prefix},'"

    # Create links for GFortran as this formula is functionally equivalent to
    # the GFotran formula. The only difference is that the GFortran formula
    # tosses out the C compilers.
    safe_system "ln -sf #{bin}/gfortran-4.2 #{bin}/gfortran"
    safe_system "ln -sf #{man1}/gfortran-4.2.1 #{man1}/gfortran.1"
  end
end
