# Dockerfiles

See https://cloud.docker.com/app/bepsays/repository/list

To build and install a new version:

```bash
version=1.21900.20000 make install
```

This version uses the [semverpair](https://github.com/bep/semverpair) versioning scheme for its Docker tags, using the major version from the main upstream dependency, e.g. `v1.21800.20300` is the first version with Go `v1.18.3`.