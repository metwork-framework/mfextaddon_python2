include ../../../adm/root.mk
include $(MFEXT_HOME)/share/simple_layer.mk

all:: $(PREFIX)/lib/python$(PYTHON2_SHORT_VERSION)/site-packages/requirements2.txt

$(PREFIX)/lib/python$(PYTHON2_SHORT_VERSION)/site-packages/requirements2.txt:
	pip freeze >$@
