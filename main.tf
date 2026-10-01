# block     paramiters
# local_file os resource type
# see all provider --> https://registry.terraform.io/browse/providers
resource "local_file" "my_file" {
  # argumentsis hear -->
  filename = "keyur.txt"
  content  = "this is the first file created with terraform"

}
