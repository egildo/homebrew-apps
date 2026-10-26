class Punchr < Formula
  desc "Dress folders in Finder by the state another program names"
  homepage "https://codeberg.org/egildo/punchr"
  url "https://codeberg.org/egildo/punchr/archive/v0.4.0.tar.gz"
  sha256 "870ae3e466b198601d16ff34862a18a6b078902bc441d8ef3689b1062511c7a7"
  license "MIT"

  depends_on macos: :tahoe

  def install
    system "./build.sh"
    prefix.install "build/Punchr.app"
    bin.install_symlink prefix/"Punchr.app/Contents/MacOS/Punchr" => "punchr"
  end

  def caveats
    <<~EOS
      Shelves (sidebar rows of links) are small apps punchr makes and keeps in
        ~/Library/Application Support/punchr/Shelves
      After upgrading punchr, rebuild them from the new version; they stay enabled:
        punchr shelves --refresh
    EOS
  end

  test do
    (testpath/"t.json5").write "{ owns: { tags: ['t'] }, looks: { on: { tags: [{ t: 'red' }] } } }"
    mkdir testpath/"f"
    system bin/"punchr", "strike", testpath/"t.json5", "on", testpath/"f", "--force"
    assert_match "t: on", shell_output("#{bin}/punchr read #{testpath}/f --punch #{testpath}/t.json5")
    assert_match "no shelves", shell_output("#{bin}/punchr shelves")
  end
end
