BR_VERSION ?= 2025.02.18
BR_DIR     := $(CURDIR)/.buildroot
OUT        := $(CURDIR)/output
EXT        := $(CURDIR)/camber-external

export BR2_DL_DIR ?= $(HOME)/.cache/buildroot-dl

$(BR_DIR)/Makefile:
	mkdir -p $(BR_DIR)
	curl -L https://buildroot.org/downloads/buildroot-$(BR_VERSION).tar.gz \
		| tar xz --strip-components=1 -C $(BR_DIR)

.PHONY: $(MAKECMDGOALS)
$(filter-out $(BR_DIR)/Makefile,$(MAKECMDGOALS)): $(BR_DIR)/Makefile
	$(MAKE) -C $(BR_DIR) O=$(OUT) BR2_EXTERNAL=$(EXT) $@
