resource "cloudflare_zone_settings_override" "ciphers" {
  zone_id = var.cloudflare_zone_id
  settings {
    ciphers = [
      "TLS_AES_128_GCM_SHA256",
      "TLS_AES_256_GCM_SHA384",
      "TLS_CHACHA20_POLY1305_SHA256",
      "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
      "OLD_TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256",
      "TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256",
      "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"
    ]
  }

}
