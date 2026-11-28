cask "ramu" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0-beta.8"
  sha256 arm:   "53a957dfb4a8249730a1e4d82b4540b25fe6312ce17c0a7a0711bcce8b7cc78e",
         intel: "708dea0d785da744c13af351e76e7d2e5c5d6ee0146d89d90fbc77ad4059c56d"

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
