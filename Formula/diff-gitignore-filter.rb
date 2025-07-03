class DiffGitignoreFilter < Formula
  desc "Pure stream-filter for Git diffs that respects .gitignore patterns"
  homepage "https://github.com/trontheim/diff-gitignore-filter"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/trontheim/diff-gitignore-filter/releases/download/v#{version}/diff-gitignore-filter-darwin-amd64"
      sha256 "ab8313fdd587f00acd68c0455ee60500b61453d295272644c15bc4fefe26f56d"
    end
    on_arm do
      url "https://github.com/trontheim/diff-gitignore-filter/releases/download/v#{version}/diff-gitignore-filter-darwin-arm64"
      sha256 "d97ad0db6a627fb816eb631622f2f75932a84438a2f4b7a59236a19728c486cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/trontheim/diff-gitignore-filter/releases/download/v#{version}/diff-gitignore-filter-linux-amd64"
      sha256 "d5adf90d37fca630d84de923fa2cc80ac3d9f4da4da860956dcb69c4e4056adc"
    end
    on_arm do
      url "https://github.com/trontheim/diff-gitignore-filter/releases/download/v#{version}/diff-gitignore-filter-linux-arm64"
      sha256 "4a751ac25af950e1fe8b4f663fb6d7db81912f2f74334c73925c7dabc46de15a"
    end
  end

  resource "manpage" do
    url "https://github.com/trontheim/diff-gitignore-filter/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "91912ad843b109c5994da7043a4773a78e07c8f1c784bd4a473026c3df788ab9"
  end

  def install
    bin.install Dir["*"].first => "diff-gitignore-filter"

    # Install man page from source repository
    resource("manpage").stage do
      man1.install Dir["man/*.1"]
    end
  end

  test do
    # Basic installation checks
    assert_path_exists bin/"diff-gitignore-filter"
    assert_predicate bin/"diff-gitignore-filter", :executable?
    ohai "Basic installation checks passed"

    # Version command check
    version_output = shell_output("#{bin}/diff-gitignore-filter --version 2>&1").strip
    assert_match version.to_s, version_output
    ohai "Version command check passed"

    # Help command check
    help_output = shell_output("#{bin}/diff-gitignore-filter --help 2>&1")
    assert_match(/usage|help|options/i, help_output)
    ohai "Help comand check passed"

    # Basic functionality test with sample diff
    sample_diff = <<~DIFF
      diff --git a/test.txt b/test.txt
      index 1234567..abcdefg 100644
      --- a/test.txt
      +++ b/test.txt
      @@ -1 +1 @@
      -old content
      +new content
    DIFF
    pipe_output(bin/"diff-gitignore-filter", sample_diff, 0)
    ohai "Basic functionality test passed"
  end
end
