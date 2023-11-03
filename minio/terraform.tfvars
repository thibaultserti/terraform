buckets = [
  {
    name       = "loki-chunks"
    quota      = 20000000000
    expiration = "90d"
  },
  {
    name       = "loki-ruler"
    quota      = 20000000000
    expiration = "90d"
  },
  {
    name       = "tempo"
    quota      = 10000000000
    expiration = "90d"
  },
  {
    name       = "thanos"
    quota      = 100000000000
    expiration = "90d"
  },
  {
    name       = "ctfd"
    quota      = 10000000000
    expiration = "180d"
  }
]

users = ["loki", "tempo", "thanos", "ctfd"]
