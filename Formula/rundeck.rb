class Rundeck < Formula
  desc "Terminal dashboard for personal dev projects"
  homepage "https://github.com/IntScription/rundeck"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/IntScription/rundeck/releases/download/v0.1.0/rundeck-aarch64-apple-darwin.tar.gz"
      sha256 "7bc5baf6fa3cf35c9212e16ad2b00a0abb0b62cdd1cd311124ca45e775c12eb0"
    else
      odie "Intel macOS binary is not published yet. Install from source with: cargo install --git https://github.com/IntScription/rundeck"
    end
  end

  on_linux do
    url "https://github.com/IntScription/rundeck/releases/download/v0.1.0/rundeck-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "73bd22557f8212aadb262b9e97f9f513e4cba2d86c183d6d522b3b27b4a2ecca"
  end

  depends_on "tmux"
  depends_on "fzf"
  depends_on "lazygit"

  def install
    bin.install "rundeck"
  end

  test do
    system "#{bin}/rundeck", "doctor"
  end
end
