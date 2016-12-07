class ProtobufC100 < Formula
  desc "Protocol buffers library"
  homepage "https://github.com/protobuf-c/protobuf-c"
  url "https://github.com/protobuf-c/protobuf-c/releases/download/v1.0.0/protobuf-c-1.0.0.tar.gz"
  sha256 "de453698d693bd1a3842759964d436e66a7afee18f3be1e324b7b74e8c0eaaea"
  revision 1

  bottle do
    sha256 "70cf3b1d4853eddeb9cbd3b54e77ebd2ad47465f68581e8ca3a000ad63322551" => :sierra
    sha256 "80fd43152f3416b00f754a49d552d7ab8cc6ca78eaf0dafc5dd7c37d5b1ff364" => :el_capitan
    sha256 "253b1bb42eb8e21cae3802ef429df21f9a07ebc2b41393cc3eb966c68ec640f9" => :yosemite
  end

  option :universal

  depends_on "pkg-config" => :build
  depends_on "protobuf250"

  def install
    ENV.universal_binary if build.universal?

    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end
end
