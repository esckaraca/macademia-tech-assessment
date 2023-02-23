# Build a static website with AWS & Cloudflare & Terraform

Amazon S3 can host static websites without a need for a 
web server and provide with secure, durable, highly scalable 
object storage we will use S3 for hosting.
We will use Cloudflare for using custom domain name and also redirect
the requests to HTTPS.

## S3 Setup

- Define the cloud provider and specify the region in provider.tf file.
- Create S3 bucket in main.tf:
  - Set a unique bucket name
  - Add a configuration resource
  - Attach a publicly readable policy
  - Provide an S3 object resource ( static files )


## Cloudflare Setup

- Make SSL/TLS encryption mode Flexible
- Create Cloudflare API token with 'Edit' permissions for Zone DNS and Page Rules.
- Create Cloudflare resource in dns.tf:
  - Retrieve Cloudflare zone ID
  - Add CNAME record that points to the domain name of the S3 bucket website
  - Add a page rule to convert http request to https using a 301 redirect

## Setup

```bash
make init
make plan
make apply
```

## Live demo

```plain
https://macademia.esckaraca.com/
```
