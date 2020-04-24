.PHONY: changever changelog release

VERSION:=$(shell semtag final -s minor -o)

changever:
	find bin -type f -name ws -exec sed -i "" "s/VERSION=.*/VERSION=\"$(VERSION)\"/g" {} \;
	git add bin/ws && git commit -m "Updated VERSION"

changelog:
	git-chglog -o CHANGELOG.md --next-tag $(VERSION)
	git add CHANGELOG.md && git commit -m "Updated CHANGELOG"

release:
	semtag final -s minor
	git push --follow-tags
