# resource "null_resource" "rg_type_stack" {

#   triggers = {
#     rg_types = join(",", local.rg_types[*])
#   }

#   dynamic provisioner {
#     for_each = toset(local.rg_types)

#     content = {
#       command = "echo ${jsonencode(local.rg_type_set_map["${each.value}"])}"
#     }
#   }
#   # provisioner "local-exec" {
#   #   #command = "echo ${each.value}"
#   #   command = "echo ${jsonencode(local.rg_type_set_map["${each.value}"])}"
#   # }
# }

output "rg_union" {
  value = flatten(
        [for t in toset(var.rg_types) :
        setunion(var.rg_type_set_map["${t}"])]
      )
}