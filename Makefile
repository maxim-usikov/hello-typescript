SHELL     =   /bin/sh
NPM       :=  npm
TSC       :=  ./node_modules/.bin/tsc
TSCFLAGS  :=  --types --declaration --declarationMap --sourceMap --pretty --outDir lib-cjs/
src       :=  $(shell find src -type f 2>/dev/null)

.SUFFIXES:
.SUFFIXES: .ts
.PHONY: clean cleanall

all: node_modules build

build: lib-cjs

lib-cjs: $(src)
	@echo "### Compile sources"
	$(TSC) $(TSCFLAGS)

node_modules: package*.json
	@echo "### Install dependencies"
	$(NPM) install

clean:
	@echo "### Clean"
	rm -vrf lib-cjs

cleanall: clean
	@echo "### Clean All"
	rm -vrf node_modules
