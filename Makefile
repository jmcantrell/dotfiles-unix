stow:
	stow --no-folding -d . -t $$HOME -R stow
unstow:
	stow --no-folding -d . -t $$HOME -D stow
