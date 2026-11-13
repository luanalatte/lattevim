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
        system: pkgs: {
          default = gift-wrap.legacyPackages.${system}.wrapNeovim {
            pname = "lattevim";
            userConfig = ./config;

            basePackage = pkgs.neovim-unwrapped;

            startPlugins = with pkgs.vimPlugins; [
              lz-n
              # (nvim-treesitter.withPlugins (p: [ p.nix ]))
              # nvim-lspconfig
            ];

            optPlugins = with pkgs.vimPlugins; [
              catppuccin-nvim
              mini-icons
              snacks-nvim
            ];
          };
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
