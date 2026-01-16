{
  perSystem =
    { pkgs, ... }:
    {
      devShells.rust = pkgs.mkShell {
        shellHook = ''${pkgs.zsh}/bin/zsh'';
        buildInputs = with pkgs; [
          cargo
          rustc
          clippy
        ];
      };
      devShells.ts = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs_24
          nodePackages.typescript
        ];
      };
    };
}
