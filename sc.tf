resource kubernetes_storage_class nfs {
  metadata {
    name = "sc-nfs-${local.namespace}-${var.instance}"
  }

  storage_provisioner = "kubernetes.io/gce-pd"
  reclaim_policy      = "Retain"

  parameters = {
    type             = var.pd_type
    replication-type = var.replication_type
  }
}
