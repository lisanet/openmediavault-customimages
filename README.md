## Custom Images - Plugin for openmediavault

This is a plugin for openmediavault 8.1.1+

It allows you to set custom images and blend modes for the login screen, the standby screen
and the shutdown screen.

The plugin uses a hook on apt to ensure, that even after an update of openmediavault, the images and
blend modes are still aplied.

To reset to default images, either use the images provided by this pluign (see below) or unintall the
plugin and reinstall openmediavault.

### Images

A set of default images provided is provided in `/usr/share/openmediavault/customimages`, named `login.jpg`,
`standby.jpg` and `shutdown.jpg`.

There are also the default images of openmediavault 8.1.0 in `/usr/share/openmediavault/customimages/default`.

For custom images, just specify the corresponding path.

New images should show up immediately. In some situations it may be necessary to clear the browser cache
and reload the page.

### Blend Modes

Set the blend mode for each image to your liking.

- `Normal` displays the image as it is
- `Hard Light` applies a blue overlay with strong contrast
- `Luminosity` applies a blue overlay more evenly, preserving the images's brightness

### Installation

Download the package from the release page and install it with 

```
sudo dpkg -i <packagename.deb>
```

### Uninstall

To uninstall the plugin, use apt to purge all of the plugins contents **and** its configuration 
files and helper scripts.

```
sudo apt purge openmediavault-customimages
```

Then reinstall openmediavault to reset the default images provide by openmediavault or wait for the next 
update of openmediavault. To reinstall openmediavault do

```
sudo apt reinstall openmediavault
```

### License

Feel free to copy, modify, distribute this plugin under the terms of the MIT License.

### Contributing

Bug reports, technical improvements, and pull requests are welcome.

### Disclaimer

This plugin is provided "as is", without warranty of any kind.
Always verify results and keep backups of your original media.