init: submodules stow

submodules:
	git submodule update --init --recursive

update:
	git pull --recurse-submodules

stow:
	stow --no-folding -d stow -t ~ -R dotfiles

unstow:
	stow --no-folding -d stow -t ~ -D dotfiles

.PHONY: stow
