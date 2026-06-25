{ pkgs, inputs, config, cfg, ... }:
let
  neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
in
{
  programs.neovim = {
    enable = true; 
    # Enable sideloading `init.lua` (useful if you want to manage your own configuration imperatively)
    # Fix: https://discourse.nixos.org/t/neovim-error-installing-file-outside-home/77225
    sideloadInitLua = true;
    package = neovim-nightly;
		viAlias = true;
		vimAlias = true;
    # package = inputs.nvim.packages.${pkgs.system}.default;
    plugins = with pkgs.vimPlugins; [
      # LSP server configurations
      # nvim-lspconfig
      # mason-nvim
      # mason-lspconfig-nvim # Bridge mason & lspconfig
      # markdown-preview-nvim
      # gitsigns-nvim
      # kanagawa-nvim
			nvim-treesitter
			nvim-treesitter-parsers.json
    ];
  };

  xdg.configFile."nvim" = {
		source = config.lib.file.mkOutOfStoreSymlink "${cfg.projectRoot}/nvim";
    recursive = true;
    force = true;
  };

	home.packages = with pkgs; [
		pyright
		lua-language-server
		llvmPackages_20.clang-tools
		tree-sitter # Needed for 'nvim-dev-container'
		# bat
		tree-sitter-grammars.tree-sitter-json
		vscode-json-languageserver
	];
	
}
