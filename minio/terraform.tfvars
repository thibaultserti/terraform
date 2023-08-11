buckets = [
  {
    name       = "loki-chunks"
    quota      = 20000000000
    expiration = "90d"
  },
  {
    name       = "loki-ruler"
    expiration = "30d"
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
  }
]
