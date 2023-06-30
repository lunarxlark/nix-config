{ pkgs, ... }: {
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
}
