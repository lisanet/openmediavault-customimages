# openmediavault Custom Images Plugin

A plugin for **openmediavault 8.1.1+** that allows you to set custom images and blend modes for the login, standby, and shutdown screens.

The plugin uses an **APT hook** to ensure that custom images and blend modes remain applied even after openmediavault updates.

## Features

* Custom images for:

  * Login screen
  * Standby screen
  * Shutdown screen
* Adjustable blend modes for each screen
* Persistent configuration using an APT hook (survives openmediavault updates)
* Includes default image set

## Images

A set of images is included in:

`/usr/share/openmediavault/customimages`

Files:

* `login.jpg`
* `standby.jpg`
* `shutdown.jpg`

The original images from **openmediavault 8.1.0** are available in:

`/usr/share/openmediavault/customimages/default`

To use custom images, simply specify the desired file path.

New images should appear immediately. If they do not, clear your browser cache and reload the page.

## Blend Modes

You can select a blend mode for each image:

| Mode       | Description                                               |
| ---------- | --------------------------------------------------------- |
| Normal     | Displays the image without modification                   |
| Hard Light | Applies a blue overlay with high contrast                 |
| Luminosity | Applies a blue overlay while preserving brightness        |

## Installation

Download the `.deb` package from the **Releases** page and install it:

```
sudo dpkg -i <packagename.deb>
```

## Uninstall

To completely remove the plugin including configuration files and helper scripts, run:

```
sudo apt purge openmediavault-customimages
```

Afterwards, reinstall openmediavault to restore the default images, or wait for the next openmediavault update.
To reinstall openmediavault manually:

```
sudo apt reinstall openmediavault
```

## Screenshot

To give you an impression of the plugins UI:

![Screenshot](screenshot.jpg)

## License

This project is licensed under the **MIT License**.

## Contributing

Bug reports, feature suggestions, and pull requests are welcome.

## Disclaimer

This plugin is provided **"as is"**, without warranty of any kind.

Always verify the results and keep backups of your original media.
