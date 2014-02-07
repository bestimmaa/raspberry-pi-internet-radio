Raspberry Pi Internet Radio
===========================

## Hardware

* Raspberry Pi
* USB wifi dongle
* 3x illuminated physical push buttons
* A cheap digital picture frame (AX206 DPF)
* USB powered hub (2.5A current)

## Software

* [Raspbian](http://www.raspbian.org)
* [MPD](http://www.musicpd.org) - Music Player Daemon
* [MPC](http://www.musicpd.org/clients/mpc/) - A client to control MPD
* [dpf-ax](http://sourceforge.net/projects/dpf-ax/) - Custom firmware for AX206 digital picture frames
* [lcd4linux](http://ssl.bulix.org/projects/lcd4linux/) - Display information on DPF
* [node.js](http://nodejs.org) - Runs the API server

## Installation

### Flashing the DPF

To enable the DPF to work with lcd4linux a custom firmware is needed. You can find the firmware and flashing tools at the [dpf-ax](http://sourceforge.net/projects/dpf-ax/files/?source=navbar) project page.

### Compiling lcd4linux with DPF and Python plugin

Lcd4linux is a tool to control LCD displays connected to the computer. A plugin system allows the additon of feautures. We use the *DPF* plugin to access digital picture frames and the *Python* plugin to call python modules from lcd4linux.

## Cheat Sheet

### MPD playlist directory

**/var/lib/mpd/playlists**

Use this directory to maintain a collection of playlists. You can use the common playlist formats like .pls and .m3u. I'm maintaining a single playlist for every station (STATIONNAME.pls) and a single playlist with all of my favorite station. This way mpc can jump to a specific station with a *mpc clear* and following *mpc load STATIONNAME.pls* command. The [API server](chrisfmserver.js) makes use of this to change stations based on requests.
