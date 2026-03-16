locals {
    ami_id = data.aws_ami.joindevops
    private_subnet_id = split(",",local.aws_ssm_parameter.privare_subnet_ids.value)[0]
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id
}