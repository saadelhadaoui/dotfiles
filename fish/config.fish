set -g fish_greeting
fish_add_path ~/.local/bin

if status is-interactive
    # Auto-start the riced tmux layout (skip inside tmux, ssh, VS Code, etc.)
    if not set -q TMUX; and not set -q SSH_TTY; and test "$TERM_PROGRAM" != vscode
        exec rice
    end

    # hollow knight syntax colors
    set -g fish_color_command 8fb0ec
    set -g fish_color_param dcdfe8
    set -g fish_color_quote 7fae6e
    set -g fish_color_error c0393f
    set -g fish_color_autosuggestion 6e7891
    set -g fish_color_operator e5b45a
    set -g fish_color_comment 6e7891

    abbr -a ll 'ls -lah'
    abbr -a g git
    abbr -a ff fastfetch
end
