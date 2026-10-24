<div align="center">

# 🖥️ Server Status

**A lightweight Bash script to check what's happening on your Linux system.**

Get a quick snapshot of memory, disk space, uptime, CPU count, and the processes using the most resources — right from your terminal.

<br>

![Bash](https://img.shields.io/badge/Bash-script-4EAA25?style=flat-square&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-compatible-FCC624?style=flat-square&logo=linux&logoColor=111111)
![License](https://img.shields.io/badge/license-not_set-lightgrey?style=flat-square)

</div>

---

<img src="https://github.com/zaquea/server_status/blob/58f1c80b049e97488c69a4ce5c4a152c95ddb47b/imgs/server-status-terminal-transparent.png">


## Contents

- [What it does](#-what-it-does)
- [Requirements](#-requirements)
- [Getting started](#-getting-started)
- [Usage](#-usage)
- [Example output](#-example-output)
- [Project structure](#-project-structure)
- [Why I built it](#-why-i-built-it)

## What it does

`server-status.sh` collects a few useful system details and prints them in one report. It is meant to be simple to run, easy to read, and useful for learning how to automate everyday Linux checks with Bash.

| Check | What you'll see |
| --- | --- |
| 🧠 Memory | RAM and swap usage summary |
| 💾 Disk | Usage of the root filesystem (`/`) |
| ⏱️ Uptime | How long the system has been running and its load averages |
| ⚙️ CPUs | Number of logical CPUs available to the system |
| 🔥 CPU-heavy processes | Up to five processes sorted by CPU usage |
| 📊 Memory-heavy processes | Up to five processes sorted by memory usage |
| 🧾 Memory details | A short memory summary, or the full `/proc/meminfo` listing |

## Requirements

The script is intended for Linux and uses Bash plus standard system utilities:

- `bash`
- `free`, `df`, `uptime`, and `nproc`
- `ps`, `awk`, `head`, `grep`, and `cat`
- `/proc/meminfo` for detailed memory information

These tools are available by default on many Linux distributions. Exact output can vary between systems.

## Getting started

Clone the repository and enter the project directory:

```bash
git clone https://github.com/zaquea/server_status.git
cd server_status
```

Make the script executable if needed:

```bash
chmod +x server-status.sh
```

Run the report:

```bash
./server-status.sh
```

## Usage

### Standard report

```bash
./server-status.sh
```

Prints the system overview and a short memory summary at the end.

### Full memory details

```bash
./server-status.sh --full-memory
```

Prints the same overview, followed by the complete contents of `/proc/meminfo`. This is useful when you want to inspect more than the three memory values shown in the standard report.

> **Note:** The full-memory output can be long because `/proc/meminfo` contains many kernel memory counters.

## Example output

The exact values depend on your system, but the report is organized into sections similar to this:

```text
================================
      SERVER PERFORMANCE STATS
================================

===== Memory Usage =====
...

===== Disk Usage =====
...

===== Uptime =====
...

===== Logic CPUs =====
...

===== 5 process with more CPU usage =====
...

===== 5 process with more memory usage =====
...

===== Memory Details =====
MemTotal:       ... kB
MemAvailable:   ... kB
SwapFree:       ... kB
```

## Project structure

```text
server_status/
├── server-status.sh
└── tests/
    └── server-status-tests.sh
```

## Why I built it

This is a hands-on Bash and Linux project. I’m using it to get more comfortable with shell scripting, functions, command-line arguments, and reading system information from Linux.

The goal is to keep improving it as I learn — one useful feature at a time.

---

<div align="center">

Made with Bash on Linux

</div>
