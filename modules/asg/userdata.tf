data "template_file" "cloud_init" {
  template = "${path.module}/cloud-init.yml" 
}