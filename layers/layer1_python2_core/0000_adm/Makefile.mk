BINS=freeze_requirements download_compile_requirements install_requirements unsafe_pip python3_wrapper

include ../../../adm/root.mk
include $(MFEXT_HOME)/share/simple_layer.mk

all:: $(PREFIX)/bin/python3

$(PREFIX)/bin/python3:
	cd $(PREFIX)/bin && ln -s python3_wrapper python3

freeze_requirements: $(MFEXT_HOME)/opt/python3_core/bin/freeze_requirements
	ln -s $< $@

download_compile_requirements: $(MFEXT_HOME)/opt/python3_core/bin/download_compile_requirements
	ln -s $< $@

install_requirements: $(MFEXT_HOME)/opt/python3_core/bin/install_requirements
	ln -s $< $@

unsafe_pip: $(MFEXT_HOME)/opt/python3_core/bin/unsafe_pip
	ln -s $< $@

