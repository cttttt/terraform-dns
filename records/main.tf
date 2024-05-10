locals {
  records = flatten([
    for rrset in var.resource_record_sets : [
      for i, data in rrset.data : {
        key = "${rrset.name}-${rrset.type}-${i}-${sha1(data)}"
        value = {
          name = rrset.name,
          type = rrset.type,
          ttl  = rrset.ttl,
          data = data,
        }
      }
    ]
  ])

  records_map = {
    for record in local.records :
    record.key => record.value
  }
}

resource "terraform_data" "cloudflare_record" {
  for_each = local.records_map

  input = each.value
}
