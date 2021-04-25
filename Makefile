DESTDIR ?= /usr/bin
CONFDIR ?= ${HOME}/.config

all:
	@echo "Available recipes: install or uninstall"

install-home:
	@install -v -d "${CONFDIR}/tpl/templates" && install -m 0644 -v src/templates/* "${CONFDIR}/tpl/templates"
	@install -m 0644 -v src/config "${CONFDIR}/tpl/config"

install: install-home
	@sudo install -v -m 0755 src/tpl "${DESTDIR}/tpl"

uninstall:
	@rm -vrf "${CONFDIR}/tpl"
	@sudo rm -vrf "${DESTDIR}/tpl"

.PHONY: install uninstall install-home
