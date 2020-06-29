resource random_id suffix {
  length = 4
}
resource kubernetes_config_map exports {
  metadata {
    namespace = local.namespace
    name = "nfs-exports-${random_id.suffix.hex}"
  }

  data {
    exports = <<EOT
/exports *(rw,fsid=0,insecure,async,no_root_squash)
EOT
  }
}
