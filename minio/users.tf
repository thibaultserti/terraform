resource "minio_iam_user" "users" {
  for_each      = toset(var.users)
  name          = each.value
  force_destroy = true
}

resource "minio_iam_policy" "policies" {
  for_each = toset(var.users)

  name   = each.value
  policy = file("policies/${each.value}.json")
}

resource "minio_iam_user_policy_attachment" "developer" {
  for_each    = toset(var.users)
  user_name   = minio_iam_user.users[each.key].id
  policy_name = minio_iam_policy.policies[each.key].id
  depends_on  = [minio_iam_policy.policies, minio_iam_user.users]
}
