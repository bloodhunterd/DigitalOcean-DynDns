# DigitalOcean DynDNS

## Setup

List your domain record IDs.

~~~shell
curl GET -H "Content-Type: application/json" -H "Authorization: Bearer dop_v1_xxx" https://api.digitalocean.com/v2/domains/example.com/records | json_pp
~~~

## Usage

Create a cronjob to run the script every day at 4 o'clock.

~~~
0 4 0 0 0 /digitalocean-dyndns.sh -d example.com -r 1234567890 -t dop_v1_xxx
~~~

### Options

| Option | Default | Description                         |
|:------:|---------|-------------------------------------|
| **-d** |         | The domain like `example.com`       |
| **-r** |         | The record ID like `1234567890`     |
| **-t** |         | The auth-token like `dop_v1_xxx...` |
