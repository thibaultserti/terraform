buckets = [
  {
    name       = "loki-chunks"
    quota      = 20000000000
    expiration = "90d"
  },
  {
    name       = "tempo"
    quota      = 20000000000
    expiration = "90d"
  },
  {
    name       = "mimir"
    quota      = 20000000000
    expiration = "90d"
  },
  {
    name       = "thanos"
    quota      = 20000000000
    expiration = "90d"
  }
]
