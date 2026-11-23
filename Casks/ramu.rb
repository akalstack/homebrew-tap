cask "ramu" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0-alpha.18"
  sha256 arm:   "fa75fe07b05e8693af6c0134c04d7a3ede743b83651f8222b540c372aacfbb02",
         intel: "c12ade56b8fcbf7d752584694e5750f6ebaa88f8a9188ba6c83f1dfebb9be275"

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
