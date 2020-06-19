output ip {
  description = "IP of service"

  value = kubernetes_service.nfs.cluster_ip
}

output service_name {
  description = "Service Name"

  value = kubernetes_service.nfs.metadata.0.name
}
