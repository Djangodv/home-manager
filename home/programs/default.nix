{ pkgs,  ... }:
{
	imports = [

		# Paths to other modules
		./firefox
		./plasma
		./git.nix
		./ssh.nix
		./alacritty.nix
		./bash.nix
		./nvim.nix
		./vscode.nix

	];
}
