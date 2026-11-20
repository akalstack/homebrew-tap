cask "ramu" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0-alpha.6"
  sha256 arm:   "d134a02fe1c3058d447f585a1178e37d0d2b110fa21fbffa8595ae3f6c4a9150",
         intel: "16694098c4422bbf75f64e96f38a2f67aa94345d3792a01d0eaaa25ca6069b5b"

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
