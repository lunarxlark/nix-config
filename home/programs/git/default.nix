{ pkgs, ... }: {
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
}
