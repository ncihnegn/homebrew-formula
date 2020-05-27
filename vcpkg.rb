class Vcpkg < Formula
  desc "C++ Library Manager for macOS, Linux and Windows"
  homepage "https://docs.microsoft.com/en-us/cpp/vcpkg"
  head "https://github.com/Microsoft/vcpkg.git"
  url "https://github.com/microsoft/vcpkg/archive/2020.04.tar.gz"

  depends_on "cmake"
  depends_on "ninja"

  bottle begin
  end

  def install
    system "./bootstrap-vcpkg.sh", "-useSystemBinaries"
    cp_r "#{buildpath}/.", prefix
    bin.install "./vcpkg"
  end

  test do
    assert_match version.to_s, pipe_output("#{bin}/vcpkg version")
  end
end
