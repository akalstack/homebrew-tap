cask "ramu" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0-beta.5"
  sha256 arm:   "11fc44c03db1d4a6ed5be9ce4bcc87751c028492172ca697d5325ea3eb60c5f4",
         intel: "2cbc7144ecf1cc19c7b3eddd9683fde28435101c3449af98844f141008c7d3f9"

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
