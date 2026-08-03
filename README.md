# Screeps-Egg

[![Docker](https://github.com/Lela810/Screeps-Egg/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Lela810/Screeps-Egg/actions/workflows/docker-publish.yml)
[![License](https://img.shields.io/github/license/lela810/Screeps-Egg.svg?style=flat-square)](https://github.com/lela810/Screeps-Egg/blob/master/LICENSE)

This is a Screeps-egg for the Game Server Dashboard Pterodactyl.

## Features

- Full CLI access
- Automatic Mod install from config
- Dynamic Port allocation

## Changes in this fork

This is a Node.js 24 compatible fork of [Lela810/Screeps-Egg](https://github.com/Lela810/Screeps-Egg) with the following additional changes:

**Dockerfile**

- Switched the base image from `screepers/screeps-launcher` to `debian:trixie-slim` (Debian Trixie).
- Changed the `container` user UID from `998` to `1000` to fix the `getpwuid() can't identify your account!` error.
- Node.js is now installed via the NodeSource `setup_24.x` repository instead of the distro's `nodejs`/`npm` packages.

**GitHub Actions**

- Added a `workflow_dispatch` trigger so the image build can be started manually.
- Removed the extra `ghcr.io/lela810/screeps-egg:latest` tag.

**Egg**

- The installer now writes a `package.json` with an `allowScripts` allowlist for the packages the server needs to build. npm 12+ disables dependency install scripts by default.

## Installation

1. Import the egg-screeps.json into a Pterodactyl Nest of your choice

2. In the tab "Variables", set a new default value for your Steam API Key (get it at your [Steam Dev Page](https://steamcommunity.com/dev/apikey))

## Usage

When starting you have full access to the Screeps server CLI
