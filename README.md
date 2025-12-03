# tmux-containers

```
up(5) ram(2.3GB) disk(15.7GB) 
```

A tmux plugin that displays Docker container information in your status line.

## Features

- 📊 Shows Docker memory usage 
- 💾 Displays Docker total disk usage
- 🐳 Shows count of active Docker containers

## Installation

### With TPM

1. Add the plugin to your `.tmux.conf`:

```tmux
set -g @plugin 'lfv89/tmux-containers'
```

2. Add the `#{containers}` placeholder to your status line. For example:

```tmux
set -g status-right "#{containers}"
```

3. Press `prefix + I` to install the plugin (default prefix is `Ctrl-b`)

4. Reload your tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```

### Without TPM

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
set -g status-right "#{containers}"
```

4. Reload your tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```
