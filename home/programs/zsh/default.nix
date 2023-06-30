{ pkgs, ... }: {
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
}
