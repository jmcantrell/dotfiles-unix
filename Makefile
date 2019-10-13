init: submodules stow

submodules:
	git submodule update --init --recursive
	git submodule foreach git checkout master

update:
	git pull --recurse-submodules origin master

stow:
	stow --no-folding -d stow -t ~ -R dotfiles

unstow:
	stow --no-folding -d stow -t ~ -D dotfiles

.PHONY: stow
