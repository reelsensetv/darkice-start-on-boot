# Start DarkIce Stream at Boot

Thank you to [@TuggerHosting](https://github.com/TuggerHosting) ([website](https://tuggerhosting.com)) for sharing this script and allowing [@reelsensetv](https://github.com/reelsensetv) to open-source it.

This cron job will start `darkice` at boot and check if it's still running every 5 minutes. It's configured to start streaming to an `icecast2` server on port `8000`.

The built in scripts to start DarkIce didn't seem to work in some Linux distributions so these scripts are to scratch our own itch.

## Getting Started on Ubuntu

Install dependencies:

`sudo apt install wget nano screen darkice`

```
sudo mkdir /usr/local/etc/darkice ; sudo chown -R nobody:wheel /usr/local/etc/darkice/ ; cd /usr/local/etc/darkice/ ; wget -q https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/darkice.cfg -O ; wget -q https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/darkiceserv.sh -O ; wget -q https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/startserver.sh -O ; chmod +x darkiceserv.sh ; chmod +x startserver.sh
```

`sudo crontab -e`

Append your _darkiceserv.sh start_ entry to the bottom of `crontab`:

```
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/home/
#minute hour    mday    month   wday    who     command
*/5       *       *       *       *             /usr/local/etc/darkice/darkiceserv.sh start
```

`darkice` will now start at boot and check if it's still running every 5 minutes.

*Done*.


## Getting Started on FreeBSD with `doas`

Install dependencies:

`doas pkg install doas bash screen darkice ca_root_nss nano`

```
doas mkdir /usr/local/etc/darkice ; doas chown -R nobody:wheel /usr/local/etc/darkice/ ; cd /usr/local/etc/darkice/ ; fetch https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/darkice.cfg ; fetch https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/darkiceserv.sh ; fetch https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/startserver.sh ; chmod +x darkiceserv.sh ; chmod +x startserver.sh
```

Elevate to `root` via `doas` or what ever method you use.

`doas crontab -e`

Append your _darkiceserv.sh start_ entry to the bottom of `crontab`:

```
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/home/
#minute hour    mday    month   wday    who     command
*/5       *       *       *       *             /usr/local/etc/darkice/darkiceserv.sh start
```

`darkice` will now start at boot and check if it's still running every 5 minutes.

*Done*.


## Getting Started as root

Install dependencies:

`wget`, `darkice`, `nano`, `screen`, & equivalent of `ca_root_nss` on your platform.

```
mkdir /usr/local/etc/darkice ; chown -R root:root /usr/local/etc/darkice/ ; cd /usr/local/etc/darkice/ ; wget -q https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/darkice.cfg -O ; wget -q https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/darkiceserv.sh -O ; wget -q https://raw.githubusercontent.com/reelsensetv/darkice-start-on-boot/master/startserver.sh -O ; chmod +x darkiceserv.sh ; chmod +x startserver.sh
```

`crontab -e`

Append your _darkiceserv.sh start_ entry to the bottom of `crontab`:

```
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/home/
#minute hour    mday    month   wday    who     command
*/5       *       *       *       *             /usr/local/etc/darkice/darkiceserv.sh start
```

Note, `SHELL=/bin/bash` may need to change to `SHELL=/bin/sh` if you're on a BSD.

`darkice` will now start at boot and check if it's still running every 5 minutes.

*Done*.


# What it does

Copy `darkice.cfg` to `/usr/local/etc/darkice/`.

Move `darkiceserv.sh` and `startserver.sh` into `/usr/local/etc/darkice/` and `chmod +x` them to be executable.

`crontab` will now start `darkice` at boot and check if it's still running every 5 minutes.


# Credit

These scripts are almost entirely the work of [@TuggerBrokenmice](https://github.com/TuggerBrokenmice) from [@TuggerHosting](https://github.com/TuggerHosting) ([website](https://tuggerhosting.com)).
