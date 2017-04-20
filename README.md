EVOCA .v2
==========



## Get Started

* Download and Install [Vagrant][3]
* Download and Install [VirtualBox][4]
* Clone the Scotch Box [GitHub Repository](https://github.com/scotch-io/scotch-box)
* Run ``` vagrant up ```
* Access Your Project at  [http://192.168.33.10/][14]
* Run ```vagrant ssh```


## Database Access

### PostgreSQL

- Hostname: localhost or 127.0.0.1
- Username: root
- Password: root
- Database: scotchbox
- Port: 5432


## SSH Access

- Hostname: 127.0.0.1:2222
- Username: vagrant
- Password: vagrant


## Setting a Hostname

If you're like me, you prefer to develop at a domain name versus an IP address. If you want to get rid of the some-what ugly IP address, just add a record like the following example to your computer's host file.

```bash
192.168.33.10 whatever-i-want.local
```

Or if you want "www" to work as well, do:

```bash
192.168.33.10 whatever-i-want.local www.whatever-i-want.local
```

Technically you could also use a Vagrant Plugin like [Vagrant Hostmanager][15] to automatically update your host file when you run Vagrant Up. However, the purpose of Scotch Box is to have as little dependencies as possible so that it's always working when you run "vagrant up".


## Configuration

You may want to change some of the out-of-the-box configurations for
the various parts that come with Scotch Box.  To do so, `vagrant ssh`
into the box, and edit the appropriate file.  For example, to change
PHP settings:

    vagrant ssh
    sudo vim /etc/php5/apache2/conf.d/user.ini


