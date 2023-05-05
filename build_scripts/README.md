# EMEP-docker

This build system creates a docker container for EMEP.

Main page: https://github.com/metno/emep-ctm

## Requirements

* Docker (version 18.09 or later)
* Uses the WRF `wrf_intermediate` base container
 * https://github.com/UoMResearchIT/wrf-docker

## Usage

Building the main containers, based on the `wrf_intermediate` container:
* `DOCKER_BUILDKIT=1 docker build . -t 'emep' -f Dockerfile`
