# Luis Guerrero Home Assistant Apps

![Project Stage][project-stage-shield]
![Maintenance][maintenance-shield]
[![License][license-shield]](LICENSE.md)

[![Community Forum][forum-shield]][forum]

## About

Home Assistant allows anyone to create app repositories to share their
apps for Home Assistant easily. This repository is one of those repositories,
providing extra Home Assistant apps for your installation.

The primary goal of this project is to provide you (as a Home Assistant user)
with additional, high quality, apps that allow you to take your automated
home to the next level.

## Installation

In general, there is no need to install this repository on your
Home Assistant instance. It is activated and added by Home Assistant
by default.

However, if the repository is missing on your setup, adding this apps
repository to your Home Assistant instance is pretty easy. In the
Home Assistant app store, a possibility to add a repository is provided.

Use the following URL to add this repository:

```txt
https://github.com/guerrerotook/repository
```

## Apps provided by this repository

### &#10003; [Vaultwarden][addon-vaultwarden]

![Latest Version][vaultwarden-version-shield]
![Supports armhf Architecture][vaultwarden-armhf-shield]
![Supports armv7 Architecture][vaultwarden-armv7-shield]
![Supports aarch64 Architecture][vaultwarden-aarch64-shield]
![Supports amd64 Architecture][vaultwarden-amd64-shield]
![Supports i386 Architecture][vaultwarden-i386-shield]

Open source password management solution

[:books: Vaultwarden app documentation][addon-doc-vaultwarden]

### &#10003; [APC UPS Daemon (Network)][addon-apcupsd_net]

![Latest Version][apcupsd_net-version-shield]
![Supports armhf Architecture][apcupsd_net-armhf-shield]
![Supports armv7 Architecture][apcupsd_net-armv7-shield]
![Supports aarch64 Architecture][apcupsd_net-aarch64-shield]
![Supports amd64 Architecture][apcupsd_net-amd64-shield]
![Supports i386 Architecture][apcupsd_net-i386-shield]

View information from APC Network UPSs

[:books: APC UPS Daemon (Network) app documentation][addon-doc-apcupsd_net]

## Releases

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The Home Assistant [Community Forum][forum].
- The Home Assistant [Discord Chat Server][discord-ha].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also open an issue here on GitHub. Note, we use a separate
GitHub repository for each app. Please ensure you are creating the issue
on the correct GitHub repository matching the app.

- [Open an issue for the app: Vaultwarden][vaultwarden-issue]
- [Open an issue for the app: APC UPS Daemon (Network)][apcupsd_net-issue]

For a general repository issue or app ideas [open an issue here][issue]

## Adding a new app

We are currently not accepting third party apps to this repository.

For questions, please contact [Luis Guerrero][guerrerotook]:

- Drop him an email: guerrerotook@luisguerrero.net

## License

MIT License

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

[addon-vaultwarden]: https://github.com/guerrerotook/app-vaultwarden/tree/0.27.0
[addon-doc-vaultwarden]: https://github.com/guerrerotook/app-vaultwarden/blob/0.27.0/README.md
[vaultwarden-issue]: https://github.com/guerrerotook/app-vaultwarden/issues
[vaultwarden-version-shield]: https://img.shields.io/badge/version-0.27.0-blue.svg
[vaultwarden-aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[vaultwarden-amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[vaultwarden-armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[vaultwarden-armv7-shield]: https://img.shields.io/badge/armv7-no-red.svg
[vaultwarden-i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[addon-apcupsd_net]: https://github.com/guerrerotook/repository/tree/master/apcupsd_net
[addon-doc-apcupsd_net]: https://github.com/guerrerotook/repository/blob/master/apcupsd_net/DOCS.md
[apcupsd_net-issue]: https://github.com/guerrerotook/repository/issues
[apcupsd_net-version-shield]: https://img.shields.io/badge/version-1.9.0-blue.svg
[apcupsd_net-aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[apcupsd_net-amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[apcupsd_net-armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[apcupsd_net-armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[apcupsd_net-i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[awesome-shield]: https://img.shields.io/badge/awesome%3F-yes-brightgreen.svg
[awesome]: https://awesome-ha.com
[discord-ha]: https://discord.gg/c5DvZ4e
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io
[guerrerotook]: https://github.com/guerrerotook
[gitlabci-shield]: https://gitlab.com/guerrerotook/repository/badges/master/pipeline.svg
[gitlabci]: https://gitlab.com/guerrerotook/repository/pipelines
[issue]: https://github.com/guerrerotook/repository/issues
[license-shield]: https://img.shields.io/github/license/guerrerotook/repository.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[semver]: http://semver.org/spec/v2.0.0.html