resource "helm_release" "this" {
  for_each        = var.charts
  name            = each.value.release_name
  repository      = each.value.repository_url
  chart           = each.value.chart_name
  version         = each.value.chart_version
  values          = each.value.chart_overrides_file_path != null ? [file(each.value.chart_overrides_file_path)] : each.value.values
  namespace       = each.value.namespace
  timeout         = each.value.timeout
  atomic          = each.value.atomic
  cleanup_on_fail = each.value.cleanup_on_fail
  max_history     = each.value.max_history
  recreate_pods   = each.value.recreate_pods
  force_update    = each.value.force_update
  lint            = true
  dynamic "set" {
    iterator = item
    for_each = each.value.set == null ? [] : each.value.set
    content {
      name  = item.value.name
      value = item.value.value
    }
  }
  dynamic "set_sensitive" {
    iterator = item
    for_each = each.value.set_sensitive == null ? [] : each.value.set_sensitive
    content {
      name  = item.value.name
      value = item.value.value
      type  = "auto"
    }
  }
}
