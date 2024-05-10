terraform {
}

locals {
}

module "records" {
  source = "./records"

  resource_record_sets = [
    {
      name = "www.google.com"
      type = "A"
      ttl = 60
      data = [
        "1.1.1.1",
      ]
    },
    {
      name = "google.com"
      type = "A"
      ttl = 60
      data = [
        "1.1.1.1",
        "2.2.2.2",
        "3.3.3.3",
      ]
    },
  ]
}

