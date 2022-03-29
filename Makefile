WS_PREFIX ?= $(HOME)/ws
VERSION:=$(shell semtag final -s minor -o)

#:help: help        | Displays the GNU makefile help
.PHONY: help
help: ; @sed -n 's/^#:help://p' Makefile

#:help: lint        | Lint the project files using pre-commit
.PHONY: lint
lint:
	@pre-commit run --all-files

#:help: changever   | Change the product version to the next consecutive version number.
.PHONY: changever
changever:
	@find bin -type f -name ws -exec sed -i "" "s/VERSION=.*/VERSION=\"$(VERSION)\"/g" {} \;
	@git add bin/ws && git commit -m "Updated VERSION"

#:help: changelog   | Build the changelog
.PHONY: changelog
changelog:
	@git-chglog -o CHANGELOG.md --next-tag $(VERSION)
	@git add CHANGELOG.md && git commit -m "Updated CHANGELOG"

#:help: precommit   | Lint the project files using pre-commit
.PHONY: precommit
precommit:
	pre-commit run --all-files

#:help: release     | Release the product, setting the tag and pushing.
.PHONY: release
release:
	@semtag final -s minor
	@git push --follow-tags

objects = $(WS_PREFIX)/bin/ws $(WS_PREFIX)/etc/checkout-ws.once $(WS_PREFIX)/etc/golang.activation

$(WS_PREFIX)/bin/%: bin/%
	mkdir -p $(@D)
	cp -f $< $@

$(WS_PREFIX)/etc/%: etc/%
	mkdir -p $(@D)
	cp -f $< $@

$(objects):

#:help: install     | Installs the product, leaving the workspaces behind.
.PHONY: install
install: $(WS_PREFIX)/bin/ws $(objects)

#:help: uninstall   | Uninstalls the product, leaving the workspaces behind.
.PHONY: uninstall
uninstall:
	rm -f $(WS_PREFIX)/bin/ws

#:help: version     | Show the next version
.PHONY: version
version:
	@echo $(VERSION)
