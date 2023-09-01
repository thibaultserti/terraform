buckets = [
  {
    name       = "loki-chunks"
    quota      = 20000000000
    expiration = "90d"
  },
  {
    name       = "tempo"
    quota      = 100000000000
    expiration = "90d"
  },
  {
    name       = "mimir"
    quota      = 20000000000
    expiration = "90d"
  },
  {
    name       = "thanos"
    quota      = 100000000000
    expiration = "7d"
  },
  {
    name       = "ctfd"
    quota      = 10000000000
    expiration = "180d"
  }
]
