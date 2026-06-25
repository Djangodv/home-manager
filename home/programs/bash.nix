{ pkgs, ... }:
{

  programs.bash = {
    enable = true;

    shellAliases = {
      exp-idf = ". $HOME/esp/esp-idf/export.sh";
      nix-run = "sudo nixos-rebuild switch --no-build-output --impure --flake ~/Github/nixos#nixos-demo";
      gs = "git status";
			gz-run = "sudo x11docker --network --xephyr --gpu -i -- --volume ~/Github/team-waterbenders/workspace/:/workspace/ -- s4_2026:6 bash";
    };

    # Extra commands that should be placed in ~/.bashrc.
    bashrcExtra = ''
      # Set up fzf key bindings and fuzzy completion
      eval "$(fzf --bash)"
    '';

    # Extra commands that should be run when initializing an interactive shell.
    initExtra = ''
      gsync () {

        if ! git pull; then
          return 1
        fi

        git add .
        git commit -am "Manual sync"

        read -r -p "Continue pushing all changes? (y/n): " confirm
        if [[ $confirm = "y" ]]; then
          git push
          echo "Succefully pushed all changes. "
        else
          echo "Canceled. "
        fi

      }
    '';

  };

}
