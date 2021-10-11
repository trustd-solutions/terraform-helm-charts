variable "charts" {
  description = "List of helm charts to release"
  type = map(
    object(
      {
        atomic                   = bool
        chart_name               = string
        chart_override_file_path = string
        chart_version            = string
        cleanup_on_fail          = bool
        force_update             = bool
        max_history              = number
        namespace                = string
        recreate_pods            = bool
        release_name             = string
        repository_url           = string
        timeout                  = number
        set = list(
          object(
            {
              name  = string
              value = any
            }
          )
        )
      }
    )
  )
}

variable "cluster_name" {
  description = "Name of the target cluster to install helm charts"
  type        = string
}
