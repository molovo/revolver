class Revolver < Formula
  desc "Progress spinner for ZSH scripts"
  homepage "https://github.com/molovo/revolver"
  url "https://github.com/molovo/revolver/archive/v0.2.4.tar.gz"
  sha256 "14fc00f9afecf5fd9db639ce1a237115faf8d21c5168fbc5dc87a04717a42caa"
  bottle :unneeded
  def install
    bin.install "revolver"
    zsh_completion.install "revolver.zsh-completion" => "_revolver"
  end
  test do
    assert_equal version.to_s, shell_output("#{bin}/revolver -v")
  end
end
