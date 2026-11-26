{
  description = "Custom neovim setup";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    gift-wrap = {
      url = "github:tgirlcloud/gift-wrap";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, gift-wrap, ... }:
    let
      inherit (nixpkgs) lib;

      forAllSystems =
        f: lib.genAttrs lib.systems.flakeExposed (system: f system nixpkgs.legacyPackages.${system});

    in
    {
      packages = forAllSystems (
        system: pkgs:
        let
          lattevim = import ./package.nix {
            inherit pkgs;
            inherit (gift-wrap.packages.${system}) wrapNeovim;
          };
        in
        {
          inherit lattevim;
          default = lattevim;
        }
      );

      devShells = forAllSystems (
        system: pkgs: {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              lua-language-server
              stylua
            ];
          };
        }
      );
    };
}
