resource "aws_cognito_identity_pool" "unauth" {
  identity_pool_name               = "Unauthenticated Access to Kinesis"
  allow_unauthenticated_identities = true
}


resource "aws_cognito_identity_pool_roles_attachment" "main" {
  identity_pool_id = "${aws_cognito_identity_pool.unauth.id}"

  roles {
    "unauthenticated" = "${aws_iam_role.unauthenticated.arn}"
    "authenticated"   = "${aws_iam_role.authenticated.arn}"
  }
}