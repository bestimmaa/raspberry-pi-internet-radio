Raspberry Pi Internet Radio
===========================

## Hardware

* Raspberry Pi
* USB wifi dongle
* 3x illuminated physical push button
* A cheap digital picture frame (DPF)
* USB powered hub (2.5A current)

## Software

* Raspian
* MPD
* MPC
* LCD4Linux
* Node.js

## Installation

### Flashing the DPF

To enable the DPF to work with lcd4linux a custom firmware is needed.

### Compiling lcd4linux with DPF and Python plugin

Lcd4linux is a tool to control lcd displays connected to the computer. Plugins provide additonal functionality, using a DPF and accessing Python modules in this case.

## Cheat Sheet

### MPD playlist directory


Use this directory to maintain playlists. I'm used to hava a single playlist for every station (STATIONNAME.pls) and a single playlist with all of my favorite station. This way mpc can jump to a specific station with a *mpc clear* and following *mpc load STATIONNAME.pls* command. The api server uses this to change stations based on requests. 
