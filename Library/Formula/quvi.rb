require 'formula'

class Quvi < Formula
  homepage 'http://quvi.sourceforge.net/'
  url 'http://sourceforge.net/projects/quvi/files/0.2/quvi-0.2.19.tar.bz2'
  sha1 'f416f43ea690caeb0d9c003a84ec231ce64d5116'

  depends_on 'pkg-config' => :build
  depends_on 'pcre'
  depends_on 'lua'

  # Leopard's curl is too old.
  depends_on 'curl' if MacOS.leopard?
  
  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-nsfw",
                          "--enable-todo",
                          "--enable-nlfy"
    system "make install"
  end
end
