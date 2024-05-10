variable "resource_record_sets" {
  type = list(object({
    name = string
    type = string
    ttl  = number
    data = list(string)
  }))
}
