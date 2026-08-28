{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
      styles = {
        precommand = "fg=cyan,bold";
        command = "fg=white,bold";
        builtin = "fg=white,bold";
        alias = "fg=cyan,bold";
        "unknown-command" = "fg=pink,bold";
        default = "fg=white";
        path = "fg=white,underline";
        globbing = "fg=yellow";
        "single-hyphen-option" = "fg=magenta";
        "double-hyphen-option" = "fg=magenta";
      };
    };

    history = {
      size = 100000;
      save = 100000;
      path = "${config.home.homeDirectory}/.zsh_history";
      append = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = false;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "sudo"
        "git"
        "web-search"
        "dirhistory"
        "history"
        "z"
        "command-not-found"
        "colored-man-pages"
      ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    shellAliases = {
      nixos-switch = "cd $NIXOS_CONFIG_DIR && git add -A $NIXOS_CONFIG_DIR && git commit -m 'NixOS rebuild' && sudo nixos-rebuild switch --flake $NIXOS_CONFIG_DIR#$HOST";
      nixos-boot = "sudo nixos-rebuild boot --flake $NIXOS_CONFIG_DIR";
      nixos-rollback = "sudo nixos-rebuild switch --rollback";
      nixos-gens = "nixos-rebuild list-generations";
      nixos-test = "sudo nixos-rebuild test --flake $NIXOS_CONFIG_DIR#$HOST";
      nixos-diff = "nvd diff /nix/var/nix/profiles/system-*-link";
      nixos-clean = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system";

      nix-update = "sudo nix flake update --flake $NIXOS_CONFIG_DIR";
      nix-gc = "sudo nix-collect-garbage -d";
      nix-search = "nix search nixpkgs";
      nix-check = "nix flake check $NIXOS_CONFIG_DIR";
      nix-fmt = "alejandra $NIXOS_CONFIG_DIR";
      nix-edit = "nvim $NIXOS_CONFIG_DIR/flake.nix";
      nix-repl = "nix repl --expr 'import <nixpkgs> {}'";
      nix-store-size = "du -sh /nix/store";
      nix-optimise = "sudo nix-store --optimise";
      nix-doctor = "nix-store --verify --check-contents";

      hm-rollback = "home-manager rollback";
      hm-news = "home-manager news";
      hm-flake-edit = "nvim $NIXOS_HM_DIR/flake.nix";
      hm-edit = "nvim $NIXOS_HM_DIR/home.nix";
      hm-switch = "cd $NIXOS_HM_DIR && git add -A $NIXOS_HM_DIR && git commit -m 'Home-manager update switch' && home-manager switch --flake $NIXOS_HM_DIR";
      hm-gens = "home-manager generations";

      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gca = "git commit -a";
      gco = "git checkout";
      gb = "git branch";
      gd = "git diff";
      gl = "git log --oneline --graph -n 20";
      gp = "git push";
      gpl = "git pull";
      gf = "git fetch --all";
      gr = "git rebase";
      gst = "git stash";
      gcl = "git clone";

      ll = "ls -l";
      lh = "ls -lh";
      lla = "ls -la";
      la = "ls -a";
      lt = "ls -lt";
      lhS = "ls -lhS";
      tree = "ls --tree";
      ls = "lsd";

      py = "python3";
      pip = "pip3";
      venv = "uv python3 -m venv .venv";
      activate = "source .venv/bin/activate";

      ff = "hyfetch";
      matrix = "unimatrix";
      top = "btop";
      df = "duf";
      v = "nvim";
      s = "sudo";
      e = "exit";
      fm = "yazi";
      reload = "source ~/.zshrc";
    };

    initExtraFirst = ''
            echo """
       ▄▄▄       ███▄ ▄███▓ ███▄    █ ▓█████   ██████  ██▓ ▄▄▄
      ▒████▄    ▓██▒▀█▀ ██▒ ██ ▀█   █ ▓█   ▀ ▒██    ▒ ▓██▒▒████▄
      ▒██  ▀█▄  ▓██    ▓██░▓██  ▀█ ██▒▒███   ░ ▓██▄   ▒██▒▒██  ▀█▄
      ░██▄▄▄▄██ ▒██    ▒██ ▓██▒  ▐▌██▒▒▓█  ▄   ▒   ██▒░██░░██▄▄▄▄██
       ▓█   ▓██▒▒██▒   ░██▒▒██░   ▓██░░▒████▒▒██████▒▒░██░ ▓█   ▓██▒
       ▒▒   ▓▒█░░ ▒░   ░  ░░ ▒░   ▒ ▒ ░░ ▒░ ░▒ ▒▓▒ ▒ ░░▓   ▒▒   ▓▒█░
        ▒   ▒▒ ░░  ░      ░░ ░░   ░ ▒░ ░ ░  ░░ ░▒  ░ ░ ▒ ░  ▒   ▒▒ ░
        ░   ▒   ░      ░      ░   ░ ░    ░   ░  ░  ░   ▒ ░  ░   ▒
        ░  ░       ░            ░    ░  ░      ░   ░        ░  ░
            """

            if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
              source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
            fi

            typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
            typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
    '';

    initExtra = ''
      setopt autocd
      setopt correct
      setopt interactivecomments
      setopt magicequalsubst
      setopt nonomatch
      setopt notify
      setopt numericglobsort
      setopt promptsubst
      setopt incappendhistory

      bindkey -v

      function mkcd {
        mkdir -p -- "$1" && cd -- "$1"
      }

      function tmpcd {
        cd -- "$(mktemp -d)";
      }

      function hgrep() {
        history | grep "$1"
      }

      function lgrep() {
        ls | grep "$1"
      }

      function extract() {
        if [ -f $1 ]; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *.tar.xz)    tar xf $1      ;;
            *.xz)        xz -d $1       ;;
            *)           echo "'$1' нельзя извлечь с помощью extract()" ;;
          esac
        else
          echo "'$1' не является файлом"
        fi
      }

      pack() {
          if [[ -z "$1" || -z "$2" ]]; then
              echo "Usage: pack <archive_name.ext> <file_or_directory>"
              return 1
          fi

          local archive="$1"
          local target="$2"

          if [[ ! -e "$target" ]]; then
              echo "Error: Target '$target' does not exist."
              return 1
          fi

          case "$archive" in
              *.tar.gz|*.tgz)  tar -czvf "$archive" "$target" ;;
              *.tar.bz2|*.tbz) tar -cjvf "$archive" "$target" ;;
              *.tar.xz)        tar -cJvf "$archive" "$target" ;;
              *.zip)           zip -r "$archive" "$target" ;;
              *.7z)            7z a "$archive" "$target" ;;
              *)               echo "Unsupported extension: ''${archive##*.}" ;;
          esac
      }

      function noc() {
        echo -n "$1" | wc -m
      }

      _set_cursor() {
        echo -ne "\e[2 q"
      }
      precmd_functions+=(_set_cursor)

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
