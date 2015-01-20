require 'formula'

class Libiodbc < Formula
  homepage 'https://github.com/openlink/iODBC'
  url 'http://garr.dl.sourceforge.net/project/iodbc/iodbc/3.52.9/libiodbc-3.52.9.tar.gz'
  sha1 '82be6d6ff22926f087020dd310e1e9f64b2a283e'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--with-layout=gnu", "--with-iodbc-inidir=#{etc}"
                          
    system "make", "install"
  end

  test do
    system "iodbc-config --version"
  end
end
