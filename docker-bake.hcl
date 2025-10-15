variable "PLATFORMS" {
  default = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7",
    "linux/arm/v6",
    "linux/386"
  ]
}

target "node-hello" {
  context    = "./"
  dockerfile = "Dockerfile.node-hello"
  tags       = ["node-hello"]
  platforms  = PLATFORMS
}

target "arch-detector" {
  context    = "./"
  dockerfile = "Dockerfile.arch-detector"
  tags       = ["arch-detector"]
  platforms  = PLATFORMS
}

group "default" {
  targets = ["node-hello", "arch-detector"]
}
