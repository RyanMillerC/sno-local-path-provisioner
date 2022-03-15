# SNO Local Path Provisioner

Deploy [local-path-provisioner] to a [SNO (Single-Node OpenShift)] instance. This
can be used to provide a filesystem StorageClass on SNO which out-of-the-box
does not have any StorageClasses.

This repository contains instructions and Helm chart for deploying
local-path-provisioner onto a SNO instance. **This code is for
lab/development/testing purposes only and is NOT intended for production use.**
Leverage [OpenShift Data Foundation] on a full OpenShift cluster for production
use.

## Deploy

This Help chart takes in no values. To deploy, run:

```
$ helm install local-path-provisioner .
```

## License

[![MIT license]](https://lbesson.mit-license.org/)

[locah-path-provisioner]: https://github.com/rancher/local-path-provisioner
[mit license]: https://img.shields.io/badge/License-MIT-blue.svg
[sno (single-node openshift)]:
  https://www.redhat.com/en/blog/meet-single-node-openshift-our-smallest-openshift-footprint-edge-architectures

