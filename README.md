# SNO Local Path Provisioner

Provide a filesystem *StorageClass* ([local-path-provisioner]) to a [SNO
(Single-Node OpenShift)] deployment. This will allow you to run applications
on SNO that require PersistentVolumes (PVs).

**This code is for lab/development/testing purposes only and is NOT intended
for production use.** Leverage [OpenShift Data Foundation] on a
highly-available OpenShift cluster for production use.

local-path-provisioner works by creating directories for PVs under
`/opt/local-path-provisioner` on the node. On CoreOS, `/opt` is a symlink under
`/var`, which is writable if specific permissions are set.

There are no safety checks with this StorageClass. You are responsible to make
sure there is approperiate space on `/var` and monitor usage to prevent
over-allocating storage space.

## Install

**NOTE: Installing requires `oc`/`kubectl` and `helm` executables in your
path.**

Before installing, make sure you are logged into OpenShift with `oc status`. If
it returns *unauthorized*, log into the cluster before continuing.

To install, clone/enter this repo and run:

```bash
$ make install
```

**The chart creates a *MachineConfig* object that can take up to 5 minutes to
deploy. Since SNO runs on a single node, the OpenShift console/API will both be
temporarily unavailable while the MachineConfig is being applied.**

Once complete, you will have a *local-path* StorageClass:

```bash
$ oc get storageclass
```

The chart does not set *local-path* as the default storage class. To set it as
the default storage class, run:

```bash
$ oc annotate storageclass local-path storageclass.kubernetes.io/is-default-class=true
```

## Troubleshooting

### PVC is still pending after install

If you had a pending PVC prior to installing local-path-provisioner you may
need to delete the PVC and recreate for the local-path StorageClass to pick up
the pending PVC and bind to a PV.

## Uninstall

I wouldn't recommend uninstalling this. If for some reason you need to, first
delete all PVCs associated with the local-path StorageClass. Then clone/enter
this repo and run:

```bash
$ make uninstall
```

The MachineConfig removal will make the OpenShift console/API temporarily
unavailable for up to 5 minutes while being applied.

## License

[![MIT license]](https://lbesson.mit-license.org/)

[local-path-provisioner]: https://github.com/rancher/local-path-provisioner
[mit license]: https://img.shields.io/badge/License-MIT-blue.svg
[openshift data foundation]:
  https://www.redhat.com/en/technologies/cloud-computing/openshift-data-foundation
[sno (single-node openshift)]:
  https://www.redhat.com/en/blog/meet-single-node-openshift-our-smallest-openshift-footprint-edge-architectures
