resource kubernetes_storage_class nfs {
  count = var.manage_sc ? 1 : 0
  metadata {
    name = "sc-nfs"
  }

  storage_provisioner = "kubernetes.io/gce-pd"
  reclaim_policy      = "Retain"

  parameters = {
    type             = var.pd_type
    replication-type = var.replication_type
  }
}
