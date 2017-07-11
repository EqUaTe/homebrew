class Apg < Formula
  desc "Tool set for random password generation"
  homepage "http://www.adel.nursat.kz/apg/"
  url "https://www.equateuk.com/source/apg-2.2.3.tar.gz"
  sha256 "28186b67f7e87ba6b4182d3f1451bf18e689e5a032fe011006159c270b1cd591"

  bottle do
    cellar :any_skip_relocation
  end

  def install
    system "make", "standalone",
                   "CC=#{ENV.cc}",
                   "FLAGS=#{ENV.cflags}",
                   "LIBS=", "LIBM="

    bin.install "apg", "apgbfm"
    man1.install "doc/man/apg.1", "doc/man/apgbfm.1"
  end

  test do
    system bin/"apg", "-a", "1", "-M", "n", "-n", "3", "-m", "8", "-E", "23456789"
  end
end
