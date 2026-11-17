# Akalstack Homebrew tap

```sh
brew install --cask akalstack/tap/ramu
```

[Ramu](https://getramu.dev) is an open-source workspace for coding with agents. The cask installs the signed and notarized macOS app from [GitHub Releases](https://github.com/akalstack/ramu/releases), for Apple silicon and Intel, and `brew upgrade` brings each new release. A workflow points the cask at the newest release every six hours.

`brew uninstall --zap --cask ramu` also removes Ramu's settings, threads and background service.
