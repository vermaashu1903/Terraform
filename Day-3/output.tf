output "bastion_instance_public_ip" {
  value = module.bastion_instance.instance_public_ip
}

output "testing_instance_public_ip" {
  value = module.testing_instance.instance_public_ip
}