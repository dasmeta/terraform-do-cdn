/**
* Module suppose to:
1. create bucket/space
2. setup CDN
3. create ingress inside k8s
4. (optional) create DNS record
*/
module "basic" {
  source = "../.."

  # make sure bucket name is universally unique
  name   = "dasmeta-app-cdn"
  domain = "cdn.do.dasmeta.com"
  k8s    = "do-test-k8s"
}
