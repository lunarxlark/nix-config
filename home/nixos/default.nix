{ pkgs, ... }: {
  home.username = "lunarxlark";
  home.homeDirectory = "/home/lunarxlark";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

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
    go
    nodejs
    tailscale
    nixd # language-server for Nix
    nixpkgs-fmt # formatter for Nix
  ];

  imports = [
    ../programs/git
    ../programs/gh
    ../programs/zsh
    ../programs/lazygit
    ../programs/neovim
    ../programs/bat
    ../programs/direnv
    ../programs/fzf
    ../programs/starship
    ../programs/wezterm
  ];
}
