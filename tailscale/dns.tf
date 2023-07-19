resource "tailscale_dns_preferences" "preferences" {
  magic_dns = true
}

resource "tailscale_dns_search_paths" "search" {
  search_paths = [
    var.search_domain
  ]
}