{ inputs, ... }:
{
  flake = {
    nixosConfigurations.thinkpad = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # Others Modules
        inputs.sops-nix.nixosModules.sops
        # Your Configuration files
        ../../systems/thinkpad.nix
        # Home Manager Module
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "bak";
            extraSpecialArgs = { inherit inputs; };

            users = {
              rafael = ../../users/rafael.nix;
            };
          };
        }
      ];
    };
  };
}
