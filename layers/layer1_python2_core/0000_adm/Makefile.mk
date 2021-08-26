BINS=freeze_requirements download_compile_requirements install_requirements unsafe_pip python3_wrapper git
TO_WRAP=plugin_wrapper plugins.list plugins.info plugins.hash plugins.check _plugins.init _plugins.make _plugins.develop plugins.install plugins.uninstall plugins_validate_name
TO_WRAP_TARGETS=$(addprefix $(PREFIX)/bin/,$(TO_WRAP))

include ../../../adm/root.mk
include $(MFEXT_HOME)/share/simple_layer.mk

all:: $(PREFIX)/bin/python3 $(TO_WRAP_TARGETS)

$(PREFIX)/bin/python3:
	cd $(PREFIX)/bin && ln -s python3_wrapper python3

$(PREFIX)/bin/%:
	echo "#!/bin/bash" >>$@
	echo "# python3 wrapper as mfplugin is python3 only" >>$@
	echo 'layer_wrapper --layers="python3@mfext" -- '`basename $@`' "$$@"' >>$@
	chmod +x $@

freeze_requirements: $(MFEXT_HOME)/opt/python3_core/bin/freeze_requirements
	ln -s $< $@

download_compile_requirements: $(MFEXT_HOME)/opt/python3_core/bin/download_compile_requirements
	ln -s $< $@

install_requirements: $(MFEXT_HOME)/opt/python3_core/bin/install_requirements
	ln -s $< $@

unsafe_pip: $(MFEXT_HOME)/opt/python3_core/bin/unsafe_pip
	ln -s $< $@

git: $(MFEXT_HOME)/opt/python3_core/bin/git
	ln -s $< $@

