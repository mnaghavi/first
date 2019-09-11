variable "openstack_user_name" {
description = "The username for the Tenant."
default  = "terraform" 
} 
variable "openstack_tenant_name" {
description = "The name of the Tenant."
default  = "naghavi" 
} 
variable "openstack_password" {
description = "The password for the Tenant."
default  = "1" 
} 
variable "openstack_auth_url" {
description = "The endpoint url to connect to OpenStack."
default  = "http://vip.xaas.ir:35357/v3" 
} 
variable "openstack_keypair" {
description = "The keypair to be used."
default  = "naghavi" 
}
variable "tenant_network" {
description = "The network to be used."
default  = "naghavi" 
}
variable "region" {
description = "The region to be used."
default  = "Tehran" 
}
