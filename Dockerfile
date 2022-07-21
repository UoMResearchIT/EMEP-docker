# syntax=docker/dockerfile:1.4.2

FROM oliverwoolland/wrf_intermediate:latest

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y \
                                                      python3

###############################################################################
## Set directory variables

ARG EMEP_SOURCES=/EMEP-SOURCES

WORKDIR $EMEP_SOURCES

###############################################################################
## Install EMEP

ARG TARGET_URL=https://raw.githubusercontent.com/metno/emep-ctm/tools/catalog.py
ARG EMEP_VERSION=rv4_45

RUN <<EOF_CODE
# download the catalog tool
wget $TARGET_URL

# download the source code for rv4_45 release
printf 'y\nn\n' | python3 ./catalog.py -R rv4_45 --source

EOF_CODE

WORKDIR $EMEP_SOURCES/emep-ctm-$EMEP_VERSION

RUN <<EOF_COMPILE

cat <<EOF_MAKEFILE > Makefile.docker
PROG =	emepctm
###################################################
include Makefile.SRCS
###################################################
LIBS = -lnetcdf -lnetcdff
INCL = $(nc-config --fflags)
LLIB = $(nc-config --flibs)
F90 = mpif90
F90FLAGS = -ffree-line-length-none -fdefault-real-8 -fdefault-double-8 -O2
###################################################

LDFLAGS = \$(F90FLAGS) \$(LLIB) -o \$(PROG) \$(FOBJ) \$(INCL) \$(LIBS)


.SUFFIXES: \$(SUFFIXES)  .f90

.f90.o:
	\$(F90) \$(F90FLAGS) \$(INCL) -c \$<


all:  \$(PROG)

# Include the dependency-list (created by makedepf90)
include dependencies

\$(PROG): \$(FOBJ)
	 \$(F90) \$(LDFLAGS)
#

clean: diskclean

diskclean:
	rm -f \$(PROG) *.o *.mod

##########################################################
EOF_MAKEFILE

make -f Makefile.docker all

EOF_COMPILE
