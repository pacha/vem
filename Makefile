
installation_dir=/usr/local/share/vem10
installation_symlink=/usr/local/share/vem
bin_dir=/usr/local/bin

script_src=bin/vem
script_dst=$(bin_dir)/vem
gui_script_src=bin/gvem
gui_script_dst=$(bin_dir)/gvem

.PHONY: all
all:
	@echo "Use 'make install' to install Vem"

install:
	mkdir -p $(installation_dir)
	cp -r * $(installation_dir)/
	ln -sf $(installation_dir) $(installation_symlink)
	sed 's_VEMPATH_$(installation_symlink)_' $(script_src) > $(script_dst)
	chmod +x $(script_dst)
	sed 's_VEMPATH_$(installation_symlink)_' $(gui_script_src) > $(gui_script_dst)
	chmod +x $(gui_script_dst)

.PHONY: clean
clean :
	-rm -f $(script_dst) $(gui_script_dst) $(installation_symlink)
	-rm -fr $(installation_dir)

