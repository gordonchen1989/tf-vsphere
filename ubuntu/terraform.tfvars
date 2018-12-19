# vCenter connection
vsphere_vcenter = "192.168.40.100"
vsphere_user = "administrator@vsphere.local"
vsphere_password = "Junschen1989!"
vsphere_unverified_ssl = "true"

# VM specifications
vsphere_datacenter = "Datacenter"
vsphere_resource_pool = "terraform"
vsphere_vm_template = "ubuntu-template"
vsphere_cluster = "Physic-Cluster"
vsphere_datastore = "SSD-Datastore"
vsphere_port_group = "internal-10.10.10.0"
#vsphere_ipv4_address = "10.10.10.11"
vsphere_ipv4_netmask = "24"
vsphere_ipv4_gateway = "10.10.10.254"
vsphere_dns_servers = ["192.168.40.96"]
vsphere_time_zone = "Asia/Shanghai"
virtual_machine_domain = "ubuntu-test"
 

#vm_name = "ubuntu-test"
vm_cpu = "2"
vm_memory = "2048"
