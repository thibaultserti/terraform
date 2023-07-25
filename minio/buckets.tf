resource "minio_s3_bucket" "state_terraform_s3" {
  for_each = { for obj in var.buckets : obj.name => obj }
  bucket   = each.value.name
  acl      = each.value.acl
  quota    = each.value.quota
}
