terraform {
  required_version = ">= 1.0.0"

  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

resource "oci_identity_compartment" "compartment" {
  compartment_id = var.compartment_parent_id
  description    = format("%s %s", "nikhil changed it for", var.compartment_description)
  name           = var.compartment_name
  enable_delete  = var.enable_compartment_delete
}

resource "time_sleep" "compartment_replication_delay" {
  depends_on      = [oci_identity_compartment.compartment]
  create_duration = "90s"
}
