cask "ramu" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0-alpha.11"
  sha256 arm:   "dd432f3cd942a1e74dd44e96e7377ff77d07e985bad36d5882f5da1edee6594c",
         intel: "2f1a6d927c91193ab2c403b542759cca76d38d3888b5304158ea8b1b32d2e8f6"

  url "https://github.com/akalstack/ramu/releases/download/v#{version}/darwin-#{arch}-Ramu-#{version}-#{arch}.dmg",
      verified: "github.com/akalstack/ramu/"
  name "Ramu"
  desc "Open-source workspace for coding with agents"
  homepage "https://getramu.dev/"

  # Reads tags, not GitHub releases, so alpha and beta releases count while Ramu has no stable one.
  livecheck do
    url "https://github.com/akalstack/ramu.git"
    regex(/^v?(\d+(?:\.\d+)+(?:-(?:alpha|beta|rc)\.\d+)?)$/i)
    strategy :git
  end

  depends_on macos: :ventura

  app "Ramu.app"

  uninstall quit: "app.ramu.desktop"

  zap trash: [
    "~/.ramu",
    "~/Library/Application Support/Ramu",
    "~/Library/Caches/app.ramu.desktop",
    "~/Library/HTTPStorages/app.ramu.desktop",
    "~/Library/LaunchAgents/app.ramu.background.*.plist",
    "~/Library/Logs/Ramu",
    "~/Library/Preferences/app.ramu.desktop.plist",
    "~/Library/Saved Application State/app.ramu.desktop.savedState",
  ]
end
