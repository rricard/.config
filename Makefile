SEARCH_DIRS := bin bash sh zsh _install

.PHONY: all shellcheck cram accept
all: shellcheck cram

cram:
	cram _tests/

accept:
	cram -i -y _tests/

shellcheck:
	shellcheck $$(grep -rIEl '^[#]!.*[/ ]sh' $(SEARCH_DIRS) --exclude-dir=vendored)
	shellcheck --shell=bash $$(grep -rIEl '^[#]!.*bash' $(SEARCH_DIRS) --exclude-dir=vendored)
	shellcheck --shell=bash $$(grep -rIEl '^[#]!.*zsh' $(SEARCH_DIRS) --exclude-dir=vendored)
