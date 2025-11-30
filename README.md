# tmux-containers

A tmux plugin that displays Docker container information in your status line.

## Features

- 📊 Shows Docker memory usage (RAM)
- 💾 Displays total disk usage by Docker
- 🐳 Shows count of active containers
- ⚡ Automatically handles Docker daemon availability
- 🔌 Works seamlessly with TPM (Tmux Plugin Manager)

## Example Output

```
up(5) ram(2.3/16GB) disk(15.7GB) 
```

## Requirements

- tmux 1.9 or higher
- Docker
- [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm)

## Installation

### Using TPM (recommended)

1. Add the plugin to your `.tmux.conf`:

```tmux
set -g @plugin 'lfv89/tmux-containers'
```

2. Add the `#{containers}` placeholder to your status line. For example:

```tmux
set -g status-right "#{containers} | %H:%M %d-%b-%y"
```

3. Press `prefix + I` to install the plugin (default prefix is `Ctrl-b`)

4. Reload your tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```

### Manual Installation

1. Clone the repository:

```bash
git clone https://github.com/lfv89/tmux-containers ~/.tmux/plugins/tmux-containers
```

2. Add to your `.tmux.conf`:

```tmux
run-shell ~/.tmux/plugins/tmux-containers/containers.tmux
```

3. Add the `#{containers}` placeholder to your status line:

```tmux
set -g status-right "#{containers} | %H:%M %d-%b-%y"
```

4. Reload your tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```

## Usage

Once installed, the plugin will automatically replace the `#{containers}` placeholder in your status line with Docker container statistics.

### Basic Configuration

Add the placeholder anywhere in your `status-right` or `status-left`:

```tmux
set -g status-right "#{containers}"
```

### Advanced Configuration

You can customize the display format using the `@containers_format` option:

```tmux
# Custom format with different styling
set -g @containers_format "#[fg=cyan]Docker:#[fg=white] #(/path/to/containers.sh)"
```

However, the default format works well out of the box and doesn't require customization.

## What It Displays

The plugin shows three key metrics:

1. **RAM Usage**: Current Docker memory usage vs total system memory
2. **Disk Usage**: Total disk space used by Docker (images, containers, volumes)
3. **Active Containers**: Number of currently active containers

If Docker is not active or available, it displays `N/A`.

## Customization Example

Here's a complete example with styled status line:

```tmux
set -g status-right "#[fg=yellow]  #[fg=white]#{containers}  #[fg=yellow]󰥔 #[fg=white]%H:%M:%S"
```

## Troubleshooting

### Plugin not showing

1. Make sure Docker is active and accessible
2. Verify the plugin is installed: `ls ~/.tmux/plugins/tmux-containers`
3. Check that you've added `#{containers}` to your status line
4. Try manually running: `~/.tmux/plugins/tmux-containers/scripts/containers.sh`
5. Reload tmux config: `tmux source-file ~/.tmux.conf`

### "N/A" displayed

This means Docker is either not active or not accessible. Check:
- Docker daemon is active: `docker info`
- You have permissions to access Docker

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

MIT

## Author

Created by [lfv89](https://github.com/lfv89)
