## Custom Images - Plugin for openmediavault

This is a plugin for openmediavault 8.1.1+

It allows you to set custom images and blend modes for the login screen, the standby screen
and the shutdown screen.

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
- `Hard Light` overlays a blue tint
- `Luminosity` lowers the luminosity of the image

### Installation

Download the package from the release page and install it with `sudo dpkg -i <packagename.deb>`

### License

Feel free to copy, modify, distribute this plugin under the terms of the MIT License.

### Contributing

Bug reports, technical improvements, and pull requests are welcome.

### Disclaimer

This plugin is provided "as is", without warranty of any kind.
Always verify results and keep backups of your original media.