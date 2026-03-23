module "component" {
    for_each = var.component
    source = "git::https://github.com/mayuri-mb/terraform-roboshop-component.git"
    component = each.key
    rule_priority = each.value.rule_priority
}