buckets = [
  {
    name       = "loki-chunks"
    quota      = 20000000000
    expiration = "30d"
  },
  {
    name       = "loki-ruler"
    expiration = "30d"
  },
  {
    name       = "tempo"
    quota      = 20000000000
    expiration = "30d"
  }
]
