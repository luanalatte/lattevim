{
  pkgs,
  wrapNeovim,
}:

wrapNeovim {
  pname = "lattevim";
  userConfig = ./config;

  basePackage = pkgs.neovim-unwrapped;

  startPlugins = with pkgs.vimPlugins; [
    lz-n
    nvim-lspconfig
    (nvim-treesitter.withPlugins (
      p: with p; [
        # keep-sorted start
        bash
        blade
        css
        csv
        diff
        git_rebase
        gitattributes
        gitcommit
        gitignore
        html
        javascript
        jsdoc
        json
        lua
        markdown
        markdown_inline
        nix
        php
        php_only
        phpdoc
        regex
        toml
        xml
        yaml
        # keep-sorted end
      ]
    ))
  ];

  optPlugins = with pkgs.vimPlugins; [
    # keep-sorted start
    bufferline-nvim
    catppuccin-nvim
    conform-nvim
    lualine-nvim
    mini-icons
    mini-pairs
    noice-nvim
    nui-nvim
    nvim-lint
    snacks-nvim
    which-key-nvim
    # keep-sorted end
  ];

  extraPackages = with pkgs; [
    keep-sorted
    wl-clipboard
    ripgrep # required by snacks
    fd # required by snacks

    # nix
    nixd
    nixfmt
    statix

    # php
    phpactor
    blade-formatter
  ];
}
