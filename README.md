# tmux-containers

A tmux plugin that displays Docker container information in your status line.

<img width="685" height="36" alt="image" src="https://github.com/user-attachments/assets/9d02dd18-6c76-4f1a-b0ba-78becaa1063a" />


## Features

- 🐳 Shows count of active Docker containers
- 📊 Shows Docker memory usage 
- 💾 Displays Docker total disk usage

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
