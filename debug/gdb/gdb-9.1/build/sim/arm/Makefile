#    Makefile template for Configure for the arm sim library.
#    Copyright 1995-2020 Free Software Foundation, Inc.
#    Written by Cygnus Support.
# 
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

## COMMON_PRE_CONFIG_FRAG
## COMMON_PRE_CONFIG_FRAG

VPATH = /home/koda.xu/github_prj/debug_tools/gdb/gdb-9.1/sim/arm:$(srccom)
srcdir = /home/koda.xu/github_prj/debug_tools/gdb/gdb-9.1/sim/arm
srccom = $(srcdir)/../common
srcroot = $(srcdir)/../..
srcsim = $(srcdir)/..

prefix = /home/koda.xu/github_prj/debug_tools/gdb/output/gdb-9.1/gcc_6.4.0
exec_prefix = ${prefix}

host_alias = arm-linux
target_alias = arm-linux
program_transform_name = s&^&arm-linux-gnueabihf-6.4.0-&
bindir = ${exec_prefix}/bin

libdir = ${exec_prefix}/lib
tooldir = $(libdir)/$(target_alias)

datadir = ${datarootdir}
datarootdir = ${prefix}/share
mandir = ${datarootdir}/man
man1dir = $(mandir)/man1
infodir = ${datarootdir}/info
includedir = ${prefix}/include

lt_cv_dlopen_libs = 
# This can be referenced by the gettext configuration code.
top_builddir = ..

EXEEXT = 
SHELL = /bin/sh

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = /usr/bin/install -c
INSTALL_DATA = /usr/bin/install -c -m 644

CC = arm-linux-gnueabihf-gcc
CC_FOR_BUILD = gcc
CFLAGS = -g -O2
CPPFLAGS = 
CXXFLAGS = @CXXFLAGS@
LDFLAGS =  

SIM_ALIGNMENT = -DWITH_DEFAULT_ALIGNMENT=STRICT_ALIGNMENT
SIM_BITSIZE = 
SIM_DEFAULT_MODEL = 
SIM_ENDIAN = 
SIM_FLOAT = 
SIM_HW_CFLAGS = 
SIM_HW_OBJS = 
SIM_HW = 
SIM_INLINE = -DDEFAULT_INLINE=0
SIM_RESERVED_BITS = 
SIM_SCACHE = 
WARN_CFLAGS =  -Wall -Wdeclaration-after-statement -Wpointer-arith -Wpointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -Wmissing-parameter-type -Wold-style-declaration -Wold-style-definition -Wformat-nonliteral
WERROR_CFLAGS = 
SIM_WARN_CFLAGS = $(WARN_CFLAGS)
SIM_WERROR_CFLAGS = $(WERROR_CFLAGS)

HDEFINES = 
TDEFINES =

AR = arm-linux-gnueabihf-ar
AR_FLAGS = rc
RANLIB = true
MAKEINFO = makeinfo

# Dependency tracking information.
DEPMODE = depmode=gcc3
DEPDIR = .deps
depcomp = $(SHELL) $(srcroot)/depcomp

# Note that these are overridden by GNU make-specific code below if
# GNU make is used.  The overrides implement dependency tracking.
COMPILE.pre = $(CC)
COMPILE.post = -c -o $@
COMPILE = $(COMPILE.pre) $(ALL_CFLAGS) $(COMPILE.post)
POSTCOMPILE = @true

# Each simulator's Makefile.in defines one or more of these variables
# to override our settings as necessary.  There is no need to define these
# in the simulator's Makefile.in if one is using the default value.  In fact
# it's preferable not to.

# List of object files, less common parts.
SIM_OBJS =
# List of extra dependencies.
# Generally this consists of simulator specific files included by sim-main.h.
SIM_EXTRA_DEPS =
# List of flags to always pass to $(CC).
SIM_EXTRA_CFLAGS =
# List of extra libraries to link with.
SIM_EXTRA_LIBS =
# List of extra program dependencies.
SIM_EXTRA_LIBDEPS =
# List of main object files for `run'.
SIM_RUN_OBJS = nrun.o
# Dependency of `all' to build any extra files.
SIM_EXTRA_ALL =
# Dependency of `install' to install any extra files.
SIM_EXTRA_INSTALL =
# Dependency of `clean' to clean any extra files.
SIM_EXTRA_CLEAN =
# Likewise `distclean'
SIM_EXTRA_DISTCLEAN =

# Every time a new general purpose source file was added every target's
# Makefile.in needed to be updated to include the file in SIM_OBJS.
# This doesn't scale.
# This variable specifies all the generic stuff common to the newer simulators.
# Things like sim-reason.o can't go here as the cpu may provide its own
# (though hopefully in time that won't be so).  Things like sim-bits.o can go
# here.  Some files are used by all simulators (e.g. callback.o).
# Those files are specified in LIB_OBJS below.

SIM_COMMON_HW_OBJS = \
	hw-alloc.o \
	hw-base.o \
	hw-device.o \
	hw-events.o \
	hw-handles.o \
	hw-instances.o \
	hw-ports.o \
	hw-properties.o \
	hw-tree.o \
	sim-hw.o \

SIM_NEW_COMMON_OBJS = \
	sim-arange.o \
	sim-bits.o \
	sim-close.o \
	sim-command.o \
	sim-config.o \
	sim-core.o \
	sim-cpu.o \
	sim-endian.o \
	sim-engine.o \
	sim-events.o \
	sim-fpu.o \
	sim-hload.o \
	sim-hrw.o \
	sim-io.o \
	sim-info.o \
	sim-load.o \
	sim-memopt.o \
	sim-model.o \
	sim-module.o \
	sim-options.o \
	sim-profile.o \
	sim-reason.o \
	sim-reg.o \
	sim-signal.o \
	sim-stop.o \
	sim-syscall.o \
	sim-trace.o \
	sim-utils.o \
	sim-watch.o \
	\
	$(SIM_HW_OBJS) \

# cgen-sim.h and the headers it includes
CGEN_SIM_DEPS = \
	$(srccom)/cgen-sim.h \
	$(srccom)/cgen-defs.h \
	$(srccom)/cgen-scache.h \
	$(srccom)/cgen-fpu.h \
	$(srccom)/cgen-par.h \
	$(srccom)/cgen-cpu.h \
	$(srccom)/cgen-trace.h \
	cpuall.h

# Add this to SIM_EXTRA_DEPS.
CGEN_INCLUDE_DEPS = \
	$(CGEN_SIM_DEPS) \
	$(srccom)/cgen-engine.h \
	$(srccom)/cgen-types.h \
	$(srcdir)/../../include/opcode/cgen.h

## End COMMON_PRE_CONFIG_FRAG

SIM_EXTRA_CFLAGS = -DMODET
SIM_EXTRA_LIBS = -lm

SIM_OBJS = \
	wrapper.o \
	$(SIM_NEW_COMMON_OBJS) \
	armemu26.o armemu32.o arminit.o armos.o armsupp.o \
	armvirt.o thumbemu.o \
	armcopro.o maverick.o iwmmxt.o

## COMMON_POST_CONFIG_FRAG
## COMMON_POST_CONFIG_FRAG

CONFIG_CFLAGS = \
	-DHAVE_CONFIG_H \
	$(SIM_DEFAULT_MODEL) \
	$(SIM_ALIGNMENT) \
	$(SIM_BITSIZE) \
	$(SIM_ENDIAN) \
	$(SIM_FLOAT) \
	$(SIM_HW_CFLAGS) \
	$(SIM_INLINE) \
	$(SIM_RESERVED_BITS) \
	$(SIM_SCACHE) \
	$(SIM_WARN_CFLAGS) \
	$(SIM_WERROR_CFLAGS) \
	$(SIM_HARDWARE) \
	$(SIM_EXTRA_CFLAGS) \
	$(HDEFINES) $(TDEFINES)
CSEARCH = -I. -I$(srcdir) -I../common -I$(srccom) \
  -I../../include -I$(srcroot)/include \
  -I../../bfd -I$(srcroot)/bfd \
  -I../../opcodes -I$(srcroot)/opcodes \
  
ALL_CFLAGS = $(CONFIG_CFLAGS) $(CSEARCH) $(CFLAGS)
BUILD_CFLAGS = -g -O $(CSEARCH)

COMMON_DEP_CFLAGS = $(CONFIG_CFLAGS) $(CSEARCH)

ZLIB = -L$(top_builddir)/../zlib -lz
LIBIBERTY_LIB = ../../libiberty/libiberty.a
BFD_LIB = ../../bfd/libbfd.a
LIBDL = 
OPCODES_LIB = ../../opcodes/libopcodes.a
LIBINTL = 
LIBINTL_DEP = 
CONFIG_LIBS = -ldl  $(ZLIB)
LIBDEPS = $(BFD_LIB) $(OPCODES_LIB) $(LIBINTL_DEP) $(LIBIBERTY_LIB) \
	$(SIM_EXTRA_LIBDEPS)
EXTRA_LIBS = $(BFD_LIB) $(OPCODES_LIB) $(LIBINTL) $(LIBIBERTY_LIB) \
	$(CONFIG_LIBS) $(SIM_EXTRA_LIBS) $(LIBDL)

LIB_OBJS = callback.o syscall.o targ-map.o version.o $(SIM_OBJS)

RUNTESTFLAGS =

callback_h = $(srcroot)/include/gdb/callback.h
remote_sim_h = $(srcroot)/include/gdb/remote-sim.h

all: $(SIM_EXTRA_ALL) libsim.a run$(EXEEXT) .gdbinit

libsim.a: $(LIB_OBJS)
	rm -f libsim.a
	$(AR) $(AR_FLAGS) libsim.a $(LIB_OBJS)
	$(RANLIB) libsim.a

run$(EXEEXT): $(SIM_RUN_OBJS) libsim.a $(LIBDEPS)
	$(CC) $(ALL_CFLAGS) $(LDFLAGS) -o run$(EXEEXT) \
	  $(SIM_RUN_OBJS) libsim.a $(EXTRA_LIBS)

# FIXME: Ideally, callback.o and friends live in a library outside of
# both the gdb and simulator source trees (e.g. devo/remote.  Not
# devo/libremote because this directory would contain more than just
# a library).

gentmap: Makefile $(srccom)/gentmap.c $(srccom)/nltvals.def
	$(CC_FOR_BUILD) $(srccom)/gentmap.c -o gentmap $(BUILD_CFLAGS) $(NL_TARGET)

targ-vals.h targ-map.c: stamp-tvals
stamp-tvals: gentmap
	rm -f tmp-tvals.h tmp-tmap.c
	./gentmap -h >tmp-tvals.h
	$(SHELL) $(srcroot)/move-if-change tmp-tvals.h targ-vals.h
	./gentmap -c >tmp-tmap.c
	$(SHELL) $(srcroot)/move-if-change tmp-tmap.c targ-map.c
	touch stamp-tvals

version.c: Makefile $(srcroot)/gdb/version.in $(srcroot)/bfd/version.h $(srcroot)/sim/common/create-version.sh
	$(SHELL) $(srcroot)/sim/common/create-version.sh $(srcroot)/gdb \
	    $(host_alias) $(target_alias) version.c

#
# Rules for building sim-* components.  Triggered by listing the corresponding
# .o file in the list of simulator targets.
#

sim_main_headers = \
	sim-main.h \
	$(sim-assert_h) \
	$(sim-base_h) \
	$(sim-cpu_h) \
	$(sim-engine_h) \
	$(sim-events_h) \
	$(sim-memopt_h) \
	$(sim-model_h) \
	$(sim-module_h) \
	$(sim-profile_h) \
	$(sim-trace_h) \
	$(sim-watch_h) \
	$(sim-basics_h) \
	$(SIM_EXTRA_DEPS)

# Exported version of sim_main_headers.
SIM_MAIN_DEPS = \
	$(sim_main_headers)

sim-alu_h = $(srccom)/sim-alu.h
sim-arange_h = $(srccom)/sim-arange.h
sim-assert_h = $(srccom)/sim-assert.h
sim-base_h = $(srccom)/sim-base.h \
		$(sim-module_h) \
		$(sim-trace_h) \
		$(sim-core_h) \
		$(sim-events_h) \
		$(sim-profile_h) \
		$(sim-model_h) \
		$(sim-io_h) \
		$(sim-engine_h) \
		$(sim-watch_h) \
		$(sim-memopt_h) \
		$(sim-cpu_h)
sim-basics_h = $(srccom)/sim-basics.h \
		$(sim-config_h) \
		$(callback_h) \
		$(sim-inline_h) \
		$(sim-types_h) \
		$(sim-bits_h) \
		$(sim-endian_h) \
		$(sim-signal_h) \
		$(sim-arange_h) \
		$(sim-utils_h)
sim-bits_h = $(srccom)/sim-bits.h \
		$(srccom)/sim-bits.c
sim-config_h = $(srccom)/sim-config.h
sim-core_h = $(srccom)/sim-core.h
sim-cpu_h = $(srccom)/sim-cpu.h
sim-endian_h = $(srccom)/sim-endian.h \
		$(srccom)/sim-endian.c
sim-engine_h = $(srccom)/sim-engine.h
sim-events_h = $(srccom)/sim-events.h
sim-fpu_h = $(srccom)/sim-fpu.h
sim-hw_h = $(srccom)/sim-hw.h
sim-inline_h = $(srccom)/sim-inline.h
sim-io_h = $(srccom)/sim-io.h
sim-memopt_h = $(srccom)/sim-memopt.h
sim-model_h = $(srccom)/sim-model.h
sim-module_h = $(srccom)/sim-module.h
sim-n-bits_h = $(srccom)/sim-n-bits.h
sim-n-core_h = $(srccom)/sim-n-core.h
sim-n-endian_h = $(srccom)/sim-n-endian.h
sim-options_h = $(srccom)/sim-options.h
sim-profile_h = $(srccom)/sim-profile.h
sim-signal_h = $(srccom)/sim-signal.h
sim-trace_h = $(srccom)/sim-trace.h
sim-types_h = $(srccom)/sim-types.h
sim-utils_h = $(srccom)/sim-utils.h
sim-watch_h = $(srccom)/sim-watch.h

hw-alloc_h = $(srccom)/hw-alloc.h
hw-base_h = $(srccom)/hw-base.h
hw-device_h = $(srccom)/hw-device.h
hw-events_h = $(srccom)/hw-events.h
hw-handles_h = $(srccom)/hw-handles.h
hw-instances_h = $(srccom)/hw-instances.h
hw-ports_h = $(srccom)/hw-ports.h
hw-properties_h = $(srccom)/hw-properties.h
hw-tree_h = $(srccom)/hw-tree.h

hw_main_headers = \
	$(srccom)/hw-main.h \
	$(hw-alloc_h) \
	$(hw-base_h) \
	$(hw-device_h) \
	$(hw-events_h) \
	$(hw-instances_h) \
	$(hw-handles_h) \
	$(hw-ports_h) \
	$(hw-properties_h) \

#
# Dependency tracking.  Most of this is conditional on GNU Make being
# found by configure; if GNU Make is not found, we fall back to a
# simpler scheme.
#

ifeq ($(DEPMODE),depmode=gcc3)
# Note that we put the dependencies into a .Tpo file, then move them
# into place if the compile succeeds.  We need this because gcc does
# not atomically write the dependency output file.
override COMPILE.post = -c -o $@ -MT $@ -MMD -MP \
	-MF $(DEPDIR)/$(basename $(@F)).Tpo
override POSTCOMPILE = @mv $(DEPDIR)/$(basename $(@F)).Tpo \
	$(DEPDIR)/$(basename $(@F)).Po
else
override COMPILE.pre = source='$<' object='$@' libtool=no \
	DEPDIR=$(DEPDIR) $(DEPMODE) $(depcomp) $(CC)
# depcomp handles atomicity for us, so we don't need a postcompile
# step.
override POSTCOMPILE =
endif

all_object_files = $(LIB_OBJS) $(SIM_RUN_OBJS)
generated_files = \
	$(SIM_EXTRA_DEPS) \
	hw-config.h \
	targ-map.c \
	targ-vals.h \
	version.c

# Ensure that generated files are created early.  Use order-only
# dependencies if available.  They require GNU make 3.80 or newer,
# and the .VARIABLES variable was introduced at the same time.
ifdef .VARIABLES
$(all_object_files): | $(generated_files)
else
$(all_object_files) : $(generated_files)
endif

# Dependencies.
-include $(patsubst %.o, $(DEPDIR)/%.Po, $(all_object_files))

# FIXME This is one very simple-minded way of generating the file hw-config.h
hw-config.h: Makefile.in $(srccom)/Make-common.in config.status Makefile
	rm -f tmp-hw.h
	echo "/* generated by Makefile */" > tmp-hw.h
	sim_hw="$(SIM_HW)"; \
	for hw in $$sim_hw ; do \
	  echo "extern const struct hw_descriptor dv_$${hw}_descriptor[];" ; \
	done >> tmp-hw.h
	echo "const struct hw_descriptor *hw_descriptors[] = {" >> tmp-hw.h
	sim_hw="$(SIM_HW)"; \
	for hw in $$sim_hw ; do \
	  echo "  dv_$${hw}_descriptor," ; \
	done >> tmp-hw.h
	echo "  NULL," >> tmp-hw.h
	echo "};" >> tmp-hw.h
	mv tmp-hw.h hw-config.h

test-hw-events: $(srccom)/hw-events.c libsim.a
	$(CC) $(ALL_CFLAGS) -DMAIN -o test-hw-events$(EXEEXT) \
		$(srccom)/hw-events.c libsim.a $(EXTRA_LIBS)

# CGEN support.

# For use in Makefile.in for cpu-specific files.
CGEN_MAIN_CPU_DEPS = \
	$(SIM_MAIN_DEPS) \
	$(srccom)/cgen-ops.h \
	$(srccom)/cgen-mem.h

# Support targets.

install: install-common $(SIM_EXTRA_INSTALL)

install-common: installdirs
	n=`echo run | sed '$(program_transform_name)'`; \
	$(INSTALL_PROGRAM) run$(EXEEXT) $(DESTDIR)$(bindir)/$$n$(EXEEXT)
	n=`echo libsim.a | sed s/libsim.a/lib$(target_alias)-sim.a/`; \
	$(INSTALL_DATA) libsim.a $(DESTDIR)$(libdir)/$$n ; \
	( cd $(DESTDIR)$(libdir) ; $(RANLIB) $$n )

installdirs:
	$(SHELL) $(srcdir)/../../mkinstalldirs $(DESTDIR)$(bindir)
	$(SHELL) $(srcdir)/../../mkinstalldirs $(DESTDIR)$(libdir)

check:
	cd ../testsuite && $(MAKE) check RUNTESTFLAGS="$(RUNTESTFLAGS)"

info:
clean-info:
install-info:

.NOEXPORT:
MAKEOVERRIDES=

tags etags: TAGS

# Macros like EXTERN_SIM_CORE confuse tags.
# And the sim-n-foo.h files create functions that can't be found either.
TAGS: force
	cd $(srcdir) && \
	etags --regex '/^\([[:lower:]_]+\) (/\1/' --regex '/^\/[*] TAGS: .*/' \
		*.[ch] ../common/*.[ch]

clean: $(SIM_EXTRA_CLEAN)
	rm -f *.[oa] *~ core
	rm -f run$(EXEEXT) libsim.a
	rm -f gentmap targ-map.c targ-vals.h stamp-tvals
	if [ ! -f Make-common.in ] ; then \
		rm -f $(BUILT_SRC_FROM_COMMON) ; \
	fi
	rm -f tmp-mloop.hin tmp-mloop.h tmp-mloop.cin tmp-mloop.c

distclean mostlyclean maintainer-clean realclean: clean $(SIM_EXTRA_DISTCLEAN)
	rm -f TAGS
	rm -f Makefile config.cache config.log config.status .gdbinit
	rm -f config.h stamp-h

.c.o:
	$(COMPILE) $<
	$(POSTCOMPILE)

# Dummy target to force execution of dependent targets.
force:

Makefile: Makefile.in $(srccom)/Make-common.in config.status
	CONFIG_HEADERS= $(SHELL) ./config.status

config.status: configure
	$(SHELL) ./config.status --recheck

config.h: stamp-h ; @true
stamp-h: config.in config.status
	CONFIG_FILES= CONFIG_HEADERS=config.h:config.in $(SHELL) ./config.status

.gdbinit: # config.status $(srccom)/gdbinit.in
	CONFIG_FILES=$@:../common/gdbinit.in CONFIG_HEADERS= $(SHELL) ./config.status


# CGEN support

CGENDIR = @cgendir@
CGEN = "`if [ -f ../../guile/libguile/guile ]; then echo ../../guile/libguile/guile; else echo guile ; fi` -l $(CGENDIR)/guile.scm -s"
CGENFLAGS = -v
CGEN_CPU_DIR = $(CGENDIR)/cpu

# Most ports use the files here instead of cgen/cpu.
CPU_DIR = $(srcroot)/cpu

CGEN_READ_SCM = $(CGENDIR)/sim.scm
CGEN_ARCH_SCM = $(CGENDIR)/sim-arch.scm
CGEN_CPU_SCM = $(CGENDIR)/sim-cpu.scm $(CGENDIR)/sim-model.scm
CGEN_DECODE_SCM = $(CGENDIR)/sim-decode.scm
CGEN_DESC_SCM = $(CGENDIR)/desc.scm $(CGENDIR)/desc-cpu.scm

# Various choices for which cpu specific files to generate.
# These are passed to cgen.sh in the "extrafiles" argument.
CGEN_CPU_EXTR = /extr/
CGEN_CPU_READ = /read/
CGEN_CPU_WRITE = /write/
CGEN_CPU_SEM = /sem/
CGEN_CPU_SEMSW = /semsw/

CGEN_FLAGS_TO_PASS = \
	CGEN='$(CGEN)' \
	CGENFLAGS="$(CGENFLAGS)"

# We store the generated files in the source directory until we decide to
# ship a Scheme interpreter with gdb/binutils.  Maybe we never will.

cgen-arch: force
	$(SHELL) $(srccom)/cgen.sh arch $(srcdir) \
		$(CGEN) $(CGENDIR) "$(CGENFLAGS)" \
		$(arch) "$(FLAGS)" ignored "$(isa)" $(mach) ignored \
		$(archfile) ignored

cgen-cpu: force
	$(SHELL) $(srccom)/cgen.sh cpu $(srcdir) \
		$(CGEN) $(CGENDIR) "$(CGENFLAGS)" \
		$(arch) "$(FLAGS)" $(cpu) "$(isa)" $(mach) "$(SUFFIX)" \
		$(archfile) "$(EXTRAFILES)"

cgen-defs: force
	$(SHELL) $(srccom)/cgen.sh defs $(srcdir) \
		$(CGEN) $(CGENDIR) "$(CGENFLAGS)" \
		$(arch) "$(FLAGS)" $(cpu) "$(isa)" $(mach) "$(SUFFIX)" \
		$(archfile) ignored

cgen-decode: force
	$(SHELL) $(srccom)/cgen.sh decode $(srcdir) \
		$(CGEN) $(CGENDIR) "$(CGENFLAGS)" \
		$(arch) "$(FLAGS)" $(cpu) "$(isa)" $(mach) "$(SUFFIX)" \
		$(archfile) "$(EXTRAFILES)"

cgen-cpu-decode: force
	$(SHELL) $(srccom)/cgen.sh cpu-decode $(srcdir) \
		$(CGEN) $(CGENDIR) "$(CGENFLAGS)" \
		$(arch) "$(FLAGS)" $(cpu) "$(isa)" $(mach) "$(SUFFIX)" \
		$(archfile) "$(EXTRAFILES)"

cgen-desc: force
	$(SHELL) $(srccom)/cgen.sh desc $(srcdir) \
		$(CGEN) $(CGENDIR) "$(CGENFLAGS)" \
		$(arch) "$(FLAGS)" $(cpu) "$(isa)" $(mach) "$(SUFFIX)" \
		$(archfile) ignored $(opcfile)

## End COMMON_POST_CONFIG_FRAG

armemu26.o: armemu.c armdefs.h armemu.h
	$(CC) -c $(srcdir)/armemu.c -o armemu26.o $(ALL_CFLAGS)

armemu32.o: armemu.c armdefs.h armemu.h
	$(CC) -c $(srcdir)/armemu.c -o armemu32.o -DMODE32 $(ALL_CFLAGS)
