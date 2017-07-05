class Revolver < Formula
  desc "Progress spinner for ZSH scripts"
  homepage "https://github.com/molovo/revolver"
  url "https://github.com/molovo/revolver/archive/v0.2.3.tar.gz"
  sha256 "1bcd00126047e0faaacb496e6f01903efb5e5d3a26c72aa6f78061f08c0bf939"

  bottle :unneeded

  def install
    bin.install "revolver"
    zsh_completion.install "revolver.zsh-completion" => "_revolver"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/revolver -v")
  end
end
