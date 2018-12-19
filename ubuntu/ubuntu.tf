# Configure vSphere provider
provider "vsphere" {
        vsphere_server = "${var.vsphere_vcenter}"
        user = "${var.vsphere_user}"
        password = "${var.vsphere_password}"
        allow_unverified_ssl = "${var.vsphere_unverified_ssl}"
}


# Create a vSphere VM
resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}"
  resource_pool_id = "${data.vsphere_resource_pool.resource_pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "${var.vm_cpu}"
  memory   = "${var.vm_memory}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  enable_disk_uuid = "true"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0" 
    size = "${data.vsphere_virtual_machine.template.disks.0.size}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vm_name}"
        domain    = "${var.virtual_machine_domain}"
        time_zone = "${var.vsphere_time_zone}"
      }

      network_interface {
        ipv4_address = "${var.vsphere_ipv4_address}"
        ipv4_netmask = "${var.vsphere_ipv4_netmask}"
      }

      ipv4_gateway    = "${var.vsphere_ipv4_gateway}"
      dns_server_list = "${var.vsphere_dns_servers}"
    }
  }
}
