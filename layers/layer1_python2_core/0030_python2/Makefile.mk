include ../../../adm/root.mk
include $(MFEXT_HOME)/share/package.mk

export NAME=Python
export VERSION=2.7.18
export EXTENSION=tar.xz
export CHECKTYPE=MD5
export CHECKSUM=fd6cc8ec0a78c44036f825e739f36e5a
DESCRIPTION=\
Python is an interpreted, object-oriented, high-level programming language.
WEBSITE=http://python.org/
LICENSE=Python

all:: $(PREFIX)/bin/python $(PREFIX)/share/python2_version $(PREFIX)/share/python2_short_version
$(PREFIX)/bin/python:
	make --file=$(MFEXT_HOME)/share/Makefile.standard EXTRACFLAGS="-I$(PREFIX)/../core/include" EXTRALDFLAGS="-L$(PREFIX)/../core/lib" OPTIONS='--enable-shared --with-system-ffi' download uncompress configure build install

$(PREFIX)/share/python2_version:
	if ! test -d $(PREFIX)/share; then mkdir -p $(PREFIX)/share; fi
	python2 --version 2>&1 |awk '{print $$2;}' >$@

$(PREFIX)/share/python2_short_version: $(PREFIX)/share/python2_version
	cat $< |awk -F '.' '{print $$1"."$$2;}' >$@
