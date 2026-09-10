# Home Assistant Community App: APC UPS Daemon (Network)

An unexpected power outage can corrupt data or damage equipment. `apcupsd`
monitors your APC UPS and can gracefully shut down your host before the
battery runs out.

This version of the app is for network UPSs (NIS/`net` type), and is based
upon the unofficial [hassio-apcupsd][hassio-apcupsd] add-on by
[Kory Prince][korylprince].

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Configure the app, see the configuration section below.
1. Start the "APC UPS Daemon (Network)" app.
1. Check the logs of the app to see if everything went well.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
name: APC UPS
cable: ether
type: net
device: upshost:3551
extra:
  - key: KILLDELAY
    val: "10"
  - key: NISPORT
    val: "5555"
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `name`

The name reported for the UPS. Maps to the `UPSNAME` option in
`apcupsd.conf`. Defaults to `APC UPS`.

### Option: `cable`

The type of cable used to connect to the UPS. Maps to the `UPSCABLE` option
in `apcupsd.conf`. Defaults to `ether`, which is used for network UPSs.

### Option: `type`

The type of UPS being monitored. Maps to the `UPSTYPE` option in
`apcupsd.conf`. Defaults to `net`, which is used for network UPSs.

### Option: `device`

The hostname and port of the network UPS, e.g. `upshost:3551`. Maps to the
`DEVICE` option in `apcupsd.conf`. Left empty by default.

### Option: `extra`

Allows overriding any other setting in `apcupsd.conf` using a list of
`key`/`val` pairs, e.g.:

```yaml
extra:
  - key: KILLDELAY
    val: "10"
  - key: NISPORT
    val: "5555"
```

For help with configuring apcupsd itself, see the
[apcupsd manual][apcupsd-manual].

## Home Assistant configuration

Home Assistant can communicate with this app through the internal network,
using the app's slug as hostname:

```yaml
apcupsd:
  host: a0d7b954-apcupsd_net
  port: 3551
```

Make sure to also set up the [apcupsd sensor][apcupsd-integration].

## Advanced configuration

### Custom event scripts

This app supports running scripts on any of the
[apcupsd events][apcupsd-events]. Use the [Samba][samba-addon] or
[SSH][ssh-addon] app to create the scripts directory:
`/share/apcupsd_net/scripts`. Place any script you'd like to run (e.g.,
`commfailure` or `onbattery`) in this directory. The script file
**shouldn't** have a `.sh` extension.

- `apcupsd` provides scripts for the following events: `commfailure`,
  `offbattery`, `changeme`, `commok`, `onbattery`. If you provide your own
  script, it overrides the one `apcupsd` provides.
- `curl` and `openssh` are available for use in scripts.
- Even if you override an event script, `apcupsd` still performs additional
  actions on certain events, e.g., `doreboot` and `doshutdown` still reboot
  or power off the host. To prevent that action from happening, `exit 99`
  in your script. See the [apcupsd manual][apcupsd-events] for more
  information.

### Email notifications

[msmtp][msmtp] is included in the image to allow sending email from
scripts. Put your configuration in `/share/apcupsd_net/msmtprc`.

Example Gmail setup:

```text
defaults
auth           on
tls            on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
syslog         on

account        gmail
host           smtp.gmail.com
port           587
from           <your email>
user           <your username>
password       <your password>

aliases /etc/aliases

account default : gmail
```

**Note**: _Make sure to include `syslog on` so messages show up in the
app's logs._

If you use the default `apcupsd` scripts, provide an alias for `root` in
`/share/apcupsd_net/aliases`:

```text
root: <your email>
```

## Known issues and limitations

- Only one network UPS can be monitored per app instance. Install multiple
  instances of this app if you need to monitor more than one UPS.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The Home Assistant [Community Forum][forum].
- The Home Assistant [Discord chat server][discord-ha].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit].

You could also [open an issue here][issue] on GitHub.

## Authors & contributors

This app was ported from the original [hassio-apcupsd][hassio-apcupsd]
add-on by [Kory Prince][korylprince], and adapted to this repository's
conventions by [Luis Guerrero][guerrerotook].

## License

MIT License

Copyright (c) 2017 Kory Prince
Copyright (c) 2017-2026 Luis Guerrero

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=apcupsd_net&repository_url=https%3A%2F%2Fgithub.com%2Fguerrerotook%2Frepository
[apcupsd-events]: http://www.apcupsd.com/manual/manual.html#customizing-event-handling
[apcupsd-integration]: https://www.home-assistant.io/integrations/apcupsd/
[apcupsd-manual]: http://www.apcupsd.com/manual/manual.html
[discord-ha]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[guerrerotook]: https://github.com/guerrerotook
[hassio-apcupsd]: https://github.com/korylprince/hassio-apcupsd
[issue]: https://github.com/guerrerotook/repository/issues
[korylprince]: https://github.com/korylprince
[msmtp]: http://msmtp.sourceforge.net/doc/msmtp.html
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/guerrerotook/repository/releases
[samba-addon]: https://www.home-assistant.io/common-tasks/os/#samba
[semver]: https://semver.org/spec/v2.0.0.html
[ssh-addon]: https://www.home-assistant.io/common-tasks/os/#ssh
