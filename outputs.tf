output "instance" {
  value = aws_instance.web_server
}

output "subnet" {
  value = module.networking.subnet
}

output "security_group" {
  value = module.networking.security_group
}