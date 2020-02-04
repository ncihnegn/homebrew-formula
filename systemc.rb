class Systemc < Formula
  desc "Core SystemC language and examples"
  homepage "https://accellera.org/"
  url "https://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.3.tar.gz"

  depends_on "cmake" => :build

  def install
    system "cmake", "-Bbuild", ".", "-std=c++17", *std_cmake_args
    system "cmake", "--build", "build", "--target", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <systemc>

      int sc_main(int argc, char *argv[]) {
        return 0;
      }
    EOS
    system ENV.cxx, "-L#{lib}", "-lsystemc", "test.cpp"
    system "./a.out"
  end
end
