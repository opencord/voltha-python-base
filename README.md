# DEPRECATED

[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

`VOLTHA 2.6` was the last release that officially used python in any of the VOLTHA components.
From `2.7` onwards no VOLTHA component is in python, thus the repo has been deprecated, the go libraries are in [voltha-lib-go](https://github.com/opencord/voltha-lib-go). This codebase is going to be removed after the VOLTHA 2.8 release LTS support ends in December 2022.

# voltha-python-base

Ubuntu image with Python and pip packages as a generic base for VOLTHA 2.x
containers.  This exists because build duplication of the same apt
and pip install dependencies cause needless build delay times.  Also this
guarantees a consistent set of dependencies needed for stability.

By making a base image the compilation time is avoided and having a shared base
image can speed image downloads.

## Characteristics

- Has *no VOLTHA-specific code* and it's own `VERSION` independent of VOLTHA
  development, so changes will happen more slowly, only when Ubuntu, Python or included
  packages have new releases.

- Installed via `apt`:
  - Standard toolchain (gcc, make, etc.) for building native extensions in Python
  - Libraries to build dependencies - libpcap-dev, python-dev, libressl, libffi
  - python2, pip, setuptools

- Installed via `pip`:
  - gRPC python libraries, and googleapi common protobuf definitions
  - kafkaloghandler
  - PyYAML
  - etcd
  - Twisted
  - among others...

## Building

Run `make build` to build the container image, `make push` to send to a
registry.

## Testing

Currently the only test is to perform a container image build.
