# Singularité
Simplest, slimmest, transparent CFW distro.  
Everything you need to get started, in a neatly packaged file.

## How to install
1) Download latest release.
2) Copy `sd` contents into the root of your SD card.
3) Push `hekate_ctcaer_4.6.bin` with your preferred method.
4) Done!

## What's included?
- Pure and full **Atmosphere**. Not gutted, not chopped.
- **Sigpatches** for Atmosphere.
- Pre-configured **Hekate v4.6**.
- **Homebrew Loader**.
- **Homebrew Menu**.
- **Checkpoint**.
- **FTPD**.
- **Tinfoil**, by Adubbz.

## Compile on your own
1) Make sure your development environment is complete:
   - devkitpro, devkitARM, devkitA64
   - libnx
   - for other dependencies of included submodules, check their respective pages.
2) Clone this repo: `git clone --recursive https://github.com/RShadowhand/singularite.git`
3) Run `make` or `make release`

## Notes:
- It may not be possible to compile Atmosphere right now, for more info, contact @SciresM.
  - For this reason, Singularité downloads 0.8.2 release for the time being.
  - As soon as it's possible to compile it without special requirements, makefile will be updated.
- Tinfoil is added as prebuilt, as it's not actively being developed, and the history of it is rather hazy.
- Instead of `hekate_ctcaer_4.6.bin`, you can push `fusee-primary.bin` for Atmosphere 0.8.2.
  - You can find it in `_dist/bootloader/payloads` folder.

## Credits
- @SciresM, and everyone in Atmosphere's credits.
- The-4n, and everyone else who worked on sigpatches.
- CTCaer, and everyone in Hekate's credits.
- Everyone that contributed to `nx-hbloader`.
- Everyone that contributed to `nx-hbmenu`.
- @BernardoGiordano, and the FlagBrew team.
- mtheall, and everyone that contributed to `FTPD`
- Adubbz.
- WinterMute, and everyone that contributed to devkitpro, devkitARM, devkitA64, libnx.

## License
Licensed under GPLv3. For more information, read `LICENSE`.  
Additionally, can not be used to commercial gain.  
This project respects any all licenses of its submodules. See submodule pages for their respective licenses.