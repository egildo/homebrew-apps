class Punchr < Formula
  desc "Dress folders in Finder by the state another program names"
  homepage "https://codeberg.org/egildo/punchr"
  url "https://codeberg.org/egildo/punchr/archive/v0.2.0.tar.gz"
  sha256 "586d63b9aff700eb0c2ada7dac1649d8d8e15fdd87c30fa7a156f94ea21cac11"
  license "MIT"

  depends_on macos: :tahoe

  def install
    system "./build.sh"
    prefix.install "build/Punchr.app"
    bin.install_symlink prefix/"Punchr.app/Contents/MacOS/Punchr" => "punchr"
  end

  test do
    (testpath/"t.json5").write "{ owns: { tags: ['t'] }, looks: { on: { tags: [{ t: 'red' }] } } }"
    mkdir testpath/"f"
    system bin/"punchr", "strike", testpath/"t.json5", "on", testpath/"f", "--force"
    assert_match "t: on", shell_output("#{bin}/punchr read #{testpath}/f --punch #{testpath}/t.json5")
  end
end
