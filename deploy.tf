variable "county" {
default = 2 
}
#variable "ipy" {
#default = {
#ip1 = "192.168.1.11"
#ip2 = "192.168.1.12"
#}
#}
resource "openstack_compute_instance_v2" "web" {
count = "${var.county}"
name = "${format("webkhar-%02d", count.index+1)}"
image_name = "CentOs 7.6 (XaaS) D5"
availability_zone = "nova"
region = "${var.region}"
flavor_id = "c2"
key_pair = "${var.openstack_keypair}"
security_groups = ["default"]
network {
name = "${var.tenant_network}"  
}
#user_data = "${file("bootstrapweb.sh")}" 
}
resource "openstack_networking_floatingip_v2" "myip1" {
  pool = "provider"
}
resource "openstack_networking_floatingip_v2" "myip0" {
  pool = "provider"
}
resource "openstack_compute_floatingip_associate_v2" "myip" {
  #count = "${var.county}"
  floating_ip = "${openstack_networking_floatingip_v2.myip0.address}"
  instance_id = "${openstack_compute_instance_v2.web[0].id}"
#  fixed_ip    = "${openstack_compute_instance_v2.web[count.index].network.fixed_ip_v4}"
}
resource "openstack_compute_floatingip_associate_v2" "myip2" {
  floating_ip = "${openstack_networking_floatingip_v2.myip1.address}"
  instance_id = "${openstack_compute_instance_v2.web[1].id}"
}
