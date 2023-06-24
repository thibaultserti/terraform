
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "pihole" {
  url = "https://pihole.ayanides.cloud" # PIHOLE_URL
  # Experimental, requires Pi-hole Web Interface >= 5.11.0
  api_token = var.pihole_api_token # PIHOLE_API_TOKEN
}
