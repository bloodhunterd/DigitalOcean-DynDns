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

## Authors

* [BloodhunterD](https://github.com/bloodhunterd)

## License

This project is licensed under the MIT - see [LICENSE.md](https://github.com/bloodhunterd/motd/blob/master/LICENSE) file for details.

## Funding

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/bloodhunterd)
