{ pkgs, ... }: {
  fonts = {
    fonts = with pkgs; [
      # noto
      noto-fonts
      noto-fonts-cjk
      noto-fonts-extra
      noto-fonts-emoji
      # fira-code
      fira-code
      fira-code-symbols
      # meslo
      meslo-lg
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif JP" "DejaVu Serif" ];
        sansSerif = [ "Noto Sans CJK JP" "DejaVu Sans" ];
        monospace = [ "Meslo LG M" ];
      };
    };
  };
}
