init: submodules stow

submodules:
	git submodule update --init --recursive
	git submodule foreach git checkout master

update:
	git pull --recurse-submodules origin master

stow:
	./bin/stow -R dotfiles

unstow:
	./bin/stow -D dotfiles

.PHONY: stow
