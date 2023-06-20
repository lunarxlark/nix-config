{ config, pkgs, ... }:

{
  home.username = "lunarxlark";
  home.homeDirectory = "/home/lunarxlark";
  home.stateVersion = "23.05";
  home.sessionVariables = {
    EDITOR = "nvim";
    GHQ_ROOT = "/home/lunarxlark/dev/src";
  };

  xdg.enable = true;

  home.packages = [
    pkgs.htop
    pkgs.btop
    pkgs.delta
    pkgs.fd
    pkgs.exa
    pkgs.jq
    pkgs.ripgrep
    pkgs.tree
    pkgs.watch
    pkgs.obsidian
    pkgs.xclip
    pkgs.ghq
    pkgs.slack
    pkgs.zoom-us
    pkgs.asdf-vm
    pkgs.tailscale
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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs; [
      vimPlugins.nightfox-nvim
      vimPlugins.gruvbox-nvim
    ];
    extraConfig = ''
      colorscheme nordfox
      set clipboard+=unnamedplus
    '';
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
      gw = "git switch";
      gl = "git log";
    };
    initExtra = builtins.readFile ./function.zsh;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    history = {
      save = 10000;
      size = 10000;
      share = true;
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

  programs.gh = {
  enable = true;
    extensions = [
      pkgs.gh-dash
      pkgs.gh-eco
    ];
  };

  programs.starship = {
    enable = true;
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = "nordfox",
        font_size = 10,
	disable_default_key_bindings = true,
	leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
	  -- font size
  	  { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize, },
	  { key = "=", mods = "SUPER", action = wezterm.action.IncreaseFontSize, },
	  -- tab
	  { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain"), },
	  { key = "phys:Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1), },
	  { key = "phys:Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1), },
	  -- pane split
	  { key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }), },
	  { key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }), },
	  -- pane move
	  { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left"), },
	  { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down"), },
	  { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up"), },
	  { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right"), },
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
