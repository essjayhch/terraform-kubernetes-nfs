resource kubernetes_storage_class nfs {
  metadata {
    name = local.name
    namespace = local.namespace
  }

  storage_provisioner = "kubernetes.io/gce-pd"
  reclaim_policy      = "Retain"

  parameters = {
    type = "pd-standard"
  }
}
