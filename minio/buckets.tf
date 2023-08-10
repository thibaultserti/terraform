resource "minio_s3_bucket" "state_terraform_s3" {
  for_each = { for obj in var.buckets : obj.name => obj }
  bucket   = each.value.name
  acl      = each.value.acl
  quota    = each.value.quota
}

resource "minio_ilm_policy" "policy" {
  for_each = { for obj in var.buckets : obj.name => obj }
  bucket   = minio_s3_bucket.state_terraform_s3[each.value.name].id
  rule {
    id         = "expire"
    expiration = each.value.expiration
  }
}
