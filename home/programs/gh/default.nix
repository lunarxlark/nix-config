{ pkgs, ... }: {
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
}
