{ config, pkgs, ... }: {
  # how to load ./profile
  #home.file."./config/fcitx5/profile".source = "./profile";

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-mozc ];
  };
}
