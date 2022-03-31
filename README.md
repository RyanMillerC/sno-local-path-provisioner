# SNO Local Path Provisioner

Deploy [local-path-provisioner] to a [SNO (Single-Node OpenShift)] instance. This
can be used to provide a filesystem StorageClass on SNO which out-of-the-box
does not have any StorageClasses.

This repository contains instructions and Helm chart for deploying
local-path-provisioner onto a SNO instance. **This code is for
lab/development/testing purposes only and is NOT intended for production use.**
Leverage [OpenShift Data Foundation] on a full OpenShift cluster for production
use.

local-path-provisioner works by creating directories for PVs under
`/opt/local-path-provisioner`. On CoreOS, `/opt` is a symlink under `/var`. You
will need to make sure there is approperiate space on `/var` and monitor usage
to prevent over-allocating storage space.

## Deploy

This Help chart takes in no values. To deploy, run:

```
$ helm install \
    --create-namespace \
    --namespace local-path-storage \
    local-path-provisioner .
```

The chart creates a MachineConfig that takes a few minutes to deploy. The
console will be temporarily unavailable while the MachineConfig is deploying.
Once complete, you will have a `local-path` StorageClass.

The chart does not set `local-path` as the default storage class. To set it as
the default storage class, run:

```bash
$ oc annotate storageclass local-path storageclass.kubernetes.io/is-default-class=true
```

## License

[![MIT license]](https://lbesson.mit-license.org/)

[local-path-provisioner]: https://github.com/rancher/local-path-provisioner
[mit license]: https://img.shields.io/badge/License-MIT-blue.svg
[openshift data foundation]:
  https://www.redhat.com/en/technologies/cloud-computing/openshift-data-foundation
[sno (single-node openshift)]:
  https://www.redhat.com/en/blog/meet-single-node-openshift-our-smallest-openshift-footprint-edge-architectures

