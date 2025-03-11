{ pkgs, inputs, system, ... }:

{
  environment.systemPackages = with pkgs; [
    # desktop apps
    inputs.zen-browser.packages."${system}".default
    nautilus
    obs-studio
    vesktop
    spotify
    bottles
    prismlauncher

    # cli utils
    fzf
    ripgrep
    superfile
    neovim
    tree
    gh

    # miscs
    eog
    hyprshot
    wl-clipboard
  ];
}
