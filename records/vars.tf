variable "resource_record_sets" {
  type = list(object({
    name = string
    type = string
    ttl  = number

    # todo: define the full schema for these
    datas  = optional(list(map(any)), [])
    values = optional(list(string), [])
  }))

  # todo: add a validation
}
