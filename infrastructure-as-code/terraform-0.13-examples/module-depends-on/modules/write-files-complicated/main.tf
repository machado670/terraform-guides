# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_version = ">= 0.13.0"
}

resource "local_file" "apple" {
    content     = "apple"
    filename = "${path.root}/apple.txt"
}

resource "local_file" "banana" {
    content     = "banana"
    filename = "${path.root}/banana.txt"
}

resource "local_file" "orange" {
    content     = "orange"
    filename = "${path.root}/orange.txt"
}

output "write_done" {
  value = "apples, bananas, and oranges"
}
