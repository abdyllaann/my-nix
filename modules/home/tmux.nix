{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    clock24 = true;

    plugins = [];

    extraConfig = ''
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix
      set -g mouse on
      set-option -g history-limit 5000
      set -g base-index 1
      setw -g pane-base-index 1
      set -g status-interval 1
      set -g escape-time 10
      set-option -g renumber-windows on

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      bind -r h select-pane -L
      bind -r j select-pane -D
      bind -r k select-pane -U
      bind -r l select-pane -R

      bind -n M-Left resize-pane -L
      bind -n M-Right resize-pane -R
      bind -n M-Up resize-pane -U
      bind -n M-Down resize-pane -D

      set -g status-bg colour236
      set -g status-fg colour248
      set -g status-left "#[bold] #S "
      set -g status-right "#[fg=green] %Y-%m-%d #[fg=cyan] %H:%M "

      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-yank'
      set -g @plugin 'catppuccin/tmux'
      set -g @plugin 'tmux-plugins/vim-tmux-navigator'
      set -g @plugin 'tmux-plugins/tmux-sensible'

      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '10'
      set -g @resurrect-dir '~/.local/share/tmux/resurrect'

      run-shell '~/.tmux/plugins/tpm/tpm'
    '';
  };
}
