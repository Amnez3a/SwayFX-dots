{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      ...
    }:
    {

      homeConfigurations."amnez3a" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./home.nix

          catppuccin.homeModules.catppuccin
        ];
      };
    };
}
