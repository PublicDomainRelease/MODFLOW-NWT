###############################
# GNU MAKEFILE FOR MODFLOW-NWT
###############################
#
# :Created by: Mike Toews, GNS Science <M.Toews@gns.cri.nz>
#
# Requirements:
#  - GNU Make (tested with version 3.81)
#  - A Fortran compiler that supports at least Fortran 90 standards
#
# A typical build/install requires at least two commands.
#
# 1) Build:
#     $ make -j8
#
# 2) Install, as root (you may need to prefix with "sudo" for some systems):
#     $ make install
#
# Or to install in an alternative install prefix
#     $ make install prefix=/path/to/dir
# Or put the binaries in one place
#     $ make install bindir=/path/to/bin
#
# To build with a specific compiler, either uncomment one of the blocks
# below, or use this unmodified makefile with variables like this:
#     $ make FC=gfortran FFLAGS="-O2 -g" PROGRAM=mfnwt-gnu -j8

# Name of executable
PROGRAM = mfnwt

###########
# COMPILER
###########

## GNU Fortran
FC = gfortran

## Intel Fortran
#FC = ifort

## PGI Fortran
#FC = pgfortran

## Lahey/Fujitsu Fortran
#FC = lf95

# Define the Fortran compiler flags
FFLAGS +=


# Default install location
prefix = /usr/local
bindir = $(prefix)/bin

# Linker is the same as the Fortran compiler
LD = $(FC)

#############################################################
# This file does not normally need editing beyond this point


################
# PATTERN RULES
################

.SUFFIXES : .f .f90 .mod .inc .o

# Fortran object compile
%.o : %.f
	$(FC) -c $(FFLAGS) $< -o $@

%.o : %.f90
	$(FC) -c $(FFLAGS) $< -o $@


##########
# OBJECTS
##########

OBJECTS = \
    de47_NWT.o \
    gwf2bas7_NWT.o \
    gwf2bcf7.o \
    gwf2chd7.o \
    gwf2drn7_NWT.o \
    gwf2drt7.o \
    gwf2ets7.o \
    gwf2evt7.o \
    gwf2fhb7.o \
    gwf2gag7.o \
    gwf2ghb7_NWT.o \
    gwf2hfb7_NWT.o \
    gwf2huf7.o \
    gwf2hydmod7.o \
    gwf2ibs7.o \
    gwf2lak7_NWT.o \
    gwf2lpf7.o \
    gwf2mnw17_NWT.o \
    gwf2mnw27_NWT.o \
    gwf2mnw2i7.o \
    gwf2rch7.o \
    gwf2res7.o \
    gwf2riv7_NWT.o \
    gwf2sfr7_NWT.o \
    gwf2str7.o \
    gwf2sub7_NWT.o \
    gwf2swi27.o \
    gwf2swr7.o \
    gwf2swr7util.o \
    gwf2swt7.o \
    gwf2upw1.o \
    gwf2uzf1_NWT.o \
    gwf2wel7_NWT.o \
    gwflakmodule_NWT.o \
    gwfsfrmodule_NWT.o \
    gwfuzfmodule_NWT.o \
    hufutl7.o \
    lmt8_NWT.o \
    mach_mod.o \
    MF_NWT.o \
    mhc7.o \
    modules.o \
    nogmg.o \
    NWT1_gmres.o \
    NWT1_ilupc_mod.o \
    NWT1_module.o \
    NWT1_solver.o \
    NWT1_xmdlib.o \
    NWT1_xmd.o \
    obs2bas7.o \
    obs2chd7.o \
    obs2drn7.o \
    obs2ghb7.o \
    obs2riv7.o \
    obs2str7.o \
    parutl7.o \
    pcg7_NWT.o \
    sip7_NWT.o \
    utl7.o

##########
# TARGETS
##########

# First and default, i.e. 'make'
all : $(PROGRAM)

$(PROGRAM) : $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

###############
# DEPENDENCIES
###############

# gwfstrmodule.mod from gwf2str7.f
gwf2hydmod7.o lmt8_NWT.o obs2str7.o : gwf2str7.o 

# de4module.mod from de47_NWT.f
# pcgmodule.mod from pcg7_NWT.f
MF_NWT.o gwf2mnw17_NWT.o gwf2mnw27_NWT.o : de47_NWT.o pcg7_NWT.o 

# gwfdrtmodule.mod from gwf2drt7.f
# gwfetsmodule.mod from gwf2ets7.f
# gwffhbmodule.mod from gwf2fhb7.f
# gwfmnw1module.mod from gwf2mnw17_NWT.f
# gwfresmodule.mod from gwf2res7.f
# gwfwelmodule.mod from gwf2wel7_NWT.f
lmt8_NWT.o : gwf2drt7.o gwf2ets7.o gwf2fhb7.o gwf2mnw17_NWT.o gwf2res7.o \
    gwf2wel7_NWT.o 

# gwfuzfmodule.mod from gwfuzfmodule_NWT.f
gwf2lak7_NWT.o gwf2uzf1_NWT.o lmt8_NWT.o : gwfuzfmodule_NWT.o 

# gwfbcfmodule.mod from gwf2bcf7.f
# gwflpfmodule.mod from gwf2lpf7.f
gwf2lak7_NWT.o gwf2mnw17_NWT.o gwf2mnw27_NWT.o gwf2sfr7_NWT.o gwf2swi27.o \
    gwf2swr7.o gwf2uzf1_NWT.o lmt8_NWT.o : gwf2bcf7.o gwf2lpf7.o 

# gmgmodule.mod from nogmg.f
MF_NWT.o gwf2mnw17_NWT.o : nogmg.o 

# gwfnwtmodule.mod from NWT1_module.f
MF_NWT.o NWT1_gmres.o NWT1_solver.o NWT1_xmd.o gwf2mnw17_NWT.o \
    gwf2mnw27_NWT.o gwf2sfr7_NWT.o gwf2swr7.o gwf2upw1.o gwf2uzf1_NWT.o \
    gwf2wel7_NWT.o lmt8_NWT.o : NWT1_module.o 

# obsbasmodule.mod from obs2bas7.f
obs2chd7.o obs2drn7.o obs2ghb7.o obs2riv7.o obs2str7.o : obs2bas7.o 

# gwfghbmodule.mod from gwf2ghb7_NWT.f
lmt8_NWT.o obs2ghb7.o : gwf2ghb7_NWT.o 

# gmresmodule.mod from NWT1_gmres.f90
# ilupc_mod.mod from NWT1_ilupc_mod.f90
# xmdmodule.mod from NWT1_xmd.f
NWT1_solver.o : NWT1_gmres.o NWT1_ilupc_mod.o NWT1_xmd.o 

# machine_constants.mod from mach_mod.f90
NWT1_gmres.o NWT1_ilupc_mod.o NWT1_module.o NWT1_solver.o modules.o \
    : mach_mod.o 

# gwfupwmodule.mod from gwf2upw1.f
NWT1_solver.o gwf2lak7_NWT.o gwf2mnw17_NWT.o gwf2mnw27_NWT.o gwf2sfr7_NWT.o \
    gwf2swi27.o gwf2swr7.o gwf2uzf1_NWT.o gwf2wel7_NWT.o lmt8_NWT.o \
    : gwf2upw1.o 

# parammodule.mod from gwf2bas7_NWT.f
gwf2drt7.o gwf2hfb7_NWT.o gwf2huf7.o gwf2lpf7.o gwf2sfr7_NWT.o gwf2upw1.o \
    hufutl7.o parutl7.o : gwf2bas7_NWT.o 

# sipmodule.mod from sip7_NWT.f
MF_NWT.o gwf2mnw17_NWT.o gwf2mnw27_NWT.o gwf2sub7_NWT.o : sip7_NWT.o 

# gwfibsmodule.mod from gwf2ibs7.f
# gwfsubmodule.mod from gwf2sub7_NWT.f
gwf2hydmod7.o : gwf2ibs7.o gwf2sub7_NWT.o 

# gwfrivmodule.mod from gwf2riv7_NWT.f
lmt8_NWT.o obs2riv7.o : gwf2riv7_NWT.o 

# gwfevtmodule.mod from gwf2evt7.f
# gwfrchmodule.mod from gwf2rch7.f
MF_NWT.o lmt8_NWT.o : gwf2evt7.o gwf2rch7.o 

# gwfdrnmodule.mod from gwf2drn7_NWT.f
lmt8_NWT.o obs2drn7.o : gwf2drn7_NWT.o 

# gwflakmodule.mod from gwflakmodule_NWT.f
MF_NWT.o gwf2gag7.o gwf2lak7_NWT.o gwf2sfr7_NWT.o gwf2uzf1_NWT.o lmt8_NWT.o \
    : gwflakmodule_NWT.o 

# xmdcmn.mod from NWT1_xmdlib.f
# xmdmatrix.mod from NWT1_xmdlib.f
NWT1_xmd.o : NWT1_xmdlib.o 

# gwfsfrmodule.mod from gwfsfrmodule_NWT.f
MF_NWT.o gwf2gag7.o gwf2hydmod7.o gwf2lak7_NWT.o gwf2sfr7_NWT.o gwf2swr7.o \
    gwf2uzf1_NWT.o gwf2wel7_NWT.o lmt8_NWT.o : gwfsfrmodule_NWT.o 

# gwfmnw2module.mod from gwf2mnw27_NWT.f
gwf2mnw2i7.o lmt8_NWT.o : gwf2mnw27_NWT.o 

# gwfbasmodule.mod from gwf2bas7_NWT.f
MF_NWT.o NWT1_solver.o gwf2bcf7.o gwf2chd7.o gwf2drn7_NWT.o gwf2drt7.o \
    gwf2ets7.o gwf2evt7.o gwf2fhb7.o gwf2gag7.o gwf2ghb7_NWT.o gwf2huf7.o \
    gwf2hydmod7.o gwf2ibs7.o gwf2lak7_NWT.o gwf2lpf7.o gwf2mnw17_NWT.o \
    gwf2mnw27_NWT.o gwf2mnw2i7.o gwf2rch7.o gwf2res7.o gwf2riv7_NWT.o \
    gwf2sfr7_NWT.o gwf2str7.o gwf2sub7_NWT.o gwf2swi27.o gwf2swr7.o \
    gwf2swt7.o gwf2upw1.o gwf2uzf1_NWT.o gwf2wel7_NWT.o lmt8_NWT.o \
    obs2chd7.o : gwf2bas7_NWT.o 

# global.mod from gwf2bas7_NWT.f
MF_NWT.o NWT1_gmres.o NWT1_ilupc_mod.o NWT1_solver.o NWT1_xmd.o de47_NWT.o \
    gwf2bcf7.o gwf2chd7.o gwf2drn7_NWT.o gwf2drt7.o gwf2ets7.o gwf2evt7.o \
    gwf2fhb7.o gwf2gag7.o gwf2ghb7_NWT.o gwf2hfb7_NWT.o gwf2huf7.o \
    gwf2hydmod7.o gwf2ibs7.o gwf2lak7_NWT.o gwf2lpf7.o gwf2mnw17_NWT.o \
    gwf2mnw27_NWT.o gwf2mnw2i7.o gwf2rch7.o gwf2res7.o gwf2riv7_NWT.o \
    gwf2sfr7_NWT.o gwf2str7.o gwf2sub7_NWT.o gwf2swi27.o gwf2swr7.o \
    gwf2swt7.o gwf2upw1.o gwf2uzf1_NWT.o gwf2wel7_NWT.o lmt8_NWT.o nogmg.o \
    obs2bas7.o obs2chd7.o obs2drn7.o obs2ghb7.o obs2riv7.o obs2str7.o \
    pcg7_NWT.o sip7_NWT.o : gwf2bas7_NWT.o 

# gwfhufmodule.mod from gwf2huf7.f
MF_NWT.o gwf2lak7_NWT.o gwf2mnw17_NWT.o gwf2mnw27_NWT.o gwf2sfr7_NWT.o \
    gwf2swi27.o gwf2swr7.o gwf2uzf1_NWT.o hufutl7.o lmt8_NWT.o : gwf2huf7.o 

#########################
# CLEANUP & INSTALLATION
#########################

clean :
	rm -f $(PROGRAM)
	rm -f $(OBJECTS)
	rm -f *.mod

install : all
	install $(PROGRAM) $(bindir)

uninstall :
	cd $(bindir)
	rm -f $(PROGRAM)

.PHONY : all clean install uninstall
