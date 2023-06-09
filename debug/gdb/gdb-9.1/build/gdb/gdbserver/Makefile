# Copyright (C) 1989-2020 Free Software Foundation, Inc.

# This file is part of GDB.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Please keep lists in this file sorted alphabetically, with one item per line.
# See gdb/Makefile.in for guidelines on ordering files and directories.

prefix = /home/koda.xu/github_prj/debug_tools/gdb/output/gdb-9.1/gcc_6.4.0
exec_prefix = ${prefix}

host_alias = arm-linux
target_alias = arm-linux
program_transform_name = s&^&arm-linux-gnueabihf-6.4.0-&
bindir = ${exec_prefix}/bin
libdir = ${exec_prefix}/lib
tooldir = $(libdir)/$(target_alias)

datarootdir = ${prefix}/share
datadir = ${datarootdir}
mandir = ${datarootdir}/man
man1dir = $(mandir)/man1
man2dir = $(mandir)/man2
man3dir = $(mandir)/man3
man4dir = $(mandir)/man4
man5dir = $(mandir)/man5
man6dir = $(mandir)/man6
man7dir = $(mandir)/man7
man8dir = $(mandir)/man8
man9dir = $(mandir)/man9
infodir = ${datarootdir}/info
htmldir = $(prefix)/html
includedir = ${prefix}/include
CONFIG_SRC_SUBDIR = arch gdbsupport

SHELL = /bin/sh
EXEEXT = 

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = /usr/bin/install -c
INSTALL_DATA = /usr/bin/install -c -m 644
RANLIB = true

CC = arm-linux-gnueabihf-gcc
CXX = arm-linux-gnueabihf-g++
CXX_DIALECT = 
AR = arm-linux-gnueabihf-ar
AR_FLAGS = rc

# Dependency tracking information.
DEPMODE = depmode=gcc3
DEPDIR = .deps
depcomp = $(SHELL) $(srcdir)/../../depcomp

# Directory containing source files.  Don't clean up the spacing,
# this exact string is matched for by the "configure" script.
srcdir = /home/koda.xu/github_prj/debug_tools/gdb/gdb-9.1/gdb/gdbserver
abs_top_srcdir = /home/koda.xu/github_prj/debug_tools/gdb/gdb-9.1/gdb/gdbserver
abs_srcdir = /home/koda.xu/github_prj/debug_tools/gdb/gdb-9.1/gdb/gdbserver
VPATH = /home/koda.xu/github_prj/debug_tools/gdb/gdb-9.1/gdb/gdbserver

include $(srcdir)/../silent-rules.mk

# Note that these are overridden by GNU make-specific code below if
# GNU make is used.  The overrides implement dependency tracking.
COMPILE.pre = $(CXX) -x c++ $(CXX_DIALECT)
COMPILE.post = -c -o $@
COMPILE = $(ECHO_CXX) $(COMPILE.pre) $(INTERNAL_CFLAGS) $(COMPILE.post)
POSTCOMPILE = @true

# It is also possible that you will need to add -I/usr/include/sys to the
# CFLAGS section if your system doesn't have fcntl.h in /usr/include (which
# is where it should be according to Posix).

# Set this up with gcc if you have gnu ld and the loader will print out
# line numbers for undefinded refs.
#CC_LD = g++ -static
CC_LD = $(CXX) $(CXX_DIALECT)

# Where is the "include" directory?  Traditionally ../include or ./include
INCLUDE_DIR = ${srcdir}/../../include
INCLUDE_DEP = $$(INCLUDE_DIR)

LIBIBERTY_BUILDDIR = build-libiberty-gdbserver
LIBIBERTY = $(LIBIBERTY_BUILDDIR)/libiberty.a

# Where is ust?  These will be empty if ust was not available.
ustlibs = 
ustinc = 

# gnulib
GNULIB_BUILDDIR = build-gnulib-gdbserver
LIBGNU = $(GNULIB_BUILDDIR)/import/libgnu.a
INCGNU = -I$(srcdir)/../../gnulib/import -I$(GNULIB_BUILDDIR)/import

# Generated headers in the gnulib directory.  These must be listed
# so that they are generated before other files are compiled.
GNULIB_H = $(GNULIB_BUILDDIR)/import/string.h 

# All the includes used for CFLAGS and for lint.
# -I. for config files.
# -I${srcdir} for our headers.
# -I$(srcdir)/../regformats for regdef.h.
#
# We do not include ../target or ../nat in here because headers
# in those directories should be included with the subdirectory.
# e.g.: "target/wait.h".
#
INCLUDE_CFLAGS = -I. -I${srcdir} \
	-I$(srcdir)/../regformats -I$(srcdir)/.. -I$(INCLUDE_DIR) \
	$(INCGNU)

# M{H,T}_CFLAGS, if defined, has host- and target-dependent CFLAGS
# from the config/ directory.
GLOBAL_CFLAGS = ${MT_CFLAGS} ${MH_CFLAGS}
#PROFILE_CFLAGS = -pg

WARN_CFLAGS =  -Wall -Wpointer-arith -Wno-unused -Wunused-value -Wunused-variable -Wunused-function -Wno-switch -Wno-char-subscripts -Wempty-body -Wunused-but-set-parameter -Wunused-but-set-variable -Wno-sign-compare -Wno-error=maybe-uninitialized -Wsuggest-override -Wduplicated-cond -Wformat -Wformat-nonliteral
WERROR_CFLAGS = 

WARN_CFLAGS_NO_FORMAT = `echo " $(WARN_CFLAGS) " \
		   | sed "s/ -Wformat-nonliteral / -Wno-format-nonliteral /g"`

# These are specifically reserved for setting from the command line
# when running make.  I.E.  "make CFLAGS=-Wmissing-prototypes".
CFLAGS = -g -O2
CXXFLAGS = -g -O2
CPPFLAGS = 

PTHREAD_CFLAGS = -pthread
PTHREAD_LIBS = 

# INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
INTERNAL_CFLAGS_BASE = ${CXXFLAGS} ${GLOBAL_CFLAGS} \
	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
INTERNAL_CFLAGS = ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER

# LDFLAGS is specifically reserved for setting from the command line
# when running make.
LDFLAGS =  
INTERNAL_LDFLAGS = $(LDFLAGS) -Wl,--dynamic-list=$(srcdir)/proc-service.list

# All source files that go into linking GDB remote server.

SFILES = \
	$(srcdir)/debug.c \
	$(srcdir)/dll.c \
	$(srcdir)/gdbreplay.c \
	$(srcdir)/hostio.c \
	$(srcdir)/hostio-errno.c \
	$(srcdir)/i387-fp.c \
	$(srcdir)/inferiors.c \
	$(srcdir)/linux-aarch64-low.c \
	$(srcdir)/linux-arm-low.c \
	$(srcdir)/linux-bfin-low.c \
	$(srcdir)/linux-cris-low.c \
	$(srcdir)/linux-crisv32-low.c \
	$(srcdir)/linux-ia64-low.c \
	$(srcdir)/linux-low.c \
	$(srcdir)/linux-m32r-low.c \
	$(srcdir)/linux-m68k-low.c \
	$(srcdir)/linux-mips-low.c \
	$(srcdir)/linux-nios2-low.c \
	$(srcdir)/linux-ppc-low.c \
	$(srcdir)/linux-s390-low.c \
	$(srcdir)/linux-sh-low.c \
	$(srcdir)/linux-sparc-low.c \
	$(srcdir)/linux-tile-low.c \
	$(srcdir)/linux-x86-low.c \
	$(srcdir)/linux-xtensa-low.c \
	$(srcdir)/mem-break.c \
	$(srcdir)/proc-service.c \
	$(srcdir)/proc-service.list \
	$(srcdir)/regcache.c \
	$(srcdir)/remote-utils.c \
	$(srcdir)/server.c \
	$(srcdir)/symbol.c \
	$(srcdir)/target.c \
	$(srcdir)/thread-db.c \
	$(srcdir)/utils.c \
	$(srcdir)/win32-arm-low.c \
	$(srcdir)/win32-i386-low.c \
	$(srcdir)/win32-low.c \
	$(srcdir)/wincecompat.c \
	$(srcdir)/x86-low.c \
	$(srcdir)/arch/arm.c \
	$(srcdir)/arch/arm-get-next-pcs.c \
	$(srcdir)/arch/arm-linux.c \
	$(srcdir)/arch/ppc-linux-common.c \
	$(srcdir)/../alloc.c \
	$(srcdir)/gdbsupport/btrace-common.c \
	$(srcdir)/gdbsupport/buffer.c \
	$(srcdir)/gdbsupport/cleanups.c \
	$(srcdir)/gdbsupport/common-debug.c \
	$(srcdir)/gdbsupport/common-exceptions.c \
	$(srcdir)/gdbsupport/common-inferior.c \
	$(srcdir)/gdbsupport/common-regcache.c \
	$(srcdir)/gdbsupport/common-utils.c \
	$(srcdir)/gdbsupport/errors.c \
	$(srcdir)/gdbsupport/environ.c \
	$(srcdir)/gdbsupport/fileio.c \
	$(srcdir)/gdbsupport/filestuff.c \
	$(srcdir)/gdbsupport/job-control.c \
	$(srcdir)/gdbsupport/gdb-dlfcn.c \
	$(srcdir)/gdbsupport/gdb_tilde_expand.c \
	$(srcdir)/gdbsupport/gdb_vecs.c \
	$(srcdir)/gdbsupport/netstuff.c \
	$(srcdir)/gdbsupport/new-op.c \
	$(srcdir)/gdbsupport/pathstuff.c \
	$(srcdir)/gdbsupport/print-utils.c \
	$(srcdir)/gdbsupport/ptid.c \
	$(srcdir)/gdbsupport/rsp-low.c \
	$(srcdir)/gdbsupport/safe-strerror.c \
	$(srcdir)/gdbsupport/tdesc.c \
	$(srcdir)/gdbsupport/xml-utils.c \
	$(srcdir)/nat/aarch64-sve-linux-ptrace.c \
	$(srcdir)/nat/linux-btrace.c \
	$(srcdir)/nat/linux-namespaces.c \
	$(srcdir)/nat/linux-osdata.c \
	$(srcdir)/nat/linux-personality.c \
	$(srcdir)/nat/mips-linux-watch.c \
	$(srcdir)/nat/ppc-linux.c \
	$(srcdir)/nat/fork-inferior.c \
	$(srcdir)/target/waitstatus.c

DEPFILES =  linux-low.o linux-osdata.o linux-procfs.o linux-ptrace.o linux-waitpid.o linux-personality.o linux-namespaces.o fork-child.o fork-inferior.o linux-arm-low.o linux-arm-tdesc.o linux-aarch32-low.o linux-aarch32-tdesc.o arch/aarch32.o arch/arm.o arch/arm-linux.o arch/arm-get-next-pcs.o hostio-errno.o thread-db.o proc-service.o 

LIBOBJS = 

SOURCES = $(SFILES)
TAGFILES = $(SOURCES) ${HFILES} ${ALLPARAM} ${POSSLIBS}

OBS = \
	alloc.o \
	ax.o \
	gdbsupport/agent.o \
	gdbsupport/btrace-common.o \
	gdbsupport/buffer.o \
	gdbsupport/cleanups.o \
	gdbsupport/common-debug.o \
	gdbsupport/common-exceptions.o \
	gdbsupport/common-inferior.o \
	gdbsupport/job-control.o \
	gdbsupport/common-regcache.o \
	gdbsupport/common-utils.o \
	gdbsupport/errors.o \
	gdbsupport/environ.o \
	gdbsupport/fileio.o \
	gdbsupport/filestuff.o \
	gdbsupport/format.o \
	gdbsupport/gdb-dlfcn.o \
	gdbsupport/gdb_tilde_expand.o \
	gdbsupport/gdb_vecs.o \
	gdbsupport/netstuff.o \
	gdbsupport/new-op.o \
	gdbsupport/pathstuff.o \
	gdbsupport/print-utils.o \
	gdbsupport/ptid.o \
	gdbsupport/rsp-low.o \
	gdbsupport/safe-strerror.o \
	gdbsupport/signals.o \
	gdbsupport/signals-state-save-restore.o \
	gdbsupport/tdesc.o \
	gdbsupport/xml-utils.o \
	debug.o \
	dll.o \
	event-loop.o \
	hostio.o \
	inferiors.o \
	mem-break.o \
	notif.o \
	regcache.o \
	remote-utils.o \
	server.o \
	symbol.o \
	target.o \
	tdesc.o \
	tracepoint.o \
	utils.o \
	version.o \
	waitstatus.o \
	$(DEPFILES) \
	$(LIBOBJS) \
	$(XML_BUILTIN)

GDBREPLAY_OBS = \
	gdbsupport/cleanups.o \
	gdbsupport/common-exceptions.o \
	gdbsupport/common-utils.o \
	gdbsupport/rsp-low.o \
	gdbsupport/errors.o \
	gdbsupport/netstuff.o \
	gdbsupport/print-utils.o \
	gdbsupport/safe-strerror.o \
	gdbreplay.o \
	utils.o \
	version.o

GDBSERVER_LIBS = -ldl $(PTHREAD_LIBS)
XM_CLIBS = 
CDEPS = $(srcdir)/proc-service.list

# XML files to compile in to gdbserver, if any.
XML_DIR = $(srcdir)/../features
XML_FILES = 
XML_BUILTIN = 

IPA_DEPFILES = 
extra_libraries = 

SUBDIRS = $(GNULIB_BUILDDIR) $(LIBIBERTY_BUILDDIR)
CLEANDIRS = $(SUBDIRS)

# List of subdirectories in the build tree that must exist.
# This is used to force build failures in existing trees when
# a new directory is added.
# The format here is for the `case' shell command.
REQUIRED_SUBDIRS = $(GNULIB_BUILDDIR) | $(LIBIBERTY_BUILDDIR)

FLAGS_TO_PASS = \
	"prefix=$(prefix)" \
	"exec_prefix=$(exec_prefix)" \
	"infodir=$(infodir)" \
	"datarootdir=$(datarootdir)" \
	"docdir=$(docdir)" \
	"htmldir=$(htmldir)" \
	"pdfdir=$(pdfdir)" \
	"libdir=$(libdir)" \
	"mandir=$(mandir)" \
	"datadir=$(datadir)" \
	"includedir=$(includedir)" \
	"against=$(against)" \
	"DESTDIR=$(DESTDIR)" \
	"AR=$(AR)" \
	"AR_FLAGS=$(AR_FLAGS)" \
	"CC=$(CC)" \
	"CFLAGS=$(CFLAGS)" \
	"CXX=$(CXX)" \
	"CXXFLAGS=$(CXXFLAGS)" \
	"DLLTOOL=$(DLLTOOL)" \
	"LDFLAGS=$(LDFLAGS)" \
	"RANLIB=$(RANLIB)" \
	"MAKEINFO=$(MAKEINFO)" \
	"MAKEHTML=$(MAKEHTML)" \
	"MAKEHTMLFLAGS=$(MAKEHTMLFLAGS)" \
	"INSTALL=$(INSTALL)" \
	"INSTALL_PROGRAM=$(INSTALL_PROGRAM)" \
	"INSTALL_DATA=$(INSTALL_DATA)" \
	"RUNTEST=$(RUNTEST)" \
	"RUNTESTFLAGS=$(RUNTESTFLAGS)"

# All generated files which can be included by another file.
generated_files = config.h $(GNULIB_H)

all: gdbserver$(EXEEXT) gdbreplay$(EXEEXT) $(extra_libraries)
	@$(MAKE) $(FLAGS_TO_PASS) DO=$@ "DODIRS=$(SUBDIRS)" subdir_do

# Traditionally "install" depends on "all".  But it may be useful
# not to; for example, if the user has made some trivial change to a
# source file and doesn't care about rebuilding or just wants to save the
# time it takes for make to check that all is up to date.
# install-only is intended to address that need.
install: all
	@$(MAKE) $(FLAGS_TO_PASS) install-only

install-only:
	n=`echo gdbserver | sed '$(program_transform_name)'`; \
	if [ x$$n = x ]; then n=gdbserver; else true; fi; \
	if [ x"$(IPA_DEPFILES)" != x ]; then \
		$(SHELL) $(srcdir)/../../mkinstalldirs $(DESTDIR)$(libdir); \
		$(INSTALL_PROGRAM) $(IPA_LIB) $(DESTDIR)$(libdir)/$(IPA_LIB); \
	fi; \
	$(SHELL) $(srcdir)/../../mkinstalldirs $(DESTDIR)$(bindir); \
	$(INSTALL_PROGRAM) gdbserver$(EXEEXT) $(DESTDIR)$(bindir)/$$n$(EXEEXT)
	# Note that we run install and not install-only, as the latter
	# is not part of GNU standards and in particular not provided
	# in libiberty.
	@$(MAKE) $(FLAGS_TO_PASS) DO=install "DODIRS=$(SUBDIRS)" subdir_do

uninstall: force
	n=`echo gdbserver | sed '$(program_transform_name)'`; \
	if [ x$$n = x ]; then n=gdbserver; else true; fi; \
	rm -f $(DESTDIR)/$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(man1dir)/$$n.1
	@$(MAKE) $(FLAGS_TO_PASS) DO=$@ "DODIRS=$(SUBDIRS)" subdir_do

installcheck:
check:
info dvi pdf:
install-info:
install-pdf:
html:
install-html:
clean-info: force
	@$(MAKE) $(FLAGS_TO_PASS) DO=$@ "DODIRS=$(SUBDIRS)" subdir_do

gdbserver$(EXEEXT): $(sort $(OBS)) ${CDEPS} $(LIBGNU) $(LIBIBERTY)
	$(SILENCE) rm -f gdbserver$(EXEEXT)
	$(ECHO_CXXLD) $(CC_LD) $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
		-o gdbserver$(EXEEXT) $(OBS) $(LIBGNU) $(LIBIBERTY) \
		$(GDBSERVER_LIBS) $(XM_CLIBS)

$(LIBGNU) $(LIBIBERTY) $(GNULIB_H): all-lib
all-lib: $(GNULIB_BUILDDIR)/Makefile $(LIBIBERTY_BUILDDIR)/Makefile
	@$(MAKE) $(FLAGS_TO_PASS) DO=all DODIRS="$(SUBDIRS)" subdir_do
.PHONY: all-lib

gdbreplay$(EXEEXT): $(sort $(GDBREPLAY_OBS)) $(LIBGNU) $(LIBIBERTY)
	$(SILENCE) rm -f gdbreplay$(EXEEXT)
	$(ECHO_CXXLD) $(CC_LD) $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
		-o gdbreplay$(EXEEXT) $(GDBREPLAY_OBS) $(XM_CLIBS) $(LIBGNU) \
		$(LIBIBERTY)

IPA_OBJS = \
	alloc-ipa.o \
	ax-ipa.o \
	gdbsupport/common-utils-ipa.o \
	gdbsupport/errors-ipa.o \
	gdbsupport/format-ipa.o \
	gdbsupport/print-utils-ipa.o \
	gdbsupport/rsp-low-ipa.o \
	gdbsupport/safe-strerror-ipa.o \
	gdbsupport/tdesc-ipa.o \
	regcache-ipa.o \
	remote-utils-ipa.o \
	tdesc-ipa.o \
	tracepoint-ipa.o \
	utils-ipa.o \
	${IPA_DEPFILES}

IPA_LIB = libinproctrace.so

$(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
	$(SILENCE) rm -f $(IPA_LIB)
	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread

# Put the proper machine-specific files first, so M-. on a machine
# specific routine gets the one for the correct machine.
# The xyzzy stuff below deals with empty DEPFILES
TAGS:	${TAGFILES}
	etags `find ${srcdir}/../config -name $(DEPRECATED_TM_FILE) -print` \
	  `find ${srcdir}/../config -name ${XM_FILE} -print` \
	  `find ${srcdir}/../config -name ${NAT_FILE} -print` \
	  `for i in yzzy ${DEPFILES}; do \
	     if [ x$$i != xyzzy ]; then \
	       echo ${srcdir}/$$i | sed -e 's/\.o$$/\.c/' ; \
	     fi; \
	   done` \
	  ${TAGFILES}
tags: TAGS

clean:
	rm -f *.o ${ADD_FILES} *~
	rm -f gdbserver$(EXEEXT) gdbreplay$(EXEEXT) core make.log
	rm -f $(IPA_LIB)
	rm -f *-generated.c
	rm -f stamp-xml
	rm -f $(DEPDIR)/*.Po
	for i in $(CONFIG_SRC_SUBDIR); do \
		rm -f $$i/*.o;	\
		rm -f $$i/$(DEPDIR)/*; \
	done
	@$(MAKE) $(FLAGS_TO_PASS) DO=$@ "DODIRS=$(SUBDIRS)" subdir_do

maintainer-clean realclean distclean: clean
	@$(MAKE) $(FLAGS_TO_PASS) DO=$@ "DODIRS=$(SUBDIRS)" subdir_do
	rm -rf $(GNULIB_BUILDDIR)
	rm -f Makefile config.status config.h stamp-h config.log
	rm -f Makefile
	for i in $(CONFIG_SRC_SUBDIR); do \
		rmdir $$i/$(DEPDIR); \
	done

subdir_do: force
	@for i in $(DODIRS); do \
		case $$i in \
		$(REQUIRED_SUBDIRS)) \
			if [ ! -f ./$$i/Makefile ] ; then \
				echo "Missing $$i/Makefile" >&2 ; \
				exit 1 ; \
			fi ;; \
		esac ; \
		if [ -f ./$$i/Makefile ] ; then \
			if (cd ./$$i; \
				$(MAKE) $(FLAGS_TO_PASS) $(DO)) ; then true ; \
			else exit 1 ; fi ; \
		else true ; fi ; \
	done

config.h: stamp-h ; @true
stamp-h: config.in config.status
	$(SHELL) ./config.status config.h

Makefile: Makefile.in config.status
	$(SHELL) ./config.status $@

$(GNULIB_BUILDDIR)/Makefile: $(srcdir)/../../gnulib/Makefile.in config.status
	  @cd $(GNULIB_BUILDDIR); CONFIG_FILES="Makefile" \
	  CONFIG_COMMANDS="depfiles" \
	  CONFIG_HEADERS= \
	  CONFIG_LINKS= \
	  $(SHELL) config.status

config.status: configure configure.srv $(srcdir)/../../bfd/development.sh
	$(SHELL) ./config.status --recheck

# automatic rebuilding in automake-generated Makefiles requires
# this rule in the toplevel Makefile, which, with GNU make, causes
# the desired updates through the implicit regeneration of the Makefile
# and all of its prerequisites.
am--refresh:
	@:

force:

version-generated.c: Makefile $(srcdir)/../version.in $(srcdir)/../../bfd/version.h $(srcdir)/../gdbsupport/create-version.sh
	$(ECHO_GEN) $(SHELL) $(srcdir)/../gdbsupport/create-version.sh $(srcdir)/.. \
		$(host_alias) $(target_alias) $@

xml-builtin-generated.c: stamp-xml; @true
stamp-xml: $(XML_DIR)/feature_to_c.sh Makefile $(XML_FILES)
	$(SILENCE) rm -f xml-builtin.tmp
	$(ECHO_GEN_XML_BUILTIN_GENERATED) $(SHELL) $(XML_DIR)/feature_to_c.sh \
		xml-builtin.tmp $(XML_FILES)
	$(SILENCE) $(SHELL) $(srcdir)/../../move-if-change xml-builtin.tmp xml-builtin-generated.c
	$(SILENCE) echo stamp > stamp-xml

.PRECIOUS: xml-builtin.c

# GNU Make has an annoying habit of putting *all* the Makefile variables
# into the environment, unless you include this target as a circumvention.
# Rumor is that this will be fixed (and this target can be removed)
# in GNU Make 4.0.
.NOEXPORT:

# GNU Make 3.63 has a different problem: it keeps tacking command line
# overrides onto the definition of $(MAKE).  This variable setting
# will remove them.
MAKEOVERRIDES =

regdat_sh = $(srcdir)/../regformats/regdat.sh

UST_CFLAGS = $(ustinc) -DCONFIG_UST_GDB_INTEGRATION

# Undo gnulib replacements for the IPA shared library build.
# The gnulib headers are still needed, but gnulib is not linked
# into the IPA lib so replacement apis don't work.
UNDO_GNULIB_CFLAGS = -Drpl_strerror_r=strerror_r

# Note, we only build the IPA if -fvisibility=hidden is supported in
# the first place.
IPAGENT_CFLAGS = $(INTERNAL_CFLAGS) $(UST_CFLAGS) \
	$(UNDO_GNULIB_CFLAGS) \
	-fPIC -DIN_PROCESS_AGENT \
	-fvisibility=hidden

IPAGENT_COMPILE = $(ECHO_CXX) $(COMPILE.pre) $(IPAGENT_CFLAGS) $(COMPILE.post)

# Rules for special cases.

ax-ipa.o: ax.c
	$(IPAGENT_COMPILE) $(WARN_CFLAGS_NO_FORMAT) $<
	$(POSTCOMPILE)

ax.o: ax.c
	$(COMPILE) $(WARN_CFLAGS_NO_FORMAT) $<
	$(POSTCOMPILE)

alloc-ipa.o: ../alloc.c
	$(IPAGENT_COMPILE) $(WARN_CFLAGS_NO_FORMAT) $<
	$(POSTCOMPILE)

# Rules for objects that go in the in-process agent.

arch/%-ipa.o: ../arch/%.c
	$(IPAGENT_COMPILE) $<
	$(POSTCOMPILE)

gdbsupport/%-ipa.o: ../gdbsupport/%.c
	$(IPAGENT_COMPILE) $<
	$(POSTCOMPILE)

%-ipa.o: %-generated.c
	$(IPAGENT_COMPILE) $<
	$(POSTCOMPILE)

%-ipa.o: %.c
	$(IPAGENT_COMPILE) $<
	$(POSTCOMPILE)

# Note: Between two matching pattern rules, GNU Make 3.81 chooses the first one.
# Therefore, this one needs to be before "%.o: %.c" for it to be considered for
# files such as linux-amd64-ipa.o generated from linux-amd64-ipa.c.
#
# Later versions of GNU Make choose the rule with the shortest stem, so it would
# work in any order.

%-ipa.o: %-ipa.c
	$(IPAGENT_COMPILE) $<
	$(POSTCOMPILE)

# Rules for objects that go in the gdbserver binary.

arch/%.o: ../arch/%.c
	$(COMPILE) $<
	$(POSTCOMPILE)

gdbsupport/%.o: ../gdbsupport/%.c
	$(COMPILE) $<
	$(POSTCOMPILE)

%.o: %-generated.c
	$(COMPILE) $<
	$(POSTCOMPILE)

%.o: %.c
	$(COMPILE) $<
	$(POSTCOMPILE)

%.o: ../nat/%.c
	$(COMPILE) $<
	$(POSTCOMPILE)

%.o: ../target/%.c
	$(COMPILE) $<
	$(POSTCOMPILE)

%.o: ../%.c
	$(COMPILE) $<
	$(POSTCOMPILE)

# Rules for register format descriptions.  Suffix destination files with
# -generated to identify and clean them easily.

%-generated.c: ../regformats/%.dat | $(regdat_sh)
	$(ECHO_REGDAT) $(SHELL) $(regdat_sh) $< $@

%-generated.c: ../regformats/arm/%.dat | $(regdat_sh)
	$(ECHO_REGDAT) $(SHELL) $(regdat_sh) $< $@

%-generated.c: ../regformats/i386/%.dat | $(regdat_sh)
	$(ECHO_REGDAT) $(SHELL) $(regdat_sh) $< $@

%-generated.c: ../regformats/rs6000/%.dat | $(regdat_sh)
	$(ECHO_REGDAT) $(SHELL) $(regdat_sh) $< $@

#
# Dependency tracking.
#

ifeq ($(DEPMODE),depmode=gcc3)
# Note that we put the dependencies into a .Tpo file, then move them
# into place if the compile succeeds.  We need this because gcc does
# not atomically write the dependency output file.
override COMPILE.post = -c -o $@ -MT $@ -MMD -MP \
	-MF $(@D)/$(DEPDIR)/$(basename $(@F)).Tpo
override POSTCOMPILE = @mv $(@D)/$(DEPDIR)/$(basename $(@F)).Tpo \
	$(@D)/$(DEPDIR)/$(basename $(@F)).Po
else
override COMPILE.pre = source='$<' object='$@' libtool=no \
	DEPDIR=$(DEPDIR) $(DEPMODE) $(depcomp) \
	$(CXX) -x c++ $(CXX_DIALECT)
# depcomp handles atomicity for us, so we don't need a postcompile
# step.
override POSTCOMPILE =
endif

# A list of all the objects we might care about in this build, for
# dependency tracking.
all_object_files = $(OBS) $(GDBREPLAY_OBS) $(IPA_OBJS)

# Ensure that generated files are created early.  Use order-only
# dependencies if available.  They require GNU make 3.80 or newer,
# and the .VARIABLES variable was introduced at the same time.
ifdef .VARIABLES
$(all_object_files): | $(generated_files)
else
$(all_object_files) : $(generated_files)
endif

# All the .deps files to include.
all_deps_files = $(foreach dep,$(patsubst %.o,%.Po,$(all_object_files)),\
		   $(dir $(dep))/$(DEPDIR)/$(notdir $(dep)))

# Dependencies.
-include $(all_deps_files)

# Disable implicit make rules.
include $(srcdir)/../disable-implicit-rules.mk

# Do not delete intermediate files (e.g. *-generated.c).
.SECONDARY:

# This is the end of "Makefile.in".
