{ pkgs, ... }: {
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
        detect_folders = [ "gradle" ];
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
        detect_files = [ ".terraform-version" ];
      };
    };
  };
}
