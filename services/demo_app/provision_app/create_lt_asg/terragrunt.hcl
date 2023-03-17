include "root" {
  path = find_in_parent_folders()
}
dependencies {
  paths = ["../create_alb","../create_aurora_rds"]
}