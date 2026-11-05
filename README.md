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

## Installation

1. Download `egg-screeps.json` from the [latest release](https://github.com/devn1x/Screeps-Egg/releases/download/release-main/egg-screeps.json) and import it into a Pterodactyl Nest of your choice

2. In the tab "Variables", set a new default value for your Steam API Key (get it at your [Steam Dev Page](https://steamcommunity.com/dev/apikey))

## Usage

When starting you have full access to the Screeps server CLI

## Updating and resetting

> [!WARNING]
> Create a backup before reinstalling a server or deleting any of its files.

The console shows a notice on start when a new egg version is available.

To update, import the new `egg-screeps.json` from the [latest release](https://github.com/devn1x/Screeps-Egg/releases/download/release-main/egg-screeps.json) into your Nest and reinstall the server.
A reinstall only replaces `init.sh`, which is managed by the egg. Manual changes to
that file need to be added back afterwards.

To reset `config.yml`, `mods.json`, `.screepsrc`, `db.json` (game world and user data)
or `assets/`, stop the server and rename or delete the file or folder. It is recreated
with its default on the next start.
