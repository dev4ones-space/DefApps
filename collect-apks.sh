LastGithubReleasesAPK() {
  local repo="$1" pattern="$2" package_name="$3" permission_level="$4"
  local base_dir
  case "$permission_level" in
    priv) base_dir="system/priv-app" ;;
    *)    base_dir="system/app" ;;
  esac
  local path="system/$permission_level/$package_name/$package_name.apk"
  local url
  url=$(curl -s "https://api.github.com/repos/$repo/releases?per_page=30" \
    | grep -o '"browser_download_url": *"[^"]*\.apk"' \
    | grep "$pattern" \
    | head -n1 \
    | cut -d'"' -f4)
  if [ -z "$url" ]; then
    printf 'FAIL\nstatic method?: repo address: %s; apk release pattern: %s;\n' "$repo" "$pattern"
    return 1
  fi
  curl -L "$url" -o "$path"
  echo "OK"
}
echo "> Collecting APKs for $ARCH"
echo ">> PixelPlay FX" && LastGithubReleasesAPK 'dev4ones-space/PixelPlayer-EQ' $1-release 'com.dev4ones_space_fork.pixelplay_fx' 'app'
echo ">> Aurora Store" && curl -L "https://auroraoss.com/downloads/AuroraStore/Latest/latest.apk" -o "system/app/com.aurora.store/com.aurora.store.apk" && echo "OK"
echo ">> Ente Photos" && LastGithubReleasesAPK 'ente-io/ente' 'ente-photos-' 'io.ente.photos' 'app'
echo ">> Ente Auth" && LastGithubReleasesAPK 'ente-io/ente' 'ente-auth-' 'io.ente.auth' 'app'
echo ">> Duress" && LastGithubReleasesAPK 'x13a/Duress' 'app-release' 'me.lucky.duress' 'app'
echo ">> Thunderbird" && LastGithubReleasesAPK 'thunderbird/thunderbird-android' 'thunderbird-' 'net.thunderbird.android' 'app'
echo ">> Shizuku" && LastGithubReleasesAPK 'RikkaApps/Shizuku' 'shizuku-' 'moe.shizuku.privileged.api' 'priv-app'