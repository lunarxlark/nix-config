{
  description = "nix-config is my personal configuration.";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    allowUnfree = true;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, darwin, home-manager, ... }:
    let
      user = "lunarxlark";
    in
    {
      # my private mini-itx pc
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos

            ({ pkgs, ... }: {
              users.users.${user} = {
                isNormalUser = true;
                shell = pkgs.zsh;
                extraGroups = [ "networkmanager" "wheel" ];
              };
            })

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${user} = import ./home/nixos;
              };
            }
          ];
        };
      };
    };
}
