VERSION := "1.0"
COMMIT := $(shell git rev-parse --short HEAD)
all: ams checkpoint ftp hkt hbloader hbmenu sin

clean:
	$(MAKE) -C Checkpoint clean
	$(MAKE) -C ftpd clean
	$(MAKE) -C hekate clean
	$(MAKE) -C nx-hbloader clean
	$(MAKE) -C nx-hbmenu clean
	$(MAKE) -f singularite clean
	@rm -rf ams.zip
	@rm -rf fusee-primary.bin
	@rm -rf singularite*.zip

ams:
	@echo "------------------------------------------------------"
	@echo "Downloading AMS because compiling may not be possible."
	@echo "Contact SciresM for help!"
	@echo "------------------------------------------------------"
	@wget "https://github.com/Atmosphere-NX/Atmosphere/releases/download/0.8.2/atmosphere-0.8.2-master-84c776f.zip" -O ams.zip
	@wget "https://github.com/Atmosphere-NX/Atmosphere/releases/download/0.8.2/fusee-primary.bin"

ams_real:
	$(MAKE) -C Atmosphere

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