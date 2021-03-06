smartdc
=======

```
              .
              |
 .-.  .--. .-.|  .-.
: + : `--.(   | (   
 `-'  `--' `-'`- `-'

```

smartdc is Joyent's [SmartDataCenter](http://www.joyent.com/software/smartdatacenter) client and SmartDataCenter Command Line Interface.  
[Joyent CloudAPI Documentation](http://apidocs.joyent.com/sdcapidoc/cloudapi/).  


## Features

* Response content is Hash.
* Debug output Request and Response.
* Output style is Table or JSON.
* CLI is sub command style.


## Installation

```
gem install smartdc
```

## Usage

### CLI
Invoke interactive configuration.

```
$ sdc init
$ sdc dataset ls
$ sdc package ls
$ sdc machine add NAME -e DATASET_URN -p PACKAGE_NAME
$ sdc machine ls
```


#### Output JSON
JSON is set to body of response.

```
$ sdc machine ls --raw
```


#### Machine use
Set to config the Machine uuid.

```
$ sdc machine ls
$ sdc machine get UUID
$ sdc machine use UUID
$ sdc machine get
```


### Program
Hash is set to content of response.

```
require 'smartdc'

client = Smartdc.new({
  hostname: 'example.com',
  username: 'auth_user',
  password: 'auth_pass',
  version: '~6.5'
})

client.machines.all.content.each do |machine|
  p "#{machine['name']} is state at #{machine['state']}." 

  # Stop machine
  p client.machines.stop(machine['id']).status
end
```


## Tests

```
$ rake spec
```

[![Build Status](https://travis-ci.org/ogom/ruby-smartdc.png?branch=master)](https://travis-ci.org/ogom/ruby-smartdc)


## License 

* MIT
