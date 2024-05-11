terraform {
}

locals {
}

module "records" {
  source = "./records"

  resource_record_sets = [
    {
      name = "google.com"
      type = "A"
      ttl  = 60
      values = [
        "1.1.1.1",
        "1.1.1.1",
        "1.1.1.2",
      ]
    },
    {
      name = "www.google.com"
      type = "SRV"
      ttl  = 60
      datas = [
        {
          service  = "_sip"
          proto    = "_tls"
          name     = "terraform-srv"
          priority = 0
          weight   = 0
          port     = 443
          target   = "example1.com"
        },
        {
          service  = "_sip"
          proto    = "_tls"
          name     = "terraform-srv"
          priority = 0
          weight   = 0
          port     = 443
          target   = "example2.com"
        },
      ]
    },
  ]
}
