
all:
	make -C buildroot

$(MAKECMDGOALS):
	make -C buildroot $(MAKECMDGOALS)

.PHONY: $(MAKECMDGOALS)
