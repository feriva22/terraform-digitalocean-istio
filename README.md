For run use environment variable as Personal Access Token (PAT) from DigitalOcean

> `export DIGITALOCEAN_TOKEN={paste your PAT in here}`

> `terraform init`
> `terraform plan -var "do_token=${DIGITALOCEAN_TOKEN}"`
> `terraform validate`
> `terraform apply -var "do_token=${DIGITALOCEAN_TOKEN}"`

For delete the resource
> `terraform destroy -var "do_token=${DIGITALOCEAN_TOKEN}"`