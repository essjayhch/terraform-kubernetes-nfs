output ip {
  description = "IP of service"

  value = kubernetes_service.nfs.spec.0.cluster_ip
}

output service_name {
  description = "Service Name"

  value = kubernetes_service.nfs.metadata.0.name
}

output namespace {
  value = local.namespace
}


output export_path {
  value = var.export_path
}
