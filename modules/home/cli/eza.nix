{
  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    enableFishIntegration = true;

    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
      "--header" # Show header row
      "--git-ignore"
      "--icons=always"
      "--classify" # append indicator (/, *, =, @, |)
      "--hyperlink" # make paths clickable in some terminals
    ];
  };

  home.shellAliases = {
    ls = "eza";
    lt = "eza --tree --level=2";
    ll = "eza  -lh --no-user --long";
    la = "eza -lah ";
    tree = "eza --tree ";
  };
}
