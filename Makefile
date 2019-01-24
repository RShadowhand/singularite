MAJORVER := "1"
MINORVER := "1"
MICROVER := "2"
VERSION := $(MAJORVER)$(MINORVER)$(MICROVER)
COMMIT := $(shell git rev-parse --short HEAD)
all: checkpoint ftp hkt hbloader hbmenu nxtheme ams nxshell kipselect sin

clean:
	$(MAKE) -C Checkpoint clean
	$(MAKE) -C ftpd clean
	$(MAKE) -C hekate clean
	$(MAKE) -C nx-hbloader clean
	$(MAKE) -C nx-hbmenu clean
	$(MAKE) -C KipSelect clean
	$(MAKE) -C SwitchThemeInjector/SwitchThemesNX clean
	$(MAKE) -f singularite clean
	@rm -rf singularite*.zip
	@rm -rf NX-Shell.nro

ams:
	@$(MAKE) -C Atmosphere dist

nxshell:
	@echo "---------------------------------------------------------------"
	@echo "Downloading NX-Shell, because compiling may not be possible."
	@echo "Visit https://github.com/joel16/NX-Shell for help!"
	@echo "---------------------------------------------------------------"
	@[ -f NX-Shell.nro ] || wget "https://github.com/joel16/NX-Shell/releases/download/1.20/NX-Shell.nro" -O NX-Shell.nro

kipselect:
	@$(MAKE) -C KipSelect

nxtheme:
	@$(MAKE) -C SwitchThemeInjector/SwitchThemesNX

checkpoint:
	@$(MAKE) -C Checkpoint switch

ftp:
	@$(MAKE) -C ftpd/ nro

hkt:
	@$(MAKE) -C hekate

hbloader:
	@$(MAKE) -C nx-hbloader

hbmenu:
	@$(MAKE) -C nx-hbmenu nx

sin:
	$(MAKE) -f singularite

release: all
	cd _dist; zip singularite.zip * -r -9; mv singularite.zip ../singularite-$(VERSION)-$(COMMIT).zip
