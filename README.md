# DefApps
## A simple Magisk module apps installer
- Apps are FOSS/privacy focused
- Apps picked have support for offline use only, with some apps having a private online services (like Ente ecosystem)
- Apps picked is replacement for default OS provided app, like Google Photos for Ente Photos and more

# Download
- With GitHub account (more secure, automatic building): GitHub Actions
- Without GitHub account (less secure, only on-update/random building): GitHub Releases

# Apps currently included into module
#### Shown in format "alternative app name (description of app) - original app name/alternative too"
- PixelPlayer (a open-source lossless music player, patched for ViperFX support) - Google Files build-in player/Samsung OS provided player
- Ente Auth (a open-source TOTP code manager with online syncing (only within Ente account)/local) - Google Authenticator/Proton Pass
- Ente Photos (a open-source gallery app with capabilities of online media upload (only within Ente account, up to 10 GB)) - Google Photos/any OS provided gallery app
- Duress (alternative to GrapheneOS's duress PIN feature) - GrapheneOS Duress PIN/Password feature (basically a port of feature to OSs without having it build-in)  
- Thunderbird (a open-source email client) - Google Gmail (as a client)
- Shizuku (API for apps that need advanced capabilities) - none
- Aurora Store (Google Play FOSS client) - Google Play/Samsung Store

# Local build with source code
- One run command: `git clone https://github.com/dev4ones-space/DefApps.git && cd DefApps && bash collect-apks.sh && zip module.zip -r ./*`
1. Clone repo
2. Run APK collector: `bash collect-apks.sh` *(shell may vary, universal variant `./collect-apks.sh` but requires `chmod a+x /collect-apks.sh`)*
3. Zip the module: `zip module.zip -r ./*`