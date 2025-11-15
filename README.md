# archlinux-pacman
get more out of pacman

<details>
<summary>pacman hook pakets</summary>

The script pacman_hook_pakets.sh writes a log file in Markdown format.
The script is executed during install/upgrade/remove actions via a pacman hook.
The currently installed packages and flatpaks are logged.
![pacman-hook-log](pacman-hook-pakets/pacman_hook_pakets.png)
</details>
<details>
<summary>pacman auto update</summary>

If you want your Arch Linux (or Manjaro etc.) to automaticly install new updates, you can use these files.

* Copy `auto-pacman-update.sh` to `/usr/local/bin/`
* Copy `auto-pacman-update.service` & `auto-pacman-update.timer` to `/etc/systemd/system/`
</details>
