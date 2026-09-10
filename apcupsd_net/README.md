# Home Assistant Community App: APC UPS Daemon (Network)

[![Project Stage][project-stage-shield]][project-stage-shield]
![Project Maintenance][maintenance-shield]

[![Community Forum][forum-shield]][forum]

This app gives you the ability to connect a network-attached APC UPS to
your Home Assistant instance and monitor it with the
[apcupsd integration][apcupsd-integration].

This version of the app is for network UPSs (NIS/`net` type). It is based
upon the unofficial [hassio-apcupsd][hassio-apcupsd] add-on by
[Kory Prince][korylprince].

## About

An unexpected power outage can corrupt data or damage equipment. `apcupsd`
monitors your APC UPS and can gracefully shut down your host before the
battery runs out.

This add-on also talks to the Supervisor API to reboot or power off the
host, just like `apcupsd` would if it were running directly on the host.

[apcupsd-integration]: https://www.home-assistant.io/integrations/apcupsd/
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io
[hassio-apcupsd]: https://github.com/korylprince/hassio-apcupsd
[korylprince]: https://github.com/korylprince
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
