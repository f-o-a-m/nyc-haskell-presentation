.PHONY: all install git pandoc

.DEFAULT_GOAL := help

THEME ?= "simple"
TRANSITION ?= "none"

help: ## Ask for help!
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: install
	@echo prereqs that are newer than install: $?
install:
	stack install pandoc

git: ## Update submodules
	git submodule init && git submodule update

pandoc: git ## Build the presentation
	cat 01_eth.md 02_ps.md 03_web3.md > index.md
	pandoc -t revealjs -s --slide-level 2 -o index.html -V theme=$(THEME) -V transition=$(TRANSITION) index.md
	rm -f index.md
