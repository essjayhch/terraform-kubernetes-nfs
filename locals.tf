locals {
  manage_namespace    = var.manage_namespace ? (var.namespace == "default" ? false : true) : false
  namespace_resources = local.manage_namespace ? 1 : 0
  namespace           = local.manage_namespace ? kubernetes_namespace.namespace.0.metadata.0.name : var.namespace
  name                = "gke-nfs-${var.instance}"
  storage_class       = var.manage_sc ? kubernetes_storage_class.nfs.0.metadata.0.name : "sc-nfs"
}
