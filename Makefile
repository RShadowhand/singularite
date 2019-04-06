MAJORVER := "1"
MINORVER := "2"
MICROVER := "0"
VERSION := $(MAJORVER)$(MINORVER)$(MICROVER)
COMMIT := $(shell git rev-parse --short HEAD)
all: checkpoint ftp hkt hbloader hbmenu ams nxshell kipselect sin

clean:
	$(MAKE) -C Checkpoint clean
	$(MAKE) -C ftpd clean
	$(MAKE) -C hekate clean
	# $(MAKE) -C nx-hbloader clean
	# $(MAKE) -C nx-hbmenu clean
	# $(MAKE) -C KipSelect clean
	$(MAKE) -f singularite clean
	@rm -rf singularite*.zip
	@rm -rf NX-Shell.nro
	@rm -rf Kip_Select.nro
	@rm -rf fusee-primary.bin
	@rm -rf ams.zip

ams:
	# @$(MAKE) -C Atmosphere dist
	@echo "---------------------------------------------------------------"
	@echo "Downloading Atmosphere, because compiling may not be possible."
	@echo "Visit https://github.com/Atmosphere-NX/Atmosphere for help!"
	@echo "---------------------------------------------------------------"
	@[ -f ams.zip ] || wget "https://github.com/Atmosphere-NX/Atmosphere/releases/download/0.8.6/atmosphere-0.8.6-master-994d7d5+hbl-2.1+hbmenu-3.0.1.zip" -O ams.zip
	@[ -f fusee-primary.bin ] || wget "https://github.com/Atmosphere-NX/Atmosphere/releases/download/0.8.6/fusee-primary.bin" -O fusee-primary.bin

nxshell:
	@echo "---------------------------------------------------------------"
	@echo "Downloading NX-Shell, because compiling may not be possible."
	@echo "Visit https://github.com/joel16/NX-Shell for help!"
	@echo "---------------------------------------------------------------"
	@[ -f NX-Shell.nro ] || wget "https://github.com/joel16/NX-Shell/releases/download/1.20/NX-Shell.nro" -O NX-Shell.nro

kipselect:
	# @$(MAKE) -C KipSelect
	@echo "---------------------------------------------------------------"
	@echo "Downloading KipSelect, because compiling may not be possible."
	@echo "Visit https://github.com/Sciguy429/KipSelect for help!"
	@echo "---------------------------------------------------------------"
	@[ -f Kip_Select.nro ] || wget "https://github.com/Sciguy429/KipSelect/releases/download/3.0.9/Kip_Select_V3.0.9.nro" -O Kip_Select.nro

checkpoint:
	@$(MAKE) -C Checkpoint switch

ftp:
	@$(MAKE) -C ftpd/ nro

hkt:
	@$(MAKE) -C hekate

hbloader:
	# @$(MAKE) -C nx-hbloader
	@echo "Included in Atmosphere"

hbmenu:
	# @$(MAKE) -C nx-hbmenu nx
	@echo "Included in Atmosphere"

sin:
	$(MAKE) -f singularite

release: all
	cd _dist; zip singularite.zip * -r -9; mv singularite.zip ../singularite-$(VERSION)-$(COMMIT).zip
