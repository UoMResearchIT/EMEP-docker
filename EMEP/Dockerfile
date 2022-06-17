FROM ubuntu:20.04

###############################################################################
## Install requirements

RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
                      apt-get install -y \ 
                                      nano \
                                      wget \
                                      python3

###############################################################################
## Set directory variables

WORKDIR /EMEP

###############################################################################
## Install EMEP

# download the catalog tool
RUN wget https://raw.githubusercontent.com/metno/emep-ctm/tools/catalog.py

# make it executable and run it
RUN chmod +x catalog.py

# download the source code for rv4_45 release
RUN printf 'y\nn\n' | python3 catalog.py -R rv4_45 --source