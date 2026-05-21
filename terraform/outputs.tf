output "web_public_ip" {
  description = "Public IP address of the VM"
  value       = yandex_compute_instance.web.network_interface[0].nat_ip_address
}

output "service_url" {
  description = "HTTP URL for the deployed service"
  value       = "http://${yandex_compute_instance.web.network_interface[0].nat_ip_address}"
}
