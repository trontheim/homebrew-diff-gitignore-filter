# Homebrew Tap for diff-gitignore-filter

This is the official Homebrew Tap for [diff-gitignore-filter](https://github.com/trontheim/diff-gitignore-filter), a pure stream-filter for Git diffs that respects `.gitignore` patterns.

**Latest Version:** v1.0.0

## Installation

### Add tap and install package

```bash
brew tap trontheim/diff-gitignore-filter
brew install diff-gitignore-filter
```

### Direct installation

```bash
brew install trontheim/diff-gitignore-filter/diff-gitignore-filter
```

## About diff-gitignore-filter

`diff-gitignore-filter` is a specialized tool that can be configured as an external diff tool for Git. It provides:

- **🌊 Pure Stream Processing**: Memory-efficient line-by-line diff processing
- **💾 Memory Efficient**: Stream-based processing with constant memory usage
- **🌍 Complete .gitignore Support**: All standard patterns including negations
- **🔧 Git Worktree Support**: Full compatibility with Git worktrees and submodules
- **🌐 Unicode Path Handling**: Robust support for international filenames
- **🔗 Downstream Filter Integration**: Seamless chaining with tools like Delta, Bat, and Less

## Usage

After installation, the tool can be configured as an external Git diff tool:

```bash
git config --global diff.external diff-gitignore-filter
```

Or for specific repositories:

```bash
git config diff.external diff-gitignore-filter
```

## More Information

- **Repository**: https://github.com/trontheim/diff-gitignore-filter
- **Documentation**: https://github.com/trontheim/diff-gitignore-filter
- **License**: MIT
- **Author**: Valgard Trontheim <valgard@trontheim.com>

## Support

For issues or questions, please create an issue in the [main repository](https://github.com/trontheim/diff-gitignore-filter/issues).
