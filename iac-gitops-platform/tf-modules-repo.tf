module "tf_modules_repo" {
  source = "../tf-modules-repo"

  repo_name   = "terraform-modules"
  description = "Collection of custom Terraform modules"
}
