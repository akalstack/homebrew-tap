#!/usr/bin/env bash
# Points Casks/ramu.rb at the newest published Ramu release, reading each DMG's checksum from the release's
# SHA256SUMS files, so nothing large is downloaded.
set -euo pipefail
cd "$(dirname "$0")/.."

repo=akalstack/ramu
tag=$(gh release list --repo "$repo" --exclude-drafts --limit 1 --json tagName --jq '.[0].tagName')
version=${tag#v}
sum() {
  gh release download "$tag" --repo "$repo" --pattern "SHA256SUMS-darwin-$1.txt" --output - |
    awk -v file="darwin-$1-Ramu-$version-$1.dmg" '$2 == file { print $1 }'
}
arm=$(sum arm64)
intel=$(sum x64)
[[ $arm =~ ^[0-9a-f]{64}$ && $intel =~ ^[0-9a-f]{64}$ ]] || { echo "No DMG checksums in $tag" >&2; exit 1; }

sed -i.bak -E \
  -e "s/^  version \".*\"/  version \"$version\"/" \
  -e "s/^  sha256 arm: +\"[0-9a-f]{64}\",/  sha256 arm:   \"$arm\",/" \
  -e "s/^         intel: \"[0-9a-f]{64}\"/         intel: \"$intel\"/" \
  Casks/ramu.rb
rm Casks/ramu.rb.bak
echo "ramu $version"
