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
    # (nvim-treesitter.withPlugins (p: [ p.nix ]))
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
    snacks-nvim
    which-key-nvim
    # keep-sorted end
  ];

  extraPackages = with pkgs; [
    keep-sorted
    wl-clipboard
    ripgrep

    # nix
    nixd
    nixfmt
  ];
}
