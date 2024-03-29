# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

//  Notes: We could make the internal domain a variable, but not sure it is
//  really necessary.

//  Create the internal DNS.
resource "aws_route53_zone" "internal" {
  name = "${var.name_tag_prefix}-openshift.local"
  comment = "OpenShift Cluster Internal DNS"
  vpc {
    vpc_id = "${aws_vpc.openshift.id}"
  }
  tags {
    Name    = "OpenShift Internal DNS"
    Project = "openshift"
  }
}

//  Routes for 'master' and 'node1'.
resource "aws_route53_record" "master-a-record" {
    zone_id = "${aws_route53_zone.internal.zone_id}"
    name = "master.${var.name_tag_prefix}-openshift.local"
    type = "A"
    ttl  = 300
    records = [
        "${aws_instance.master.private_ip}"
    ]
}
resource "aws_route53_record" "node1-a-record" {
    zone_id = "${aws_route53_zone.internal.zone_id}"
    name = "node1.${var.name_tag_prefix}-openshift.local"
    type = "A"
    ttl  = 300
    records = [
        "${aws_instance.node1.private_ip}"
    ]
}
