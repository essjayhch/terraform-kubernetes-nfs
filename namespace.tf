resource kubernetes_namespace namespace {
  count = local.namespace_resources

  metadata {
    name = var.namespace
  }
}
