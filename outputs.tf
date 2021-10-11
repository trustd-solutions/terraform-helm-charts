output "release_status" {
  description = "Block status of the deployed release"
  value       = helm_release.this.metadata
}
