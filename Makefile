ISPAPI_BLESTA_MODULE_VERSION :=  $(shell node -p "require('./release.json').version")
FOLDER := pkg/blesta-ispapi-registrar-$(ISPAPI_BLESTA_MODULE_VERSION)

clean:
	rm -rf $(FOLDER)

buildsources:
	mkdir -p $(FOLDER)/install/components/modules/ispapi
	cp *.php $(FOLDER)/install/components/modules/ispapi
	cp -a apis $(FOLDER)/install/components/modules/ispapi/apis
	cp -a config $(FOLDER)/install/components/modules/ispapi/config
	cp -a language $(FOLDER)/install/components/modules/ispapi/language
	cp -a views $(FOLDER)/install/components/modules/ispapi/views
	cp -a composer.json $(FOLDER)/install/components/modules/ispapi/composer.json
	cp -a composer.lock $(FOLDER)/install/components/modules/ispapi/composer.lock
	cp HISTORY.md $(FOLDER)
	cp README.md $(FOLDER)
	cp LICENSE $(FOLDER)
	cp CONTRIBUTING.md $(FOLDER)

buildlatestzip:
	cp pkg/blesta-ispapi-registrar.zip ./blesta-ispapi-registrar-latest.zip # for downloadable "latest" zip by url

zip:
	@echo $(ISPAPI_BLESTA_MODULE_VERSION);
	rm -rf pkg/blesta-ispapi-registrar.zip
	@$(MAKE) buildsources
	cd pkg && zip -r blesta-ispapi-registrar.zip blesta-ispapi-registrar-$(ISPAPI_BLESTA_MODULE_VERSION)
	@$(MAKE) clean

tar:
	@echo $(ISPAPI_BLESTA_MODULE_VERSION)
	rm -rf pkg/blesta-ispapi-registrar.tar.gz
	@$(MAKE) buildsources
	cd pkg && tar -zcvf blesta-ispapi-registrar.tar.gz blesta-ispapi-registrar-$(ISPAPI_BLESTA_MODULE_VERSION)
	@$(MAKE) clean

allarchives:
	rm -rf pkg/blesta-ispapi-registrar.zip
	rm -rf pkg/blesta-ispapi-registrar.tar
	@$(MAKE) buildsources
	cd pkg && zip -r blesta-ispapi-registrar.zip blesta-ispapi-registrar-$(ISPAPI_BLESTA_MODULE_VERSION) && tar -zcvf blesta-ispapi-registrar.tar.gz blesta-ispapi-registrar-$(ISPAPI_BLESTA_MODULE_VERSION)
	@$(MAKE) buildlatestzip
	@$(MAKE) clean
