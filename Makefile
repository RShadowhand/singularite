MAJORVER := "1"
MINORVER := "1"
MICROVER := "1"
VERSION := $(MAJORVER)$(MINORVER)$(MICROVER)
COMMIT := $(shell git rev-parse --short HEAD)
all: checkpoint ftp hkt hbloader hbmenu nxtheme ams nxshell kipselect sin

clean:
	$(MAKE) -C Checkpoint clean
	$(MAKE) -C ftpd clean
	$(MAKE) -C hekate clean
	$(MAKE) -C nx-hbloader clean
	$(MAKE) -C nx-hbmenu clean
	$(MAKE) -C SwitchThemeInjector/SwitchThemesNX clean
	$(MAKE) -f singularite clean
	@rm -rf ams.zip
	@rm -rf fusee-primary.bin
	@rm -rf singularite*.zip
	@rm -rf Kip_Select.nro
	@rm -rf NX-Shell.nro

ams:
	@$(MAKE) -C Atmosphere dist
	@echo "---------------------------------------------------------------"
	@echo "Downloading fusee-primary."
	@echo "---------------------------------------------------------------"
	@[ -f fusee-primary.bin ] || wget "https://github.com/Atmosphere-NX/Atmosphere/releases/download/0.8.2/fusee-primary.bin" -O fusee-primary.bin

nxshell:
	@echo "---------------------------------------------------------------"
	@echo "Downloading NX-Shell, because compiling may not be possible."
	@echo "Visit https://github.com/joel16/NX-Shell for help!"
	@echo "---------------------------------------------------------------"
	@[ -f NX-Shell.nro ] || wget "https://github.com/joel16/NX-Shell/releases/download/1.10/NX-Shell.nro" -O NX-Shell.nro

kipselect:
	@echo "---------------------------------------------------------------"
	@echo "Downloading KipSelect, because compiling may not be possible."
	@echo "Visit https://github.com/Sciguy429/KipSelect for help!"
	@echo "---------------------------------------------------------------"
	@[ -f Kip_Select.nro ] || wget "https://github.com/Sciguy429/KipSelect/releases/download/3.0.1/Kip_Select_V3.0.1.nro" -O Kip_Select.nro

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
