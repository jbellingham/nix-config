.PHONY: default
default: update

.PHONY: update
update:
	sudo nixos-rebuild switch

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: space
space:
	./scripts/trim-generations.sh