sensu Cookbook
====================

This cookbook cooks sensu monitor, sensu client.

(Tthis cookbook contains only 1 node as sensu monitor and sensu client.)

How To Use
----------

```
$ git clone https://github.com/hirakiuc/sensu_cookbook.git
$ cd sensu_cookbook
$ bundle install --path .bundle
$ bundle exec berks install

1. Replace sensu ssl.json with instructions below.

2. Prepare target host

$ bundle exec knife solo prepare <user@hostname>

3. Edit your node/xxx.json just like node/monitor_server.json

$ bundle exex knife solo cook <user@hostname>
```

Requirements
------------

## Replace sensu ssl.json data bag with yours.

Create your sensu ssl.json by instructinos below and replace data_bags/sensu/ssl.json with yours.

### Generate your sensu ssl.json

```
# clone sensu-chef cookbook repository
$ git clone https://github.com/sensu/sensu-chef.git

# generate your ssl.json
$ cd sensu-chef/examples/ssl
$ ./ssl_certs.sh generate
-> generate new ssl.json
```

### Add sensu ssl.json as data bags

If you want to create sensu/ssl.json as non-encrypted data bags,

```
# create data bags by knife solo with knife-solo_data_bag gem.
$ bundle exec knife solo data bag create sensu ssl --json-file path/to/ssl.json
```

If you want to create sensu/ssl.json as encrypted data bags,

```
# Generate your secret to encrypt data bags.
$ openssl rand -base64 512 | tr -d '\r\n' > encrypted_data_bag_secret

# Create encrypted data bags with your secret.
$ bundle exec knife solo data bag create sensu ssl --json-file path/to/ssl.json --secret-file path/to/encrypted_data_bag_secret
```

#### Packages

- `sensu` - depends on [sensu-chef](https://github.com/sensu/sensu-chef) cookbook.
- `sensu_roles` - depends on [sensu_roles](https://github.com/hirakiuc/sensu_roles) cookbook.
- `uchiwa` - depends on [uchiwa](https://github.com/sensu/uchiwa-chef) cookbook.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### sensu_roles::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sensu_roles']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### sensu_roles::monitor

```json
{
  "name":"sensu_monitor",
  "run_list": [
    "recipe[sensu_roles::monitor]"
  ]
}
```

#### sensu_roles::client

```json
{
  "name":"sensu_client",
  "run_list": [
    "recipe[sensu_roles::client]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
