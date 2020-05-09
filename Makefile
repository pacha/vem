
installation_dir=/usr/local/share/vem10
installation_symlink=/usr/local/share/vem
bin_dir=/usr/local/bin

scripts=vem gvem nvem

.PHONY: all
all:
	@echo "Use 'make install' to install Vem"

install: $(installation_dir) $(scripts)

.PHONY: $(installation_dir)
$(installation_dir):
	mkdir -p $@
	cp -r * $@/
	ln -sf $@ $(installation_symlink)

$(scripts):
	sed 's_VEMPATH_$(installation_symlink)_' bin/$@ > $(bin_dir)/$@
	chmod +x $(bin_dir)/$@

.PHONY: clean
clean:
	-rm -f $(script_dst) $(gui_script_dst) $(installation_symlink)
	-rm -fr $(installation_dir)

