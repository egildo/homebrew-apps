class Punchr < Formula
  desc "Dress folders in Finder by the state another program names"
  homepage "https://codeberg.org/egildo/punchr"
  url "https://codeberg.org/egildo/punchr/archive/v0.1.0.tar.gz"
  sha256 "e4db1c3a5b8ec9898d3185f263d79a081f0f95f2955de8b763c76ec2dc62bd07"
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
