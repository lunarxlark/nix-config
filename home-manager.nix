{ config, pkgs, ... }:

{
  home.username = "lunarxlark";
  home.homeDirectory = "/home/lunarxlark";
  home.stateVersion = "23.05";
  home.sessionVariables = {
    EDITOR = "nvim";
    GHQ_ROOT = "/home/lunarxlark/dev/src";
    #ASDF_CONFIG_FILE = "/home/lunarxlark/.config/asdf/config";
    #ASDF_DATA_DIR = "/home/lunarxlark/.local/share/asdf";
    #ASDF_DIR = "/home/lunarxlark/.asdf";
  };

  xdg.enable = true;

  home.packages = with pkgs; [
    gcc
    htop
    btop
    delta
    fd
    exa
    jq
    ripgrep
    tree
    watch
    obsidian
    xclip
    ghq
    slack
    zoom-us
    #asdf-vm
    tailscale
  ];

  programs.git = {
    enable = true;
    userName = "lunarxlark";
    userEmail = "lunarxlark@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    delta.enable = true;
    delta.options = {
      side-by-side = true;
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        language = "en";
        showCommandLog = false;
        showRandomTip = false;
        showListFooter = false;
        showBottomLine = false;
      };
    };
  };

  programs.gh = {
    enable = true;
    extensions = [
      pkgs.gh-dash
      pkgs.gh-eco
    ];
    settings = {
      git_protocol = "ssh";
      editor = "nvim";
      prompt = "enabled";
      pager = "bat";
      aliases = {
        co = "pr checkout";
      };
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs;[
      vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      n = "nvim";
      new = "sudo nixos-rebuild switch";
      l = "exa -la --icons --time-style long-iso";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gd = "git diff";
      gdc = "git diff --cached";
      gf = "git fetch";
      gw = "git switch";
      gl = "git log --oneline";
      gp = "git pull origin";
      ghprv = "gh pr view --web";
    };
    initExtra = builtins.concatStringsSep "\n" [
      (builtins.readFile ./function.zsh)
      #''
      #  # asdf-vm
      #  source ${pkgs.asdf-vm}/share/asdf-vm/asdf.sh
      #  fpath=(${pkgs.asdf-vm}/completions $fpath)
      #''
    ];
    #initExtra = ''
    #  source ${pkgs.asdf-vm}/share/asdf-vm/asdf.sh
    #'';
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    history = {
      save = 10000;
      size = 10000;
      share = true;
      ignorePatterns = [ "ls*" "ll*" "cd *" "pwd" "zsh" "exit" ];
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[▶](bold red)[▶](bold yellow)[▶](bold cyan)";
      };
      directory = {
        truncation_length = 1;
        truncate_to_repo = true;
        style = "fg:#8ec07c";
      };
      git_branch = {
        format = ''\[[$symbol$branch]($style)\]'';
        style = "fg:#fabd2f";
      };
      git_status = {
        format = ''([\[$all_status$ahead_behind\]]($style))'';
        style = "fg:#fb4934";
      };
      aws = {
        format = ''\[[$symbol($profile)]($style)\]'';
        style = "fg:#fe8019";
        symbol = " ";
      };
      golang = {
        format = ''\[[$symbol($version)]($style)\]'';
        style = "fg:#83a598";
        symbol = " ";
      };
      gradle = {
        format = ''\[[$symbol($version)]($style)\]'';
        version_format = "v$raw";
        symbol = "🅶";
        detect_folders = ["gradle"];
        style = "bold bright-cyan";
      };
      java = {
        format = ''\[[$symbol($version)]($style)\]'';
      };
      kotlin = {
        format = ''\[[$symbol($version)]($style)\]'';
      };
      nodejs = {
        format = ''\[[$symbol($version)]($style)\]'';
      };
      python = {
        format = ''\[[$symbol$pyenv_prefix($version)(\($virtualenv\))]($style)\]'';
        symbol = " ";
      };
      rust = {
        format = ''\[[$symbol($version)]($style)\]'';
        symbol = " ";
      };
      terraform = {
        format = ''\[[$symbol$workspace]($style)\]'';
        detect_files = [".terraform-version"];
      };
    };
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      wezterm.on('update-status', function(window, pane)
        local overrides = window:get_config_overrides() or {}
        if window:is_focused() then
          overrides.color_scheme = 'nordfox'
        else
          overrides.color_scheme = 'nightfox'
        end
        window:set_config_overrides(overrides)
      end)

      return {
        color_scheme = "nordfox",
        font_size = 10,
	      disable_default_key_bindings = true,
        window_decorations = 'RESIZE',
	      leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
	      keys = {
	        -- font size
        	  { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
	        { key = "=", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
	        -- tab
	        { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	        { key = "phys:Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	        { key = "phys:Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	        -- pane split
	        { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	        { key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	        -- pane move
	        { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	        { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	        { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	        { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	        -- pane adjust
	        { key = "H", mods = "SHIFT|SUPER", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	        { key = "J", mods = "SHIFT|SUPER", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	        { key = "K", mods = "SHIFT|SUPER", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	        { key = "L", mods = "SHIFT|SUPER", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	        -- pane zoom
	        { key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
	        -- copy
	        { key = "c", mods = "SUPER", action = wezterm.action.CopyTo("Clipboard") },
	        { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
	        -- window
	        { key = "f", mods = "SUPER|CTRL", action = wezterm.action.ToggleFullScreen },
	      }
      }
    '';
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
    };
  };

  programs.home-manager.enable = true;
}
