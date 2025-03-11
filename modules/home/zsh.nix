{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
        sv = "sudo nvim";
        v = "nvim";
        c = "clear";
        
	# nh
	sw = "nh os switch";
        upd = "nh os switch --update";

        ".." = "cd ..";
    };
  };
}
