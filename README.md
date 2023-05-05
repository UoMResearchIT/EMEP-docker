# EMEP docker containers

This is a container image for the [EMEP MSC-W](https://github.com/metno/emep-ctm)
model. It is designed for use with [Common Workflow Language](https://www.commonwl.org/) 
(CWL) tool descriptors and workflows.

## Requirements

* Docker (version 18.09 or later)

## Usage

### Tool descriptors

Tool descriptors are available in the [Atmospheric Tool Library](https://github.com/UoMResearchIT/atmos-tools-library).

### Workflows

Workflows using these tools are available on [WorkflowHub](https://workflowhub.eu/) in
the [Air Quality Prediction](https://workflowhub.eu/projects/103) group.

### Container Information

The `emepctm` executable is placed within the `/usr/local/bin` directory. 
No input data is provided within the container, these should be downloaded separately. 

## Pre-built images

Images are available on the GitHub Container Repository:

* [emep](https://github.com/UoMResearchIT/EMEP-docker/pkgs/container/emep) provides the EMEP MSC-W model

## Copyright & Licensing

### EMEP MSC-W

EMEP is developed at the Norwegian Meteorological Institute and is
released under the [GNU General Public License v3](http://www.gnu.org/copyleft/gpl.html).

### Docker scripts

The docker build scripts have been developed by the [Research IT](https://research-it.manchester.ac.uk/) 
department at the [University of Manchester](https://www.manchester.ac.uk/).

Copyright 2023 [University of Manchester, UK](https://www.manchester.ac.uk/).

Licensed under the MIT license, see the LICENSE file for details.