
VERSION=0.1.1
UGLIFY_BIN:=./node_modules/uglify-js/bin/uglifyjs

FULL:=gist-in-tumblr-full.v$(VERSION).min.js
PARTIAL:=gist-in-tumblr-partial.v$(VERSION).min.js
define BOILERPLATE
echo "/** \n\
 * gist-in-tumblr \n\
 * \n\
 * Copyright (C) 2012 Robert Martin <rdmartin3@gmail.com> \n\
 * Version: $(VERSION) \n\
 */"
endef




.PHONY: all full partial clean $(UGLIFY_BIN)

all: full partial

full: out/$(FULL)
partial: out/$(PARTIAL)
clean:
	rm -rf tmp out

out/$(FULL): tmp/writeCapture.min.js tmp/jquery.writeCapture.min.js tmp/gist-in-tumblr.min.js
	@mkdir -p out
	@echo "  Making $(FULL)"
	@$(BOILERPLATE) >$@
	@cat $^ >>$@

out/$(PARTIAL): tmp/gist-in-tumblr.min.js
	@mkdir -p out
	@echo "  Making $(PARTIAL)"
	@$(BOILERPLATE) >$@
	@cat $^ >>$@

tmp/writeCapture.min.js: writeCapture.js
	@mkdir -p tmp
	@echo "  Compressing $< into $@"
	@$(UGLIFY_BIN) --no-copyright --output $@ $<

tmp/jquery.writeCapture.min.js: jquery.writeCapture.js
	@mkdir -p tmp
	@echo "  Compressing $< into $@"
	@$(UGLIFY_BIN) --no-copyright --output $@ $<

tmp/gist-in-tumblr.min.js: gist-in-tumblr.js
	@mkdir -p tmp
	@echo "  Compressing $< into $@"
	@$(UGLIFY_BIN) --no-copyright --output $@ $<

$(UGLIFY_BIN):
	@if [ ! -x $(UGLIFY_BIN) ]; then \
	echo; \
	echo "  Could not find 'uglifyjs' at: $(UGLIFY_BIN)"; \
	echo "  You probably want to do 'npm install uglify-js' to put it there."; \
	echo; \
	exit 1; \
	fi

