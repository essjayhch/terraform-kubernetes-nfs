resource random_id suffix {
  byte_length = 4

  keepers = {
    var.export_options
  }
}
resource kubernetes_config_map exports {
  metadata {
    namespace = local.namespace
    name      = "nfs-exports-${random_id.suffix.hex}"
  }

  data {
    exports = <<EOT
/exports ${var.export_options}
EOT
  }
}
