data "cloudflare_zones" "domain" {
  filter {
    name = var.site_domain
  }
}

resource "cloudflare_record" "site_cname" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = var.subdomain
  value   = aws_s3_bucket_website_configuration.bucket_config.website_endpoint
  type    = "CNAME"

  ttl     = 1
  proxied = true
}